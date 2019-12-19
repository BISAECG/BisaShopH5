package com.bisa.health.shop.admin.controller;

import com.bisa.fastdfs.FastDFSClient;
import com.bisa.health.basic.entity.Pager;
import com.bisa.health.common.entity.ResultData;
import com.bisa.health.shop.admin.util.JsonResult;
import com.bisa.health.shop.component.InternationalizationUtil;
import com.bisa.health.shop.entity.SysErrorCode;
import com.bisa.health.shop.entity.SysStatusCode;
import com.bisa.health.shop.model.Goods;
import com.bisa.health.shop.utils.ImageKit;

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

import java.io.IOException;
import java.util.UUID;

/**
 * 评价管理
 *
 * @author Administrator
 */
@Controller
@RequestMapping(value = "/admin/common")
@RequiresRoles(value = {"ROLE_ADMIN", "ROLE_CUSTOMER"}, logical = Logical.OR)
public class AdminCommonController {

    
    @Autowired
    private FastDFSClient fastDFSClient;

	@Autowired
	private InternationalizationUtil i18nUtil;
    
    /**
     * 图片上传Ajax
     * @param file 接收图片的对象
     * @return
     */
    @RequestMapping(value = "/upload", method = RequestMethod.POST,produces = "application/json; charset=utf-8")
    @ResponseBody
    public ResponseEntity<ResultData> newsPictureUpload(@RequestParam(required=true) MultipartFile file,@RequestParam(required=true) String suffix,@RequestParam(required=false,defaultValue="0") int height,@RequestParam(required=false,defaultValue="0") int width) {

		 String filename = UUID.randomUUID().toString() + "."+suffix;
	     String url;
    	if(width!=0&&height!=0&&(suffix.toLowerCase().equals("jpg")||suffix.toLowerCase().equals("png"))){
 	
 			try {
 				
 				int[] wh=ImageKit.getSizeInfo(file.getInputStream());
 				byte[] imgBytes=ImageKit._resize(file.getInputStream(), width, height, wh[0], wh[1]);
 				url = fastDFSClient.uploadFile(filename,imgBytes);
 			} catch (Exception e) {
 				 return  new ResponseEntity<ResultData>(ResultData.success(SysStatusCode.FAIL, i18nUtil.i18n(SysErrorCode.OptFail)), HttpStatus.OK);
 			}
 			return  new ResponseEntity<ResultData>(ResultData.success(SysStatusCode.SUCCESS, i18nUtil.i18n(SysErrorCode.OptSuccess),url), HttpStatus.OK);

    	}else{
			try {
				url = fastDFSClient.uploadFile(filename,file.getBytes());
			} catch (IOException e) {
				 return  new ResponseEntity<ResultData>(ResultData.success(SysStatusCode.FAIL, i18nUtil.i18n(SysErrorCode.OptFail)), HttpStatus.OK);
			}
			return  new ResponseEntity<ResultData>(ResultData.success(SysStatusCode.SUCCESS, i18nUtil.i18n(SysErrorCode.OptSuccess),url), HttpStatus.OK);
    	}
     
        
    }
    
}
