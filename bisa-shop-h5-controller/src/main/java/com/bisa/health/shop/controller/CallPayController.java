package com.bisa.health.shop.controller;

import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bisa.health.client.entity.Service;
import com.bisa.health.client.remote.RemoteInterface;
import com.bisa.health.common.pay.utils.VisaCreatSign;
import com.bisa.health.common.utils.RandomUtils;
import com.bisa.health.shop.entity.SysErrorCode;
import com.bisa.health.shop.entity.WebException;
import com.bisa.health.shop.enumerate.ActivateEnum;
import com.bisa.health.shop.enumerate.GoodsTypeEnum;
import com.bisa.health.shop.enumerate.OrderStatusEnum;
import com.bisa.health.shop.enumerate.PayEnum;
import com.bisa.health.shop.enumerate.PayTypeEnum;
import com.bisa.health.shop.model.Goods;
import com.bisa.health.shop.model.Order;
import com.bisa.health.shop.model.Pay;
import com.bisa.health.shop.model.RechargeCard;
import com.bisa.health.shop.pay.utils.EasylinkSignatureUtil;
import com.bisa.health.shop.pay.utils.PayNotifyResponse;
import com.bisa.health.shop.service.IGoodsService;
import com.bisa.health.shop.service.IOrderService;
import com.bisa.health.shop.service.IPayService;
import com.bisa.health.shop.service.IRechargeCardService;


@Controller
@RequestMapping(value = "/call")
public class CallPayController {
	
	@Value("${channel_url}")
    private String channel_url;
    @Value("${pin}")
    private String pin;
    @Value("${secPin}")
    private String secPin;
    @Value("${channel}")
    private String channel;
    @Value("${scretKey}")
    private String secretKey;
    
    
    
    @Value("${visa_secret_key}")
    private String visa_secret_key;
    
    @Autowired
    private IOrderService orderService;
    
    @Autowired
    private RemoteInterface remoteService;
    
    @Autowired
    private IGoodsService goodsService;
    
    @Autowired
    private IRechargeCardService cardService;
    
    @Autowired
    private IPayService payService;
    

    private Logger logger = LogManager.getLogger(CallPayController.class);
    
