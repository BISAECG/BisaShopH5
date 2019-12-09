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
import com.bisa.health.shop.model.Guestbook;
import com.bisa.health.shop.service.ICompanyInfoService;
import com.bisa.health.shop.service.IGuestbookService;
import com.bisa.health.shop.service.IHtmlInfoService;
import com.bisa.health.shop.service.IGuestbookService;
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

/**
 * bisa管理系统后台   页面生成
 * @author Administrator
 */
@Controller
@RequestMapping(value = "/admin/book")
@RequiresRoles(value = {"ROLE_ADMIN", "ROLE_CUSTOMER", "ROLE_STORE"}, logical = Logical.OR)
public class AdminBookController {
	
	
	@Autowired
	private IGuestbookService guestbookService;
	
	
	@Autowired
	private InternationalizationUtil i18nUtil;
	
	 
    /**
     * 进去 bisa 新闻列表 页面
     */
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public String list() {
        return "admin/book/list";
    }
    
    
	@RequestMapping(value = "/ajax/load", method = RequestMethod.GET, produces = "application/json; charset=utf-8")
	@ResponseBody
	public ResponseEntity<ResultData> loadAjaxGoods(@RequestParam(required = true) int id) {
		Guestbook mGuestbook = guestbookService.getGuestbookById(id);
		if (mGuestbook != null) {
			return new ResponseEntity<ResultData>(
					ResultData.success(SysStatusCode.SUCCESS, i18nUtil.i18n(SysErrorCode.OptSuccess), mGuestbook),
					HttpStatus.OK);
		}
		return new ResponseEntity<ResultData>(
				ResultData.success(SysStatusCode.FAIL, i18nUtil.i18n(SysErrorCode.OptFail), mGuestbook), HttpStatus.OK);
	}

	@RequestMapping(value = "/ajax/del/{mId}", method = RequestMethod.DELETE, produces = "application/json; charset=utf-8")
	@ResponseBody
	public ResponseEntity<ResultData> delAjaxGoods(@PathVariable int mId) {
		guestbookService.deleteGuestbook(mId);
		return new ResponseEntity<ResultData>(
				ResultData.success(SysStatusCode.SUCCESS, i18nUtil.i18n(SysErrorCode.OptSuccess)), HttpStatus.OK);
	}

	@RequestMapping(value = "/ajax/add", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	@ResponseBody
	public ResponseEntity<ResultData> addAjaxGoods(@Validated Guestbook order, BindingResult br, Model model) {
		if (br.hasErrors()) {
			return new ResponseEntity<ResultData>(
					ResultData.success(SysStatusCode.FAIL, i18nUtil.i18n(SysErrorCode.RequestFormat)), HttpStatus.OK);
		}
		if (order.getId() == 0)
			guestbookService.addGuestbook(order);
		else
			guestbookService.updateGuestbook(order);
		return new ResponseEntity<ResultData>(
				ResultData.success(SysStatusCode.SUCCESS, i18nUtil.i18n(SysErrorCode.OptSuccess)), HttpStatus.OK);
	}

	@RequestMapping(value = "/ajax/list", method = RequestMethod.GET, produces = "application/json; charset=utf-8")
	@ResponseBody
	public ResponseEntity<Pager<Guestbook>> lsitAjaxGoods(@RequestParam(required=false) String vKey,@RequestParam(required=false) String vVal) {
		Pager<Guestbook> list = guestbookService.getPageGuestbook(SystemContext.getPageOffset(),vKey, vVal);
		return new ResponseEntity<Pager<Guestbook>>(list, HttpStatus.OK);
	}
}
