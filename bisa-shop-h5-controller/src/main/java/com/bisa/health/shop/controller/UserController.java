package com.bisa.health.shop.controller;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bisa.health.client.entity.User;
import com.bisa.health.client.remote.RemoteInterface;
import com.bisa.health.common.entity.ResultData;
import com.bisa.health.shiro.web.bind.CurrentUser;
import com.bisa.health.shop.component.InternationalizationUtil;
import com.bisa.health.shop.entity.SysErrorCode;
import com.bisa.health.shop.entity.SysStatusCode;
import com.bisa.health.shop.model.Address;
import com.bisa.health.shop.model.Goods;
import com.bisa.health.shop.model.GoodsRecommend;
import com.bisa.health.shop.service.IGoodsService;



@Controller
public class UserController {
	
	@Autowired
	private InternationalizationUtil i18nUtil;
	
	@Autowired
	private IGoodsService goodService;

	
    @RequestMapping(value = "/html/{language}/user", method = RequestMethod.GET)
    public String index(HttpServletRequest request,Model model,@PathVariable String language) {
    	model.addAttribute("language",language);
        return "user/index";
    }
    

    @RequestMapping(value = "/html/{language}/user_main", method = RequestMethod.GET)
    public String main(HttpServletRequest request,Model model,@PathVariable String language) {
        return "user/main";
    }
    
    
  
    
}