    /**
     * 银联 支付  回调处理
     * @return
     */
    @RequestMapping(value = "/eshop/notify_url", method = RequestMethod.POST)
    @ResponseBody
    public void payCompleted(HttpServletRequest request) {
    	
    	
        try {
            logger.info("==============银联支付回调============");

            Map<String, String> requestMap = EasylinkSignatureUtil.buildRequestParameters(request);
            PayNotifyResponse payNotifyResponse = new PayNotifyResponse();
            BeanUtils.populate(payNotifyResponse, requestMap);
            // 交易回调进行验签处理
            String signature = EasylinkSignatureUtil.generateSignature(payNotifyResponse, secretKey);
            String paymentId = payNotifyResponse.getPaymentId();
            
            Order order = orderService.loadByPyaID(paymentId);
            
            //签名和状态都没有问题才是支付成功
            if (order!=null&&signature.equals(payNotifyResponse.getAccessKey()) && payNotifyResponse.getStatus().equals("1")) {
            	if(order.getGoods_type()==GoodsTypeEnum.VIRTUAL.getValue()){//虚拟物品
            		Goods goods=goodsService.loadById(order.getGoods_id());
                	Service service=Service.byStoken(remoteService.listService(),goods.getService_token());
            		RechargeCard card=new RechargeCard();
            		card.setCard_count(order.getGoods_count());
            		card.setCard_desc(service.getDesc());
            		card.setCard_num(RandomUtils.RandomOfDateChar(8));
            		card.setCard_pwd(RandomUtils.getRandomChar(6));
            		card.setCreator(order.getUser_id());
            		card.setOrder_num(order.getOrder_num());
            		card.setService_token(service.getStoken());
            		card.setStatus(ActivateEnum.ACTIVATE.getValue());
            		cardService.addRechargeCard(card);
            		//虚拟商品无需发货
            		order.setOrder_status(OrderStatusEnum.DELIVERRY.getValue());
            	}
                	
            	order.setPay_type(PayTypeEnum.VISA.getValue());
            	order.setIs_pay(PayEnum.PAY.getValue());
                orderService.updateOrder(order);
                Pay pay=new Pay();
                pay.setGoods_num(order.getGoods_num());
                pay.setOrder_num(order.getOrder_num());
                pay.setPay_price(order.getOrder_price());
                pay.setPay_type(PayTypeEnum.VISA.getValue());
                pay.setPay_id(order.getPay_id());
                payService.addPay(pay);
                logger.info("visa pay success.order number："+order.getOrder_num());
            } else {
            	logger.info("visa pay fail.order number："+order.getOrder_num());
            }
        } catch (Exception e) {
        	 logger.error("easyLink error"+e.getMessage());
        }
       
    }
    /**
     * visa支付 的回调地址
     */
    @RequestMapping(value = "/visaPay/notify_url", method = RequestMethod.POST)
    @ResponseBody
    public void visaPayNotifyUrl(HttpServletRequest request) {

    	 logger.info("==============VISA支付回调============");

        String signture = request.getParameter("signature");
        String decision = request.getParameter("decision");
        String out_trade_no = request.getParameter("req_reference_number");
        String totalAmount = request.getParameter("req_amount");
        // 验证签名是否正确（判断是否为visa 的cybersource Business center通知的）
        Map<String, String[]> paramMap = request.getParameterMap();
        HashMap<String, String> signMap = new HashMap<String, String>();
        for (String key : paramMap.keySet()) {
            String[] value = paramMap.get(key);
            signMap.put(key, value[0]);
        }
        

        String newSignture = null;
        try {
            newSignture = VisaCreatSign.sign(signMap, visa_secret_key);// 新的签名
        } catch (Exception e) {
           throw new WebException(SysErrorCode.SystemError);
        } 
         
        Order order = orderService.getOrderByNum(out_trade_no);
        // 1.对比新的签名和老的签名 2.返回的状态
        if (order!=null&&newSignture.equals(signture) && decision.equals("ACCEPT")) {
    
        	if(order.getGoods_type()==GoodsTypeEnum.VIRTUAL.getValue()){//虚拟物品
        		Goods goods=goodsService.loadById(order.getGoods_id());
            	Service service=Service.byStoken(remoteService.listService(),goods.getService_token());
        		RechargeCard card=new RechargeCard();
        		card.setCard_count(order.getGoods_count());
        		card.setCard_desc(service.getDesc());
        		card.setCard_num(RandomUtils.RandomOfDateChar(8));
        		card.setCard_pwd(RandomUtils.getRandomChar(6));
        		card.setCreator(order.getUser_id());
        		card.setOrder_num(order.getOrder_num());
        		card.setService_token(service.getStoken());
        		card.setStatus(ActivateEnum.ACTIVATE.getValue());
        		cardService.addRechargeCard(card);
        		
        		order.setOrder_status(OrderStatusEnum.DELIVERRY.getValue());
        	}
            	
        	order.setPay_type(PayTypeEnum.VISA.getValue());
        	order.setIs_pay(PayEnum.PAY.getValue());
            orderService.updateOrder(order);
            Pay pay=new Pay();
            pay.setGoods_num(order.getGoods_num());
            pay.setOrder_num(order.getOrder_num());
            pay.setPay_price(order.getOrder_price());
            pay.setPay_type(PayTypeEnum.VISA.getValue());
            pay.setPay_id(order.getGoods_num());
            payService.addPay(pay);
            logger.info("visa pay success.order number："+out_trade_no);
        } else {
            logger.info("visa pay fail.order number："+out_trade_no);
        }
    }
    
}
