package com.bisa.health.shop.controller;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.bisa.health.shop.component.InternationalizationUtil;
import com.bisa.health.shop.model.Goods;
import com.bisa.health.shop.model.GoodsRecommend;
import com.bisa.health.shop.service.IGoodsService;



@Controller
public class GoodsController {
	
	@Autowired
	private InternationalizationUtil i18nUtil;
	
	@Autowired
	private IGoodsService goodService;
	
    @RequestMapping(value = "/html/{language}/shop", method = RequestMethod.GET)
    public String index(HttpServletRequest request,Model model,@PathVariable String language) {
    	List<Goods> list=goodService.listAllByLanguage(language);
    	model.addAttribute("language",language);
    	model.addAttribute("list",list);
        return "goods/list";
    }
    
    @RequestMapping(value = "/html/{language}/goods", method = RequestMethod.GET)
    public String index(HttpServletRequest request,Model model,@PathVariable String language,@RequestParam int id) {
    	Goods goods=goodService.loadById(id);
    	List<GoodsRecommend> listRecommend=goodService.listRecommendByNum(goods.getNumber());
    	List<String> listNums=new ArrayList<String>();
    	for(GoodsRecommend g :listRecommend){
    		listNums.add(g.getRecommend_num());
    	}
    	if(listNums.size()>0){
    		Map<String, Object> alias=new HashMap<String, Object>();
        	alias.put("numList", listNums);
        	List<Goods> list=goodService.listAllByLanguage(language, alias);
        	model.addAttribute("list",list);
    	}
    	
    	model.addAttribute("language",language);
    	model.addAttribute("goods",goods);
    
        return "goods/goods";
    }
}
