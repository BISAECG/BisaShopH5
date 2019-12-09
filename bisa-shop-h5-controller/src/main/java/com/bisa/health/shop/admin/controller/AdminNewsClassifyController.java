package com.bisa.health.shop.admin.controller;


import com.bisa.health.shop.model.NewsClassify;
import com.bisa.health.shop.service.INewsClassifyService;
import com.bisa.health.shop.utils.TradeNoUtils;

import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.authz.annotation.Logical;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bisa.health.basic.entity.Pager;
import com.bisa.health.basic.entity.SystemContext;
import com.bisa.health.common.entity.ResultData;
import com.bisa.health.shop.component.InternationalizationUtil;
import com.bisa.health.shop.entity.SysErrorCode;
import com.bisa.health.shop.entity.SysStatusCode;


/**
 * 新闻管理
 *
 * @author Administrator
 */

@Controller
@RequestMapping(value = "/admin/news")
@RequiresRoles(value = {"ROLE_ADMIN", "ROLE_CUSTOMER"}, logical = Logical.OR)
public class AdminNewsClassifyController {
	
	
	@Autowired
	private InternationalizationUtil i18nUtil;
	
	@Autowired
	private INewsClassifyService iNewsClassifyService;
	
	@RequestMapping(value = "/category", method = RequestMethod.GET)
	public String listCategory(Model model) {
		model.addAttribute("language", i18nUtil.lang());
		return "admin/news/category";
	}

	@RequestMapping(value = "/ajax/category/load", method = RequestMethod.GET, produces = "application/json; charset=utf-8")
	@ResponseBody
	public ResponseEntity<ResultData> loadAjaxCategory(@RequestParam(required = true) String number,
			@RequestParam(required = true) String language) {
		NewsClassify NewsClassify = iNewsClassifyService.loadByNumber(number, language);
		if (NewsClassify != null) {
			return new ResponseEntity<ResultData>(
					ResultData.success(SysStatusCode.SUCCESS, i18nUtil.i18n(SysErrorCode.OptSuccess), NewsClassify),
					HttpStatus.OK);
		}
		return new ResponseEntity<ResultData>(
				ResultData.success(SysStatusCode.FAIL, i18nUtil.i18n(SysErrorCode.OptFail), NewsClassify),
				HttpStatus.OK);
	}

	@RequestMapping(value = "/ajax/category/list", method = RequestMethod.GET, produces = "application/json; charset=utf-8")
	@ResponseBody
	public ResponseEntity<Pager<NewsClassify>> listAjaxCategory() {
		Pager<NewsClassify> listPage = iNewsClassifyService.listAll(SystemContext.getPageOffset());
		return new ResponseEntity<Pager<NewsClassify>>(listPage, HttpStatus.OK);
	}

	@RequestMapping(value = "/ajax/category/list/{language}", method = RequestMethod.GET, produces = "application/json; charset=utf-8")
	@ResponseBody
	public ResponseEntity<Pager<NewsClassify>> listAjaxCategoryByLanguage(@PathVariable String language) {
		Pager<NewsClassify> listPage = iNewsClassifyService.listAll(language, SystemContext.getPageOffset());
		return new ResponseEntity<Pager<NewsClassify>>(listPage, HttpStatus.OK);
	}

	@RequestMapping(value = "/ajax/category/add", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	@ResponseBody
	public ResponseEntity<ResultData> addAjaxCategory(@Validated NewsClassify NewsClassify, BindingResult br,
			Model model) {

		if (br.hasErrors()) {
			model.addAttribute("message", i18nUtil.i18n(SysErrorCode.RequestFormat));
		}

		if (StringUtils.isEmpty(NewsClassify.getNumber()))
			NewsClassify.setNumber(TradeNoUtils.getGoodsNoByTime());

		if (NewsClassify.getId() == 0)
			iNewsClassifyService.save(NewsClassify);
		else
			iNewsClassifyService.update(NewsClassify);
		return new ResponseEntity<ResultData>(
				ResultData.success(SysStatusCode.SUCCESS, i18nUtil.i18n(SysErrorCode.OptSuccess)), HttpStatus.OK);
	}

	@RequestMapping(value = "/ajax/category/del/{mId}", method = RequestMethod.DELETE, produces = "application/json; charset=utf-8")
	@ResponseBody
	public ResponseEntity<ResultData> delAjaxCategory(@PathVariable int mId) {
		iNewsClassifyService.delete(mId);
		return new ResponseEntity<ResultData>(
				ResultData.success(SysStatusCode.SUCCESS, i18nUtil.i18n(SysErrorCode.OptSuccess)), HttpStatus.OK);
	}


}