package com.bisa.health.shop.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bisa.health.basic.entity.Pager;
import com.bisa.health.basic.entity.SystemContext;
import com.bisa.health.common.utils.PhoneTypeUtil;
import com.bisa.health.shop.component.InternationalizationUtil;
import com.bisa.health.shop.model.News;
import com.bisa.health.shop.model.NewsClassify;
import com.bisa.health.shop.model.NewsInLink;
import com.bisa.health.shop.service.INewsClassifyService;
import com.bisa.health.shop.service.INewsService;
import com.bisa.health.shop.service.NewsServiceImpl;



@Controller
public class NewsController {
	
	@Autowired
	private InternationalizationUtil i18nUtil;
	
	@Autowired
	private INewsService mNewsServiceImpl;
	
	@Autowired
	private INewsClassifyService mNewsClassifyService;
	
    @RequestMapping(value = "/html/{language}/news", method = RequestMethod.GET)
    public String index(HttpServletRequest request,Model model, @PathVariable String language) {
    	List<News> list=mNewsServiceImpl.getTop4ListNews(language);
    	model.addAttribute("list", list);
    	model.addAttribute("language",language);
    	List<NewsClassify> listClassify=mNewsClassifyService.listAllByLanguage(language);
    	model.addAttribute("listClassify", listClassify);
        return "news/list";
    }
    
    
    @RequestMapping(value = "/news/ajax/top4", method = RequestMethod.GET,produces = "application/json; charset=utf-8")
    @ResponseBody
    public ResponseEntity<List<News>> ajaxListTop4(HttpServletRequest request,Model model,@RequestParam(required=false) String vKey,@RequestParam(required=false)String vVal) {
    	List<News> list=mNewsServiceImpl.getTop4ListNews(i18nUtil.lang());
    	return new ResponseEntity<List<News>>(list, HttpStatus.OK);
    }
    
    
    @RequestMapping(value = "/news/ajax/page", method = RequestMethod.GET,produces = "application/json; charset=utf-8")
    @ResponseBody
    public ResponseEntity<Pager<News>> ajaxList(HttpServletRequest request,Model model,@RequestParam(required=false) String vKey,@RequestParam(required=false)String vVal) {
    	Pager<News> pager=mNewsServiceImpl.getPageNews(i18nUtil.lang(), vKey, vVal,SystemContext.getPageOffset());
    	model.addAttribute("pager", pager);
    	return new ResponseEntity<Pager<News>>(pager, HttpStatus.OK);
    }
}
