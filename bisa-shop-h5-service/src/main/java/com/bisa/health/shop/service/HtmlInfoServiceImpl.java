package com.bisa.health.shop.service;

import com.bisa.health.basic.entity.Pager;
import com.bisa.health.basic.entity.SystemContext;
import com.bisa.health.shop.dao.IHtmlInfoDao;
import com.bisa.health.shop.model.HtmlInfo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@CacheConfig(cacheNames = "HtmlInfoServiceImpl")
public class HtmlInfoServiceImpl implements IHtmlInfoService{


    @Autowired
    private IHtmlInfoDao iAdminHtmlInfoDao;

    @Override
    public HtmlInfo addHtmlInfo(HtmlInfo htmlInfo) {
        return iAdminHtmlInfoDao.addHtmlInfo(htmlInfo);
    }

    @Override
    public HtmlInfo updateHtmlInfo(HtmlInfo htmlInfo) {
        return iAdminHtmlInfoDao.updateHtmlInfo(htmlInfo);
    }

    @Override
    public Pager<HtmlInfo> page(Integer offset) {
        Pager<HtmlInfo> pagerOrder=iAdminHtmlInfoDao.page();
        return pagerOrder;
    }
    @Override
    public HtmlInfo selectHtmlInfoById(Integer id) {
        return iAdminHtmlInfoDao.selectHtmlInfoById(id);
    }

    @Override
    public Boolean delectHtmlInfoById(Integer id) {
        return iAdminHtmlInfoDao.delectHtmlInfoById(id);
    }

    @Override
    public List<HtmlInfo> selectHtmlInfo() {
        return iAdminHtmlInfoDao.selectHtmlInfo();
    }

	@Override
	public List<HtmlInfo> selectHtmlInfo(int type) {
		return iAdminHtmlInfoDao.selectHtmlInfo(type);
	}
}
