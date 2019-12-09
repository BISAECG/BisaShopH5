package com.bisa.health.shop.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/mi")
public class CallCameraHelpController {
	@RequestMapping(value = "/call/camera/share", method = RequestMethod.GET)
	public String share(String deviceid,Model model){
		model.addAttribute("deviceid", deviceid);
    	return "app/share/index_camera";
	}
}
