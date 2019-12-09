package com.bisa.health.shop.admin.controller;

import org.apache.shiro.authz.annotation.Logical;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bisa.health.client.entity.User;
import com.bisa.health.client.remote.RemoteInterface;
import com.bisa.health.common.entity.ResultData;
import com.bisa.health.shop.component.InternationalizationUtil;
import com.bisa.health.shop.entity.SysErrorCode;
import com.bisa.health.shop.entity.SysStatusCode;


@Controller
@RequestMapping(value = "/admin/user")
@RequiresRoles(value = {"ROLE_ADMIN", "ROLE_CUSTOMER", "ROLE_STORE"}, logical = Logical.OR)
public class AdminUserController {
	

	@Autowired
	private InternationalizationUtil i18nUtil;
	
	@Autowired
	private RemoteInterface remoteService;
	
	  
    @RequestMapping(value = "/ajax/load", method = RequestMethod.GET, produces = "application/json; charset=utf-8")
	@ResponseBody
	public ResponseEntity<ResultData> ajaxLoadUser(@RequestParam String username) {
    	
		User user = remoteService.loadUser(username);
		if (user!=null) {
			return new ResponseEntity<ResultData>(
					ResultData.success(SysStatusCode.SUCCESS, i18nUtil.i18n(SysErrorCode.OptSuccess), user),
					HttpStatus.OK);
		}
		return new ResponseEntity<ResultData>(
				ResultData.success(SysStatusCode.FAIL, i18nUtil.i18n(SysErrorCode.OptFail)),
				HttpStatus.OK);

	}
}
