package com.bisa.health.shop.service;

import com.bisa.health.shop.model.CompanyInfo;

public interface ICompanyInfoService {
    /**
     * 修改公司信息
     * @param companyInfo
     * @return
     */
    CompanyInfo add(CompanyInfo companyInfo);

    /**
     * 修改公司信息
     * @param companyInfo
     * @return
     */
    CompanyInfo update(CompanyInfo companyInfo);
    
    /**
     * 查询公司信息
     * @return
     */
    CompanyInfo loadByUnId(int uniqueid);
}
