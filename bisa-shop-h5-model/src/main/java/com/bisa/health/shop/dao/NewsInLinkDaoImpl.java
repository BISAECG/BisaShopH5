package com.bisa.health.shop.dao;

import com.bisa.health.basic.dao.BaseDao;
import com.bisa.health.basic.entity.Pager;
import com.bisa.health.shop.model.NewsInLink;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class NewsInLinkDaoImpl extends BaseDao<NewsInLink> implements INewsInLinkDao {

	@Override
	public NewsInLink loadNewsInLink(int id) {
	    String sql = "select * from s_news_inlink WHERE id=?";
		return queryObjectBySql(sql, new Object[]{id}, NewsInLink.class);
	}
    
    @Override
    public Pager<NewsInLink> listPageLink() {
        String sql = "select * from s_news_inlink";
        return super.findBySql(sql, null,NewsInLink.class,true);
    }

    @Override
    public List<NewsInLink> listLink() {
        String sql = "select * from s_news_inlink";
        return super.listBySql(sql, null, NewsInLink.class,true);
    }


}
