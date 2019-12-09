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
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bisa.health.common.pay.utils.VisaCreatSign;
import com.bisa.health.shop.model.Order;
import com.bisa.health.shop.pay.utils.EasylinkSignatureUtil;
import com.bisa.health.shop.pay.utils.PayNotifyResponse;


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
            System.out.println(paymentId+"|"+signature);
        } catch (Exception e) {
        	 logger.error("easyLink支付异常"+e.getMessage());
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
        } catch (InvalidKeyException e) {
            e.printStackTrace();
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        System.out.println(out_trade_no);
    }
    
}
