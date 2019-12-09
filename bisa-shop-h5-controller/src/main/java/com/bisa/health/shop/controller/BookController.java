package com.bisa.health.shop.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bisa.health.common.entity.ResultData;
import com.bisa.health.shop.component.InternationalizationUtil;
import com.bisa.health.shop.entity.SysErrorCode;
import com.bisa.health.shop.entity.SysStatusCode;
import com.bisa.health.shop.model.Guestbook;
import com.bisa.health.shop.model.Pay;
import com.bisa.health.shop.service.IGuestbookService;

@Controller
public class BookController {
	
	@Autowired
	private InternationalizationUtil i18nUtil;
	
	@Autowired
	private IGuestbookService guestbookService;

	@RequestMapping(value = "/ajax/book/add", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	@ResponseBody
	public ResponseEntity<ResultData> addAjaxGoods(@Validated Guestbook guestBook, BindingResult br, Model model) {
		if (br.hasErrors()) {
			return new ResponseEntity<ResultData>(
					ResultData.success(SysStatusCode.FAIL, i18nUtil.i18n(SysErrorCode.RequestFormat)), HttpStatus.OK);
		}
		guestbookService.addGuestbook(guestBook);
		return new ResponseEntity<ResultData>(
				ResultData.success(SysStatusCode.SUCCESS, i18nUtil.i18n(SysErrorCode.OptSuccess)), HttpStatus.OK);
	}
}
