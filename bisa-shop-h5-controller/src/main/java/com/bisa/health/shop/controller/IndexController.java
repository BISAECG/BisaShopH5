package com.bisa.health.shop.controller;

import com.bisa.health.client.entity.User;
import com.bisa.health.common.entity.ResultData;
import com.bisa.health.common.utils.PhoneTypeUtil;
import com.bisa.health.shop.admin.util.JsonResult;
import com.bisa.health.shop.component.InternationalizationUtil;
import com.bisa.health.shop.entity.SysErrorCode;
import com.bisa.health.shop.entity.SysStatusCode;
import com.bisa.health.shop.model.News;

import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;
import javax.servlet.http.HttpServletRequest;

import java.util.List;
import java.util.Locale;

/**
 * 商城首页
 * @author Administrator
 */

@Controller
public class IndexController {

	@Autowired
	private InternationalizationUtil i18nUtil;

    /**
     * 商城首页   http://localhost:8080/health-shop/index
     * @return
     */
    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public String index(HttpServletRequest request,Model model) {
    	String userAgent = request.getHeader("user-agent");
    	String jumStr="/html/";
    	if(PhoneTypeUtil.phoneType(userAgent)){
    		jumStr="/h5/";
    	}
    	
    	model.addAttribute("lang",jumStr+i18nUtil.lang());
        return "/index";
    }
    
    /**
     * 商城首页   http://localhost:8080/health-shop/index
     * @return
     */
    @RequestMapping(value = "/index", method = RequestMethod.POST)
    public String mIndex(HttpServletRequest request,Model model) {
    	return index(request,model);
    }
    
    @RequestMapping(value = "/isLogin",method = RequestMethod.GET,produces = "application/json; charset=utf-8")
    @ResponseBody
    public  ResponseEntity<ResultData> isLogin(HttpServletRequest request,Model model,Locale locale){
     	if(SecurityUtils.getSubject().isAuthenticated()){
     		return new ResponseEntity<ResultData>(
					ResultData.success(SysStatusCode.SUCCESS, i18nUtil.i18n(SysErrorCode.OptSuccess),SecurityUtils.getSubject().getPrincipal()),
					HttpStatus.OK);
    	}
    	return new ResponseEntity<ResultData>(
				ResultData.success(SysStatusCode.FAIL, i18nUtil.i18n(SysErrorCode.OptFail),SecurityUtils.getSubject().getPrincipal()),
				HttpStatus.OK);
    }
 

    /**
     *手机版
     */
    @RequestMapping(value = "/m_index", method = RequestMethod.GET)
    public String m_index() {
        return "m/m_index";
    }

    @RequestMapping(value = "/m_product", method = RequestMethod.GET)
    public String m_product() {
        return "m/m_product";
    }

    @RequestMapping(value = "/m_choose_payment", method = RequestMethod.GET)
    public String m_choose_payment() {
        return "m/m_choose_payment";
    }

    @RequestMapping(value = "/m_serviceCard", method = RequestMethod.GET)
    public String m_serviceCard() {
        return "m/m_serviceCard";
    }
}
