package com.bisa.health.shop.dao;

import com.bisa.health.basic.dao.BaseDao;
import com.bisa.health.shop.model.CompanyInfo;
import org.springframework.stereotype.Repository;

@Repository
public class AdminCompanyInfoDaoImpl extends BaseDao<CompanyInfo> implements ICompanyInfoDao {

    @Override
    public CompanyInfo loadByUnId(int uniqueid) {
        String sql = "select * FROM s_company_info where uniqueid=?";
        return super.queryObjectBySql(sql, new Object[]{uniqueid}, CompanyInfo.class, true);
    }


}
