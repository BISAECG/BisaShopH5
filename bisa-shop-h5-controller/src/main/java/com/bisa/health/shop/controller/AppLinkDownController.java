package com.bisa.health.shop.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.bisa.health.shop.model.AppUpdate;
import com.bisa.health.shop.service.IAppUpdateService;
import com.bisa.health.shop.utils.PhoneTypeUtil;

/**
 * 下载app的控制器
 * @author Administrator
 */

@Controller
public class AppLinkDownController {

    @Value("${apk.name}")
    private String apk_name;
    @Value("${apk.path}")
    private String apk_path;

    private Logger logger = LogManager.getLogger(AppLinkDownController.class);
    
	 @Autowired
	 private IAppUpdateService appUpdateService;
    
    @RequestMapping(value = "/app/share/home", method = RequestMethod.GET)
    public String shareIndex(){
    	return "app/share/index";
    }

    /**
     * 安卓apk下载接口
     */
    @RequestMapping(value = "/app/android", method = RequestMethod.GET)
    public String downloadLocal(HttpServletResponse response,Model model) throws IOException {
    	AppUpdate appUpdate=appUpdateService.loadByStatus(1);
    	model.addAttribute("app", appUpdate);
    	return "app/share/android";
    }

}
