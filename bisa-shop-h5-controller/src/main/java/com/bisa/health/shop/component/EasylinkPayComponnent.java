package com.bisa.health.shop.component;

import com.bisa.health.shop.controller.OrderController;
import com.bisa.health.shop.entity.PayRequest;
import com.bisa.health.shop.entity.PayResponse;
import com.bisa.health.shop.entity.SysErrorCode;
import com.bisa.health.shop.entity.WebException;
import com.bisa.health.shop.model.Order;
import com.bisa.health.shop.pay.utils.PayNotifyResponse;
import com.bisa.health.shop.service.IOrderService;
import com.bisa.health.shop.utils.EasylinkSignatureUtil;
import com.bisa.health.shop.utils.HttpClientPost;
import com.bisa.health.shop.utils.OrderNoUtils;
import com.bisa.health.shop.utils.SignatureUtil;
import com.github.kevinsawicki.http.HttpRequest;
import com.google.gson.Gson;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.text.SimpleDateFormat;
import java.util.Map;

/**
 * 银联支付组件
 * @author Administrator
 */

@Component
public class EasylinkPayComponnent {

    private Logger logger = LogManager.getLogger(EasylinkPayComponnent.class);
    @Value("${channel_url}")
    private String url;
    @Value("${pin}")
    private String pin;
    @Value("${secPin}")
    private String secPin;
    @Value("${channel}")
    private String channel;
    @Value("${scretKey}")
    private String secretKey;
    @Value("${callbackUrl}")
    private String callbackUrl;
    
	@Value("${frontendUrl}")//银联同步回调
	private String frontendUrl;

    final Gson gson=new Gson();
    /**
     * 银联支付组件
     * @param order_no
     * @throws IOException
     * @throws ServletException
     */
    public PayResponse easylickPay(HttpServletRequest request, Order order) {


        PayRequest payRequest = new PayRequest();
        payRequest.setPin(pin);
        payRequest.setSecPin(secPin);
        payRequest.setAmount(""+order.getOrder_price());
        //payRequest.setAmount("1");
        String stringDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(order.getC_time());
        payRequest.setOrderCreateTime(stringDate);

        String orderId=order.getOrder_num();
        payRequest.setOrderId(orderId);
        payRequest.setCallbackUrl(callbackUrl);
        payRequest.setFrontendUrl(frontendUrl);
        payRequest.setChannel(channel);
        payRequest.setCustomerIp(getRemoteAddress(request));

        // 设置签名信息
        payRequest.setAccessKey(EasylinkSignatureUtil.generateSignature(payRequest, secretKey));
        // 将bean转换为map
        Map<String, String> data = SignatureUtil.beanToMap(payRequest);

        String resp = null;
        try {
            resp = HttpRequest.post(url).trustAllCerts().trustAllHosts().form(data).connectTimeout(60 * 1000).readTimeout(60 * 1000).body();
        } catch (Exception e) {
        	logger.info(e.getMessage()+"["+order.getOrder_num()+"]");
        	throw new WebException(SysErrorCode.PayError);
        }
        PayResponse payResponse =gson.fromJson(resp, PayResponse.class);
        if(payResponse == null || !"00".equals(payResponse.getRespCode())){
        	logger.info(payResponse.getRespCode() + ":" + payResponse.getRespMsg()+"["+order.getOrder_num()+"]");
        	throw new WebException(SysErrorCode.PayError);
        }
        
        return payResponse;
       
    }
    
    public void autoBuildPost(HttpServletRequest request, HttpServletResponse response,PayResponse payResponse) throws IOException{
    	 HttpClientPost poster = new HttpClientPost(response, payResponse.getFormData());
         // 请请求信息发送至渠道进行支付处理
         poster.sendByPost(payResponse.getUrl(),"UTF-8");
    }

    // 請求地址
    private String getRemoteAddress(HttpServletRequest request) {
        String ip = request.getRemoteAddr();
        if ("0:0:0:0:0:0:0:1".equals(ip)) {
            return "127.0.0.1";
        }
        return ip;
    }

    /**
     * 银联支付后的同步操作组件
     * @param request
     * @return
     * @throws IOException
     * @throws InvocationTargetException
     * @throws IllegalAccessException
     */
    public String payCompleted(HttpServletRequest request){
    	try {
	        Map<String, String> requestMap = EasylinkSignatureUtil.buildRequestParameters(request);
	        PayNotifyResponse payNotifyResponse = new PayNotifyResponse();
	        BeanUtils.populate(payNotifyResponse, requestMap);
	        // 交易回调进行验签处理
	        String signature = EasylinkSignatureUtil.generateSignature(payNotifyResponse, secretKey);
		    if (signature.equals(payNotifyResponse.getAccessKey())) {
			    logger.info("Easy sync call sign success."+payNotifyResponse.getPaymentId());
			    return payNotifyResponse.getPaymentId();
		     }
		    logger.info("Easy sync call sign success."+payNotifyResponse.getPaymentId());
	        return null;
        } catch (Exception e) {
        	return null;
        }
			
        
    }

}
