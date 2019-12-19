package com.bisa.health.shop.component;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.bisa.health.basic.entity.SystemContext;
import com.bisa.health.shop.enumerate.LangEnum;
import com.bisa.health.shop.model.CompanyInfo;
import com.bisa.health.shop.model.HtmlInfo;
import com.bisa.health.shop.model.News;
import com.bisa.health.shop.utils.FreemarkerUtil;

@Component
public class FreemarkerComponent {
	
	
	private String outPath;
	private String ftlPath;
	private FreemarkerUtil util;
	
	@Autowired(required=true)
	public FreemarkerComponent(String ftlPath, String outPath) {
		super();
		if(util==null) {
			this.outPath = outPath;
			this.ftlPath=ftlPath;
			util = FreemarkerUtil.getInstance(ftlPath);
		}
	}
	public void generateTop(List<HtmlInfo> list,CompanyInfo companyInfo) {
		
		/**
		 * 生成PC端静态页面
		 */
		//生成简体
		Map<String,Object> root = new HashMap<String,Object>();
		root.put("company_phone", companyInfo.getCompany_phone());
		root.put("empList", list);
		util.fprint(root, "/html/zh_CN/header.ftl", SystemContext.getRealPath()+outPath+"/zh_CN/header.html");
		util.fprint(root, "/html/zh_HK/header.ftl", SystemContext.getRealPath()+outPath+"/zh_HK/header.html");
		util.fprint(root, "/html/en_US/header.ftl", SystemContext.getRealPath()+outPath+"/en_US/header.html");
		
		
	}
	
	public void generateBottom(CompanyInfo companyInfo) {
		
		//中文
		Map<String,Object> root = new HashMap<String,Object>();
		root.put("company_name",companyInfo.getCompany_name_CN());
		root.put("company_address",companyInfo.getCompany_address_CN());
		root.put("company_phone",companyInfo.getCompany_phone());
		util.fprint(root, "/html/zh_CN/footer.ftl", SystemContext.getRealPath()+outPath+"/zh_CN/footer.html");
		//繁体
		root = new HashMap<String,Object>();
		root.put("company_name",companyInfo.getCompany_name_HK());
		root.put("company_address",companyInfo.getCompany_name_HK());
		root.put("company_phone",companyInfo.getCompany_phone());
		util.fprint(root, "/html/zh_HK/footer.ftl", SystemContext.getRealPath()+outPath+"/zh_HK/footer.html");
		//英文
		root = new HashMap<String,Object>();
		root.put("company_name",companyInfo.getCompany_name_US());
		root.put("company_address",companyInfo.getCompany_address_US());
		root.put("company_phone",companyInfo.getCompany_phone());
		util.fprint(root, "/html/en_US/footer.ftl", SystemContext.getRealPath()+outPath+"/en_US/footer.html");
	}
	
	public void generateBody(Map<String,Object> root,String language,String ftlName,String htmlName) {
		util.fprint(root, "/html/"+language+"/"+ftlName, SystemContext.getRealPath()+outPath+"/"+language+"/"+htmlName);
	}
	
	public void generateNews(List<News> list) {
		for(News nn:list){
			
        	Map<String,Object> root=new HashMap<String,Object>();
        	root.put("news_keyWord", nn.getHtml_keyWord());
        	root.put("news_description", nn.getHtml_description());
        	root.put("news_title", nn.getHtml_title());
        	root.put("title", nn.getNews_title());
        	root.put("release_time", nn.getRelease_time());
        	root.put("read_quantity", nn.getRead_quantity());
        	root.put("news_content", nn.getNews_content());
        	util.fprint(root, "/html/"+nn.getLanguage()+"/news-body.ftl", SystemContext.getRealPath()+outPath+"/"+nn.getLanguage()+"/"+nn.getId()+".html");
        }
		
	}
	
}
