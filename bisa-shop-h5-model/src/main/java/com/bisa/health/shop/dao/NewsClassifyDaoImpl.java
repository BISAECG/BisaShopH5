package com.bisa.health.shop.dao;

import java.util.List;

import org.springframework.stereotype.Repository;
import com.bisa.health.basic.dao.BaseDao;
import com.bisa.health.basic.entity.Pager;
import com.bisa.health.shop.model.NewsClassify;

@Repository
public class NewsClassifyDaoImpl extends BaseDao<NewsClassify> implements INewsClassifyDao {

	@Override
	public Pager<NewsClassify> listAll() {
		String sql = "SELECT a.*  FROM (SELECT * FROM s_news_classify GROUP BY number) AS a";
		return super.findBySql(sql, NewsClassify.class, true);
	}


	@Override
	public NewsClassify loadById(int id) {
		String sql = "SELECT * FROM s_news_classify WHERE id=?";
		return super.queryObjectBySql(sql, new Object[] { id }, NewsClassify.class);
	}

	@Override
	public NewsClassify loadByNumber(String number, String language) {
		String sql = "SELECT * FROM s_news_classify WHERE number=? AND language=?";
		return super.queryObjectBySql(sql, new Object[] { number, language }, NewsClassify.class);
	}

	@Override
	public Pager<NewsClassify> listAll(String language) {
		String sql = "SELECT *  FROM s_news_classify WHERE language=?";
		return super.findBySql(sql, new Object[] { language }, NewsClassify.class, true);
	}

	@Override
	public List<NewsClassify> listAllByNumber() {
		String sql = "SELECT a.* FROM (SELECT * FROM s_news_classify ORDER BY language)  AS a GROUP BY number;";
		return super.listBySql(sql, NewsClassify.class, true);
	}

	@Override
	public List<NewsClassify> listByLanguage(String language) {
		String sql = "SELECT * FROM s_news_classify WHERE language=?";
		return super.listBySql(sql, new Object[]{language}, NewsClassify.class);
	}

}
