package com.bisa.health.shop.dao;

import com.bisa.health.basic.dao.IBaseDao;
import com.bisa.health.basic.entity.Pager;
import com.bisa.health.shop.model.NewsClassify;

import java.util.List;

/**
 * 新闻表
 * @author Administrator
 */

public interface INewsClassifyDao extends IBaseDao<NewsClassify>{
	
	public Pager<NewsClassify> listAll();
	public Pager<NewsClassify> listAll(String language);
	public NewsClassify loadById(int id);
	public NewsClassify loadByNumber(String number,String language);
	public List<NewsClassify> listAllByNumber();
	public List<NewsClassify> listByLanguage(String language);
}
