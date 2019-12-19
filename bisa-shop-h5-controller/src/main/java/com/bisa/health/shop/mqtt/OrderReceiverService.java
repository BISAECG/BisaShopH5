package com.bisa.health.shop.mqtt;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.amqp.core.Message;
import org.springframework.amqp.rabbit.core.ChannelAwareMessageListener;
import org.springframework.beans.factory.annotation.Autowired;

import com.bisa.health.common.sms.utils.SmsUtils;
import com.bisa.health.shop.component.InternationalizationUtil;
import com.bisa.health.shop.component.MqttComponent;
import com.bisa.health.shop.enumerate.ActivateEnum;
import com.bisa.health.shop.enumerate.PayEnum;
import com.bisa.health.shop.model.Order;
import com.bisa.health.shop.service.IOrderService;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.rabbitmq.client.Channel;



public class OrderReceiverService implements ChannelAwareMessageListener {
	
	/**
	 * 订单等待支付码
	 */
	public static final int ORDER_CODE_CLOSE=1000;
	public static final int ORDER_CODE_PAY_NOTIFY=2000;
	/**
	 * 订单超时支付时间30分钟
	 */
	//public static final int ORDER_PAY_TIME_OUT=1800;
	public static final int ORDER_COLSE=172800;
	
	public static final int ORDER_NOT_PAY_NOTIFI=300;
	/**
	 * 订单自动确认收货时间10天
	 */
	public static final int ORDER_ATUO_SUBMIT=8640000;
	private static Logger logger = LogManager.getFormatterLogger(OrderReceiverService.class);
	
	@Autowired
	private IOrderService orderService;
	
	@Autowired
	private InternationalizationUtil i18nUtil;
	
	private MqttComponent iMsgMqttKit;

	public MqttComponent getiMsgMqttKit() {
		return iMsgMqttKit;
	}

	public void setiMsgMqttKit(MqttComponent iMsgMqttKit) {
		this.iMsgMqttKit = iMsgMqttKit;
	}



	@Override
	public void onMessage(Message message, final Channel channel) throws Exception {
		
		String body=new String(message.getBody());
		MqttEntity<String> mqttEntity=(MqttEntity<String>) new Gson().fromJson(body,new TypeToken<MqttEntity<String>>(){}.getType());
		Order mOrder=orderService.getOrderByNum(mqttEntity.getData());
		if(mqttEntity.getCode()==ORDER_CODE_PAY_NOTIFY){
			if(mOrder.getIs_pay()!=PayEnum.PAY.getValue()){//5分钟未付款通知
				SmsUtils.sendUnpaidTips(mOrder.getOrder_area(), mOrder.getOrder_phone(),  mOrder.getOrder_name(), mOrder.getOrder_num(), i18nUtil.i18n("shop.domain"));
				mqttEntity.setCode(ORDER_CODE_CLOSE);
				iMsgMqttKit.delayMsg(MqttComponent.push_key, mqttEntity, ORDER_COLSE);
			}
		}else if(mqttEntity.getCode()==ORDER_CODE_CLOSE){//关闭订单
			if(mOrder.getIs_pay()!=PayEnum.PAY.getValue()){//24小时未付款关闭订单
				mOrder.setOrder_status(ActivateEnum.INACTIVATED.getValue());
				orderService.updateOrder(mOrder);
			}
		}
		channel.basicAck(message.getMessageProperties().getDeliveryTag(),false);
		return;
	}
	
	 
	


}
