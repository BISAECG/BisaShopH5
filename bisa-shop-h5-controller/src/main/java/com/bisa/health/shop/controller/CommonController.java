package com.bisa.health.shop.controller;

import com.bisa.fastdfs.FastDFSClient;
import com.bisa.health.basic.entity.Pager;
import com.bisa.health.common.entity.ResultData;
import com.bisa.health.shop.admin.util.JsonResult;
import com.bisa.health.shop.component.InternationalizationUtil;
import com.bisa.health.shop.entity.SysErrorCode;
import com.bisa.health.shop.entity.SysStatusCode;
import com.bisa.health.shop.model.Goods;
import com.google.code.kaptcha.Producer;

import org.apache.shiro.authz.annotation.Logical;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.UUID;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 评价管理
 *
 * @author Administrator
 */
@Controller
@RequestMapping(value = "/common")
public class CommonController {

    
    @Autowired
    private FastDFSClient fastDFSClient;

	@Autowired
	private Producer kaptchaProducer;
    
	@Autowired
	private InternationalizationUtil i18nUtil;
    
	

	@RequestMapping("/kaptcha")
    public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception{
        response.setDateHeader("Expires",0);
        response.setHeader("Cache-Control", "no-store, no-cache, must-revalidate");
        response.addHeader("Cache-Control", "post-check=0, pre-check=0");
        response.setHeader("Pragma", "no-cache");
        response.setContentType("image/jpeg");
        String capText = kaptchaProducer.createText();
        //seesion的key
        request.getSession().setAttribute("BISAHEALTH", capText);
        BufferedImage bi = kaptchaProducer.createImage(capText);
        ServletOutputStream out = response.getOutputStream();
        ImageIO.write(bi, "jpg", out);
        try {
            out.flush();
        } finally {
            out.close();
        }
        return null;
    }
    
}
