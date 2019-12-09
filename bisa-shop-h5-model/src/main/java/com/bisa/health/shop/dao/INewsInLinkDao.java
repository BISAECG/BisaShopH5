package com.bisa.health.shop.dao;

import com.bisa.health.basic.dao.IBaseDao;
import com.bisa.health.basic.entity.Pager;
import com.bisa.health.basic.entity.Pager;
import com.bisa.health.basic.entity.Pager;
import com.bisa.health.shop.model.News;
import com.bisa.health.shop.model.NewsInLink;

import java.util.List;

/**
 * 新闻表
 * @author Administrator
 */

public interface INewsInLinkDao extends IBaseDao<NewsInLink>{
	
    
    /**
     * ID查询
     * @param id
     * @return
     */
    NewsInLink loadNewsInLink(int id);
    /**
     * 分页查询内链接
     * @return
     */
    public Pager<NewsInLink> listPageLink();
    /**
     * 查询所有内链接
     * @return
     */
    List<NewsInLink> listLink();
   
}
