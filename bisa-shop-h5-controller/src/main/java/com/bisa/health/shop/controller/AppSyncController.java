package com.bisa.health.shop.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.bisa.health.shop.admin.dto.AppServerDto;
import com.bisa.health.shop.admin.dto.AppServerPackDto;
import com.bisa.health.shop.enumerate.ActivateEnum;
import com.bisa.health.shop.model.AppServer;
import com.bisa.health.shop.model.AppUpdate;
import com.bisa.health.shop.service.IAppServerService;
import com.bisa.health.shop.service.IAppUpdateService;
import com.google.gson.Gson;

@Controller
@RequestMapping(value = "/mi")
public class AppSyncController {

	private String[] a = { "zh-hans-cn", "zh-cn" };
	private String[] b = { "zh-hant-hk", "zh-hant-tw", "zh-hant-mo", "zh-hk", "zh-mo", "zh-tw", "zh-sg" };
	Gson gson=new Gson();
    private Logger logger = LogManager.getLogger(AppSyncController.class);
	
	 @Autowired
	 private IAppServerService appServerService;
	
	 @Autowired
	 private IAppUpdateService appUpdateService;
	
	
	 @RequestMapping(value = "/call/app/syncversion")
	 public ResponseEntity checkUpdate(@RequestParam(defaultValue="0") Integer syncversion,HttpServletResponse response) throws IOException{
		 
		 AppUpdate appUpdate=appUpdateService.loadByStatus(ActivateEnum.ACTIVATE.getValue());
		 if(appUpdate!=null){
			 int curVersion=Integer.parseInt(appUpdate.getVersion());
			 if(syncversion>=curVersion){
				 return new ResponseEntity(HttpStatus.NON_AUTHORITATIVE_INFORMATION);
			 }
			 response.getWriter().print(curVersion);
		 }else{
			 response.getWriter().print(syncversion); 
		 }
		 return new ResponseEntity(HttpStatus.OK);
	 }
	
	 @RequestMapping(value = "/call/app/down")
	 public String appDown(HttpServletResponse response){
			AppUpdate appUpdate=appUpdateService.loadByStatus(ActivateEnum.ACTIVATE.getValue());
			if(appUpdate!=null)
				return "redirect:"+appUpdate.getAppUrl();
		return null;
	 }

	@RequestMapping(value = "/call/server/down")
	public void appServerDown(@RequestParam(defaultValue = "0", required = true) int version,@RequestParam(defaultValue="en-us") String language,
			HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException, IOException {


		if (StringUtils.isEmpty(language) || version == 0) {
			response.setStatus(200);
			return;
		}
		
		
		AppServer appServer=appServerService.loadByVersion();
		if(appServer!=null){
			
			if (version >= Integer.parseInt(appServer.getVersion())) {
				response.setStatus(200);
				return;
			}
			
			response.setContentType("application/octet-stream;");
			response.setHeader("Content-disposition",
					"attachment; filename=" + new String("server.json".getBytes("utf-8"), "ISO8859-1"));
			language = language.toLowerCase();
			
			List<AppServer> list=appServerService.list();
			List<AppServerDto> listDto=new ArrayList<AppServerDto>();
			AppServerPackDto packDto=new AppServerPackDto();
			for(AppServer server : list){
				packDto.setVersion(server.getVersion());
				AppServerDto appServerDto=new AppServerDto();
				appServerDto.setCountryCode(server.getCountryCode());
				appServerDto.setDatserver(server.getDatserver());
				appServerDto.setDomain(server.getDomain());
				appServerDto.setShopserver(server.getShopserver());
				appServerDto.setStatus(2);
				appServerDto.setTime_zone(server.getTime_zone());
				appServerDto.setPhoneCode(server.getPhoneCode());
				
				if (Arrays.asList(a).contains(language)) {// 简体
					appServerDto.setCountry(server.getCn_country());
					appServerDto.setEn_country(server.getEn_country());
				} else if (Arrays.asList(b).contains(language)) {// 繁体
					appServerDto.setCountry(server.getHk_country());
					appServerDto.setEn_country(server.getEn_country());
				} else {// 英文
					appServerDto.setCountry(server.getEn_country());
					appServerDto.setEn_country(server.getEn_country());
				}
				listDto.add(appServerDto);

			}
			packDto.setList(listDto);
			
			String json=gson.toJson(packDto);
			
			byte[] jsonByte=json.getBytes("utf-8");
			
			response.setHeader("Content-Length", String.valueOf(jsonByte.length));
			response.getOutputStream().write(jsonByte);
		}
		

	}
}
