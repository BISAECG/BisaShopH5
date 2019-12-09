package com.bisa.health.shop.admin.controller;

import com.bisa.health.basic.entity.Pager;
import com.bisa.health.basic.entity.SystemContext;
import com.bisa.health.common.entity.ResultData;
import com.bisa.health.shop.admin.util.JsonResult;
import com.bisa.health.shop.component.FreemarkerComponent;
import com.bisa.health.shop.component.InternationalizationUtil;
import com.bisa.health.shop.entity.SysErrorCode;
import com.bisa.health.shop.entity.SysStatusCode;
import com.bisa.health.shop.enumerate.LangEnum;
import com.bisa.health.shop.model.CompanyInfo;
import com.bisa.health.shop.model.HtmlInfo;
import com.bisa.health.shop.model.Pay;
import com.bisa.health.shop.service.ICompanyInfoService;
import com.bisa.health.shop.service.IHtmlInfoService;
import com.bisa.health.shop.service.IPayService;
import com.bisa.health.shop.service.IPayService;
import com.bisa.health.shop.utils.TradeNoUtils;

import org.apache.commons.httpclient.util.LangUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.apache.shiro.authz.annotation.Logical;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.websocket.server.PathParam;

import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value = "/admin/pay")
@RequiresRoles(value = {"ROLE_ADMIN", "ROLE_CUSTOMER", "ROLE_STORE"}, logical = Logical.OR)
public class AdminPayController {
	

	
	@Autowired
	private IPayService payService;
	
	
	@Autowired
	private InternationalizationUtil i18nUtil;
	
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public String list() {
        return "admin/order/pay";
    }
    
    
	@RequestMapping(value = "/ajax/load", method = RequestMethod.GET, produces = "application/json; charset=utf-8")
	@ResponseBody
	public ResponseEntity<ResultData> loadAjaxGoods(@RequestParam(required = true) int id) {
		Pay mPay = payService.getPayById(id);
		if (mPay != null) {
			return new ResponseEntity<ResultData>(
					ResultData.success(SysStatusCode.SUCCESS, i18nUtil.i18n(SysErrorCode.OptSuccess), mPay),
					HttpStatus.OK);
		}
		return new ResponseEntity<ResultData>(
				ResultData.success(SysStatusCode.FAIL, i18nUtil.i18n(SysErrorCode.OptFail), mPay), HttpStatus.OK);
	}

	@RequestMapping(value = "/ajax/del/{mId}", method = RequestMethod.DELETE, produces = "application/json; charset=utf-8")
	@ResponseBody
	public ResponseEntity<ResultData> delAjaxGoods(@PathVariable int mId) {
		payService.deletePay(mId);
		return new ResponseEntity<ResultData>(
				ResultData.success(SysStatusCode.SUCCESS, i18nUtil.i18n(SysErrorCode.OptSuccess)), HttpStatus.OK);
	}


	@RequestMapping(value = "/ajax/list", method = RequestMethod.GET, produces = "application/json; charset=utf-8")
	@ResponseBody
	public ResponseEntity<Pager<Pay>> lsitAjaxGoods(@RequestParam(required=false) String vKey,@RequestParam(required=false) String vVal) {
		Pager<Pay> list = payService.getPagePay(SystemContext.getPageOffset(),vKey, vVal);
		return new ResponseEntity<Pager<Pay>>(list, HttpStatus.OK);
	}

}
