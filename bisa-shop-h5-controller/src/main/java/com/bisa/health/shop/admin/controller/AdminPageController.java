package com.bisa.health.shop.admin.controller;

import com.bisa.health.basic.entity.Pager;
import com.bisa.health.basic.entity.SystemContext;
import com.bisa.health.common.entity.ResultData;
import com.bisa.health.shop.admin.util.JsonResult;
import com.bisa.health.shop.component.FreemarkerComponent;
import com.bisa.health.shop.component.InternationalizationUtil;
import com.bisa.health.shop.entity.SysErrorCode;
import com.bisa.health.shop.entity.SysStatusCode;
import com.bisa.health.shop.enumerate.LangEnum;
import com.bisa.health.shop.model.CompanyInfo;
import com.bisa.health.shop.model.HtmlInfo;
import com.bisa.health.shop.service.ICompanyInfoService;
import com.bisa.health.shop.service.IHtmlInfoService;
import com.bisa.health.shop.utils.TradeNoUtils;

import org.apache.commons.httpclient.util.LangUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.apache.shiro.authz.annotation.Logical;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.websocket.server.PathParam;

import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * bisa管理系统后台   页面生成
 * @author Administrator
 */
@Controller
@RequestMapping(value = "/admin/page")
@RequiresRoles(value = {"ROLE_ADMIN", "ROLE_CUSTOMER"},  logical = Logical.OR)
public class AdminPageController {

    @Autowired
    private IHtmlInfoService adminHtmlInfoService;
    @Autowired
    private ICompanyInfoService companyInfoService;
    
    @Autowired
    FreemarkerComponent freemarkerComponent;
    
	@Autowired
	private InternationalizationUtil i18nUtil;
    
    private static Logger logger = LogManager.getFormatterLogger(AdminIndexController.class);

    
    /**
     * 页面设置
     * @return
     */
    @RequestMapping(value = "/main", method = RequestMethod.GET)
    public String UpPageContent(Integer id,Model model) {
    	
    	String fileUrl = this.getClass().getClassLoader().getResource("/ftl/html/zh_CN").getPath();
    	File file=new File(fileUrl);
    	File[] files=file.listFiles();
    	List<String> list=new ArrayList<String>();
    	for(File f: files){
    		if(!f.isDirectory())
    			list.add((f.getName().split("\\."))[0]);
    	}
    	model.addAttribute("list", list);
    	
        return "admin/config/page";
    }

    
    
    @RequestMapping(value = "/ajax/save", method = RequestMethod.POST,produces = "application/json; charset=utf-8")
	@ResponseBody
    public  ResponseEntity<ResultData> addPage(Model model,@Validated HtmlInfo htmlInfo,BindingResult br) {
    	
        if (br.hasErrors()) {
			return new ResponseEntity<ResultData>(
					ResultData.success(SysStatusCode.FAIL, i18nUtil.i18n(SysErrorCode.RequestFormat)), HttpStatus.OK);
		}
		if (htmlInfo.getId()== 0)
			adminHtmlInfoService.addHtmlInfo(htmlInfo);
		else
			adminHtmlInfoService.updateHtmlInfo(htmlInfo);
		return new ResponseEntity<ResultData>(
				ResultData.success(SysStatusCode.SUCCESS, i18nUtil.i18n(SysErrorCode.OptSuccess)), HttpStatus.OK);
    }
    
    
    /**
     * 查询所有页面
     * @param page
     * @param limit
     * @return
     */
    @RequestMapping(value = "/ajax/list")
    @ResponseBody
    public Pager<HtmlInfo> list(){
        SystemContext.setSort("order_id"); // 默认按订单时间倒序
        SystemContext.setOrder("asc");
    	Pager<HtmlInfo> listPageDto=adminHtmlInfoService.page(SystemContext.getPageOffset());
        return listPageDto;
    }
    

    /**
     * 根据id查询网页信息
     * @param id
     * @return
     */
    @RequestMapping(value = "/ajax/{id}", method = RequestMethod.GET)
    @ResponseBody
    public HtmlInfo loadById(@PathVariable(value="id") Integer id){
        HtmlInfo htmlInfo=adminHtmlInfoService.selectHtmlInfoById(id);
        return htmlInfo;
    }
    /**
     * 根据id删除网页信息
     * @param id
     * @return
     */
    @RequestMapping(value = "/ajax/{id}", method = RequestMethod.DELETE)
    @ResponseBody
    public JsonResult delectById(@PathVariable(value="id")Integer id){
        JsonResult jsonResult = new JsonResult();
        jsonResult.setFlag(adminHtmlInfoService.delectHtmlInfoById(id));
        return jsonResult;
    }
    
    
    
