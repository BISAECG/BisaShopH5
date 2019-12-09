package com.bisa.health.shop.admin.controller;

import com.bisa.health.shop.model.CompanyInfo;
import com.bisa.health.shop.service.ICompanyInfoService;

import java.util.Date;

import org.apache.shiro.authz.annotation.Logical;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping(value = "/admin")
@RequiresRoles(value = {"ROLE_ADMIN"}, logical = Logical.OR)
public class AdminCompanyInfoController {
    @Autowired
    private ICompanyInfoService companyInfoService;

    /**
     * 修改公司显示信息
     * @param companyInfo
     * @return
     */
    @RequestMapping(value = "/ajax/company", method = RequestMethod.POST,produces = "application/json; charset=utf-8")
    @ResponseBody
    public CompanyInfo saveAjaxCompany(CompanyInfo companyInfo){
    	
    	CompanyInfo mCompanyInfo = companyInfoService.loadByUnId(1);
    	if(mCompanyInfo==null){
    		companyInfo.setUpdate_time(new Date());
    		companyInfoService.add(companyInfo);
    	}else{
    		mCompanyInfo.toThis(companyInfo);
    		companyInfoService.update(mCompanyInfo);
    	}
        return companyInfo;
    }
    @RequestMapping(value = "/ajax/company", method = RequestMethod.GET)
    @ResponseBody
    public CompanyInfo loadAjaxCompany(){
        CompanyInfo  companyInfo = companyInfoService.loadByUnId(1);
        return companyInfo;
    }
}
