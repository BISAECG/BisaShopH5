package com.bisa.health.shop.service;

import com.bisa.health.shop.dao.ICompanyInfoDao;
import com.bisa.health.shop.model.CompanyInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.stereotype.Service;

@Service
@CacheConfig(cacheNames = "CompanyInfoServiceImpl")
public class CompanyInfoServiceImpl implements ICompanyInfoService {
    @Autowired
    private ICompanyInfoDao companyInfoDao;
    @Override
    public CompanyInfo add(CompanyInfo companyInfo) {
        return companyInfoDao.add(companyInfo);
    }
    
    @Override
    public CompanyInfo update(CompanyInfo companyInfo) {
         companyInfoDao.update(companyInfo);
         return companyInfo;
    }

    @Override
    public CompanyInfo loadByUnId(int uniqueid) {
        return companyInfoDao.loadByUnId(uniqueid);
    }
}