    /**
     * 根据id生成网页信息
     * @param id
     * @return
     */
    @RequestMapping(value = "/ajax/{id}", method = RequestMethod.POST)
    @ResponseBody
    public JsonResult addById(@PathVariable(value="id")Integer id){
        JsonResult jsonResult = new JsonResult();
        HtmlInfo htmlInfo = adminHtmlInfoService.selectHtmlInfoById(id);
        Map<String,Object> root =new HashMap<String,Object>();
        root.put("html_keyWord", htmlInfo.getHtml_keyWord_CN());
        root.put("html_description",htmlInfo.getHtml_description_CN());
        root.put("html_title", htmlInfo.getHtml_title_CN());
        freemarkerComponent.generateBody(root, LangEnum.zh_CN.getName(),htmlInfo.getName()+".ftl", htmlInfo.getName()+".html");
        root =new HashMap<String,Object>();
        root.put("html_keyWord", htmlInfo.getHtml_keyWord_HK());
        root.put("html_description",htmlInfo.getHtml_description_HK());
        root.put("html_title", htmlInfo.getHtml_title_HK());
        freemarkerComponent.generateBody(root, LangEnum.zh_HK.getName(),htmlInfo.getName()+".ftl", htmlInfo.getName()+".html");
        root =new HashMap<String,Object>();
        root.put("html_keyWord", htmlInfo.getHtml_keyWord_US());
        root.put("html_description",htmlInfo.getHtml_description_US());
        root.put("html_title", htmlInfo.getHtml_title_US());
        freemarkerComponent.generateBody(root, LangEnum.en_US.getName(),htmlInfo.getName()+".ftl", htmlInfo.getName()+".html");
        jsonResult.setFlag(true);
        return jsonResult;
    }
    /**
     * 创建所有页面
     * @return
     */
    @RequestMapping(value = "/ajax/generate/all", method = RequestMethod.POST)
    @ResponseBody
    public ResponseEntity<ResultData> CreateAllPages(){
        List<HtmlInfo> list = adminHtmlInfoService.selectHtmlInfo();
        Map<String,Object> root=null;
        for(HtmlInfo htmlInfo : list){
        	 //生成首页
            root =new HashMap<String,Object>();
            root.put("html_keyWord", htmlInfo.getHtml_keyWord_CN());
            root.put("html_description",htmlInfo.getHtml_description_CN());
            root.put("html_title", htmlInfo.getHtml_title_CN());
            freemarkerComponent.generateBody(root, LangEnum.zh_CN.getName(),htmlInfo.getName()+".ftl", htmlInfo.getName()+".html");
            root =new HashMap<String,Object>();
            root.put("html_keyWord", htmlInfo.getHtml_keyWord_HK());
            root.put("html_description",htmlInfo.getHtml_description_HK());
            root.put("html_title", htmlInfo.getHtml_title_HK());
            freemarkerComponent.generateBody(root, LangEnum.zh_HK.getName(),htmlInfo.getName()+".ftl", htmlInfo.getName()+".html");
            root =new HashMap<String,Object>();
            root.put("html_keyWord", htmlInfo.getHtml_keyWord_US());
            root.put("html_description",htmlInfo.getHtml_description_US());
            root.put("html_title", htmlInfo.getHtml_title_US());
            freemarkerComponent.generateBody(root, LangEnum.en_US.getName(),htmlInfo.getName()+".ftl", htmlInfo.getName()+".html");

        }
        return new ResponseEntity<ResultData>(
				ResultData.success(SysStatusCode.SUCCESS, i18nUtil.i18n(SysErrorCode.OptSuccess)), HttpStatus.OK);
       
    }
    /**
     * 创建静态头部页面
     * @return
     */
    @RequestMapping(value = "/ajax/generate/header", method = RequestMethod.POST)
    @ResponseBody
    public ResponseEntity<ResultData> GenerateHeaderHTML(HttpServletRequest request){
        List<HtmlInfo> list = adminHtmlInfoService.selectHtmlInfo(1);
        CompanyInfo companyInfo =  companyInfoService.loadByUnId(1);
        freemarkerComponent.generateTop(list,companyInfo);
        return new ResponseEntity<ResultData>(
				ResultData.success(SysStatusCode.SUCCESS, i18nUtil.i18n(SysErrorCode.OptSuccess)), HttpStatus.OK);
    }
    /**
     * 创建尾部页面
     * @return
     */
    @RequestMapping(value = "/ajax/generate/footer", method = RequestMethod.POST)
    @ResponseBody
    public ResponseEntity<ResultData> GenerateFooterHTML(){
        CompanyInfo companyInfo =  companyInfoService.loadByUnId(1);
        freemarkerComponent.generateBottom(companyInfo);
        return new ResponseEntity<ResultData>(
				ResultData.success(SysStatusCode.SUCCESS, i18nUtil.i18n(SysErrorCode.OptSuccess)), HttpStatus.OK);
    }
    
}
