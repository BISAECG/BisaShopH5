package com.bisa.health.shop.admin.controller;

import com.bisa.fastdfs.FastDFSClient;
import com.bisa.health.basic.entity.Pager;
import com.bisa.health.basic.entity.SystemContext;
import com.bisa.health.client.remote.RemoteInterface;
import com.bisa.health.common.entity.ResultData;
import com.bisa.health.shop.admin.util.JsonResult;
import com.bisa.health.shop.component.InternationalizationUtil;
import com.bisa.health.shop.entity.SysErrorCode;
import com.bisa.health.shop.entity.SysStatusCode;
import com.bisa.health.shop.enumerate.IndexImgEnum;
import com.bisa.health.shop.enumerate.LangEnum;
import com.bisa.health.shop.model.AppServer;
import com.bisa.health.shop.model.AppUpdate;
import com.bisa.health.shop.model.HtmlInfo;
import com.bisa.health.shop.service.IAppServerService;
import com.bisa.health.shop.service.IAppUpdateService;
import com.bisa.health.shop.service.IHtmlInfoService;
import net.sf.json.JSONObject;
import org.apache.commons.lang3.StringUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.apache.shiro.authz.annotation.Logical;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

/**
 * bisa管理系统后台 主页
 * 
 * @author Administrator
 */

@Controller
@RequestMapping(value = "/admin")
public class AdminIndexController {

	@Autowired
	private IAppUpdateService appUpdateService;

	@Autowired
	private RemoteInterface remoteService;

	@Autowired
	private IHtmlInfoService adminHtmlInfoService;

	@Autowired
	private IAppServerService serverUpdateService;

	@Autowired
	private InternationalizationUtil i18nUtil;

	@Autowired
	private FastDFSClient fastDFSClient;

	private static Logger logger = LogManager.getFormatterLogger(AdminIndexController.class);

	String appname = "Bishealth-release_";

	/**
	 * 进去 bisa 后台管理系统的主页
	 */
	@RequiresRoles(value = {"ROLE_ADMIN", "ROLE_CUSTOMER", "ROLE_STORE"}, logical = Logical.OR)
	@RequestMapping(value = "/index")
	public String index() {

		return "admin/index";
	}

	/**
	 * 进去 bisa 后台管理系统的主页
	 */
	@RequiresRoles(value = {"ROLE_ADMIN", "ROLE_CUSTOMER", "ROLE_STORE"}, logical = Logical.OR)
	@RequestMapping(value = "/main")
	public String home() {
		return "admin/config/main";
	}



	/**
	 * APP更新管理
	 * 
	 * @return
	 */
	@RequiresRoles(value = { "ROLE_ADMIN" })
	@RequestMapping(value = "/client", method = RequestMethod.GET)
	public String updateManagement() {

		return "admin/config/client";
	}

	/**
	 * APP更新管理
	 * 
	 * @return
	 */
	@RequiresRoles(value = { "ROLE_ADMIN" })
	@RequestMapping(value = "/ajax/uploadapp", method = RequestMethod.POST,produces = "application/json; charset=utf-8")
	@ResponseBody
	public ResponseEntity<ResultData> updateManagementApp(@Validated AppUpdate appBean, BindingResult br) {

		if (br.hasErrors()) {
			return new ResponseEntity<ResultData>(
					ResultData.success(SysStatusCode.FAIL, i18nUtil.i18n(SysErrorCode.OptFail)), HttpStatus.OK);
		}
		appBean.setFileName("Bishealth-release_"+appBean.getVersion()+".apk");
		AppUpdate appUpdate = appUpdateService.loadByVersion(appBean.getVersion());
		if (appUpdate == null) {
			AppUpdate mAppUpdate=appUpdateService.saveAppUpdate(appBean);
			appUpdateService.updateStatus(mAppUpdate.getId());
		}else{
			appBean.setStatus(1);
			appUpdateService.updateAppUpdate(appUpdate.toAppUpdate(appBean));
			appUpdateService.updateStatus(appUpdate.getId());
		}

		return new ResponseEntity<ResultData>(
				ResultData.success(SysStatusCode.SUCCESS, i18nUtil.i18n(SysErrorCode.OptSuccess)), HttpStatus.OK);

	}

	/**
	 * 服务配置
	 * 
	 * @param serverBean
	 * @param br
	 * @return
	 */
	@RequiresRoles(value = { "ROLE_ADMIN" })
	@RequestMapping(value = "/ajax/uploadserver", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	@ResponseBody
	public ResponseEntity<ResultData> updateManagementServer(@Validated AppServer serverBean, BindingResult br) {

		if (br.hasErrors()) {
			return new ResponseEntity<ResultData>(
					ResultData.success(SysStatusCode.FAIL, i18nUtil.i18n(SysErrorCode.OptFail)), HttpStatus.OK);
		}

		if (serverBean.getId() != 0) {
			serverUpdateService.updateAppServer(serverBean);
		} else {
			serverUpdateService.saveAppServer(serverBean);
		}

		return new ResponseEntity<ResultData>(
				ResultData.success(SysStatusCode.SUCCESS, i18nUtil.i18n(SysErrorCode.OptSuccess)), HttpStatus.OK);
	}

	@RequestMapping(value = "/ajax/app/list")
	@ResponseBody
	@RequiresRoles(value = { "ROLE_ADMIN" })
	public Object listAppUpdate() {
		SystemContext.setOrder("id");
		Pager<AppUpdate> list = appUpdateService.page(SystemContext.getPageOffset());
		return list;
	}

	@RequestMapping(value = "/ajax/server/list")
	@ResponseBody
	@RequiresRoles(value = { "ROLE_ADMIN" })
	public Object listServer(@RequestParam(defaultValue = "0") Integer page,
			@RequestParam(defaultValue = "10") Integer limit) {

		SystemContext.setSort("create_time"); // 默认根据报告状态排序，待查看优先
		SystemContext.setOrder("desc");
		Pager<AppServer> pager = serverUpdateService.listPager(SystemContext.getPageOffset());
		return pager;
	}

	@RequestMapping(value = "/ajax/server/delete")
	@ResponseBody
	@RequiresRoles(value = { "ROLE_ADMIN" })
	public Object serverDelete(@RequestParam(defaultValue = "0") Integer id) {

		AppServer appServer = serverUpdateService.loadByID(id);
		if (appServer != null) {
			serverUpdateService.deleteAppServer(appServer);
		}
		return "ok";
	}

	
}
