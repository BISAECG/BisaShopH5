package com.bisa.health.shop.controller;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/errors")
public class ErrorController {
	
    @RequestMapping(value = "/404", method = RequestMethod.GET)
    public String error404(HttpServletRequest request) {
    	return "errors/404";
    }
    
    @RequestMapping(value = "/404", method = RequestMethod.POST)
    public String error404(HttpServletRequest request,Model model,Locale locale) {
    	return "errors/404";
    }
    
    @RequestMapping(value = "/500", method = RequestMethod.GET)
    public String error500(HttpServletRequest request) {
    	return "errors/500";
    }
    
    @RequestMapping(value = "/500", method = RequestMethod.POST)
    public String error500(HttpServletRequest request,Model model,Locale locale) {
    	return "errors/500";
    }
}
