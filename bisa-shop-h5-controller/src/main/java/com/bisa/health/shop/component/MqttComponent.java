package com.bisa.health.shop.component;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.amqp.AmqpException;
import org.springframework.amqp.core.AmqpTemplate;
import org.springframework.amqp.core.Message;
import org.springframework.amqp.core.MessagePostProcessor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.bisa.health.shop.entity.SysErrorCode;
import com.bisa.health.shop.entity.WebException;


@Component(value="mqttKit")
public class MqttComponent {

	@Autowired
	private AmqpTemplate delayMsgTemplate;
	
	public static String push_key="order_queue_key";
	
	
	/**
	 * 
	 * @param key
	 * @param msg
	 * @param delay 秒
	 */
	public void delayMsg(String key, Object msg, int delay){
		
		try {
			final int xdelay = delay * 1000;
			delayMsgTemplate.convertAndSend(key, msg, new MessagePostProcessor() {

				@Override
				public Message postProcessMessage(Message message) throws AmqpException {
					message.getMessageProperties().setDelay(xdelay);
					return message;
				}
			});
		} catch (Exception e) {
			throw new WebException(SysErrorCode.SystemError);
		}
			
	}

	public void pushMsg(String key, Object msg) {
	  delayMsgTemplate.convertAndSend(key, msg);
	}

}
