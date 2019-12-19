package com.bisa.health.shop.controller;

import javax.servlet.http.HttpServletRequest;

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

	@RequestMapping(value = "/book/ajax/add/{code}", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	@ResponseBody
	public ResponseEntity<ResultData> addAjaxGoods(HttpServletRequest request, @Validated Guestbook guestBook, @PathVariable String code, BindingResult br, Model model) {
		String mCode=(String) request.getSession().getAttribute("BISAHEALTH");
		if (br.hasErrors()||mCode==null||!code.toLowerCase().equals(mCode.toLowerCase())) {
			return new ResponseEntity<ResultData>(
					ResultData.success(SysStatusCode.FAIL, i18nUtil.i18n(SysErrorCode.RequestFormat)), HttpStatus.OK);
		}
		guestbookService.addGuestbook(guestBook);
		return new ResponseEntity<ResultData>(
				ResultData.success(SysStatusCode.SUCCESS, i18nUtil.i18n(SysErrorCode.OptSuccess)), HttpStatus.OK);
	}
}
