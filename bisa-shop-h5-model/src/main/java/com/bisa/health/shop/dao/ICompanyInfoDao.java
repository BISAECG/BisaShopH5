package com.bisa.health.shop.dao;

import com.bisa.health.basic.dao.IBaseDao;
import com.bisa.health.shop.model.CompanyInfo;

public interface ICompanyInfoDao  extends IBaseDao<CompanyInfo>{

    /**
     * 查询公司信息
     * @return
     */
    CompanyInfo loadByUnId(int uniqueid);
}
