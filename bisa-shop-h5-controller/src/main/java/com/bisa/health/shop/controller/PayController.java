package com.bisa.health.shop.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bisa.health.common.entity.ResultData;
import com.bisa.health.shop.admin.controller.AdminNewsController;
import com.bisa.health.shop.component.EasylinkPayComponnent;
import com.bisa.health.shop.component.InternationalizationUtil;
import com.bisa.health.shop.component.MqttComponent;
import com.bisa.health.shop.component.VisaPayComponent;
import com.bisa.health.shop.entity.PayResponse;
import com.bisa.health.shop.entity.SysErrorCode;
import com.bisa.health.shop.entity.SysStatusCode;
import com.bisa.health.shop.entity.WebException;
import com.bisa.health.shop.enumerate.ActivateEnum;
import com.bisa.health.shop.enumerate.PayEnum;
import com.bisa.health.shop.enumerate.PayTypeEnum;
import com.bisa.health.shop.model.Goods;
import com.bisa.health.shop.model.Order;
import com.bisa.health.shop.model.Pay;
import com.bisa.health.shop.mqtt.MqttEntity;
import com.bisa.health.shop.mqtt.OrderReceiverService;
import com.bisa.health.shop.service.IGoodsService;
import com.bisa.health.shop.service.IOrderService;
import com.bisa.health.shop.service.IPayService;

@Controller
public class PayController {
	
	
    @Value("${visa_pay_url}")
    private String visa_pay_url;

	@Autowired
	private InternationalizationUtil i18nUtil;

	@Autowired
	private IGoodsService goodService;

	@Autowired
	private IOrderService orderService;
	
	@Autowired
	private IPayService payService;
	
	@Autowired
	private EasylinkPayComponnent easyLink; 
	
	@Autowired
	private VisaPayComponent visaPay; 
	
	@Autowired
	private MqttComponent iMsgMqttKit;


	private final static Logger log = LogManager.getLogger(AdminNewsController.class);

	@RequestMapping(value = "/html/{language}/pay", method = RequestMethod.GET)
	public String index(HttpServletRequest request,Model model, @PathVariable String language, @RequestParam String orderNum,
			@RequestParam long timestamp) {
		Order order = orderService.getOrderByNum(orderNum);
		if(order==null||order.getIs_pay()==PayEnum.PAY.getValue()){
			throw new WebException(SysErrorCode.PayError);
		}
		
		Goods goods=goodService.loadByNumAndlanguage(order.getGoods_num(), language);
		model.addAttribute("goods", goods);
		model.addAttribute("order", order);
		
		PayResponse payResponse=easyLink.easylickPay(request, order);
		if(payResponse!=null){
			order.setPay_id(payResponse.getPaymentId());
			order.setVersion(order.getVersion()+1);
			orderService.updateOrder(order);
		}
		model.addAttribute("easy", payResponse.getFormData());
		model.addAttribute("easyUrl", payResponse.getUrl());
	    Map<String, String> visaPayMap = visaPay.getVisaPayMap(order);
		model.addAttribute("visa", visaPayMap);
		model.addAttribute("visaUrl", visa_pay_url);
		
		model.addAttribute("language", language);
		model.addAttribute("orderNum", orderNum);
		model.addAttribute("timestamp", timestamp);
		
		
		/**
		 * 订单30分钟支付时间
		 */
		MqttEntity<String> mqttEntity=new MqttEntity<String>();
		mqttEntity.setClassName(Order.class.getName());
		mqttEntity.setData(order.getOrder_num());
		mqttEntity.setMsg("Order");
		mqttEntity.setCode(OrderReceiverService.ORDER_CODE_PAY_NOTIFY);
		iMsgMqttKit.delayMsg(MqttComponent.push_key, mqttEntity, OrderReceiverService.ORDER_NOT_PAY_NOTIFI);
		
		return "order/choosepay";
	}
	
	 /**
     * 银联支付成功后的同步方法
     */
	@RequestMapping(value = "/html/{language}/pay_result", method = RequestMethod.GET)
    public String payResult(Model model, @PathVariable String language,@RequestParam String number,@RequestParam int type) {
		Order order=null;
		if(type==PayTypeEnum.EASY.getValue()){
			order=orderService.loadByPyaID(number);
		}else{
			order=orderService.getOrderByNum(number);
		}
		List<Goods> list=goodService.listAllByLanguage(language);
		model.addAttribute("list", list);
    	model.addAttribute("order", order);
        return "order/success";
    }
	
	
	 /**
     * 支付状态
     */
	@RequestMapping(value = "/pay/ajax/pay_result", method = RequestMethod.GET)
	@ResponseBody
    public ResponseEntity<ResultData> ajaxPayStatus(@RequestParam String order_num) {
		
		Pay pay=payService.getPatByOrderNum(order_num);
		
		if(pay==null){
			return new ResponseEntity<ResultData>(
					ResultData.success(SysStatusCode.FAIL, i18nUtil.i18n(SysErrorCode.OptFail)), HttpStatus.OK);
		}
		
		return new ResponseEntity<ResultData>(
				ResultData.success(SysStatusCode.SUCCESS, i18nUtil.i18n(SysErrorCode.OptSuccess)), HttpStatus.OK);
    }
	
	
    /**
     * 银联支付成功后的同步方法
     */
    @RequestMapping(value = "/user/easylinkPay/return_url", method = RequestMethod.POST)
    public String easylinkCall(RedirectAttributes model,HttpServletRequest request) {
    	
    	Map<String, String[]> paramMap = request.getParameterMap();
        HashMap<String, String> signMap = new HashMap<String, String>();
        for (String key : paramMap.keySet()) {
            String[] value = paramMap.get(key);
            signMap.put(key, value[0]);
        }
    	
           String payment_id = easyLink.payCompleted(request);
           if(StringUtils.isEmpty(payment_id)){
        	   throw new WebException(SysErrorCode.SystemError);
           }
           model.addAttribute("number", payment_id);
           model.addAttribute("type", PayTypeEnum.EASY.getValue());
           return "redirect:/html/"+i18nUtil.lang()+"/pay_result";
    }

    /**
     * VISA同步回调
     */
    @RequestMapping(value = "/user/ebcPay/return_url", method = RequestMethod.POST)
    public String cbcCall(RedirectAttributes model,HttpServletRequest request) {
    	String orderNo=visaPay.verifyVisaSign(request);
    	if(StringUtils.isEmpty(orderNo)){
    		 throw new WebException(SysErrorCode.SystemError);
        }
        model.addAttribute("number", orderNo);
        model.addAttribute("type", PayTypeEnum.VISA.getValue());
       return "redirect:/html/"+i18nUtil.lang()+"/pay_result";
    }
	
	

}
