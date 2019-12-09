package com.bisa.health.shop.service;

import java.util.List;

import com.bisa.health.basic.entity.Pager;
import com.bisa.health.shop.model.NewsClassify;

/**
 * 商品分类
 * @author Administrator
 */

public interface INewsClassifyService{
	
	public NewsClassify loadById(int id);
	public NewsClassify loadByNumber(String number,String language);
	public Pager<NewsClassify> listAll(Integer offset);
	public Pager<NewsClassify> listAll(String language,Integer offset);
	public List<NewsClassify> listAllByNumber();
	public List<NewsClassify> listAllByLanguage(String language);
	public NewsClassify save(NewsClassify NewsClassify);
	public NewsClassify update(NewsClassify NewsClassify);
	public void delete(int id);
}
