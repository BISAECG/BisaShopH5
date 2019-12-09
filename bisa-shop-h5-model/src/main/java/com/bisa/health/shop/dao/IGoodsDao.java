package com.bisa.health.shop.dao;

import com.bisa.health.basic.dao.IBaseDao;
import com.bisa.health.basic.entity.Pager;
import com.bisa.health.shop.model.Goods;
import com.bisa.health.shop.model.GoodsRecommend;

import java.util.List;
import java.util.Map;

/**
 * 新闻表
 * @author Administrator
 */

public interface IGoodsDao extends IBaseDao<Goods>{
	
	public Pager<Goods> listAllGroupNumber();
	public Pager<Goods> pageAllByLanguage(String language,String vKey,String vVal);
	public List<Goods> listAllByLanguage(String language);
	public List<Goods> listAllByLanguage(String language,Map<String,Object> alias);
	public Goods loadByNumAndlanguage(String num,String language);
	public List<Goods> listByNum(String num);
	public List<Goods> listByCategoryNum(String categoryNum,String language);
	public Goods loadById(int id);
	public List<Goods> listByNum(Map<String, Object> alias); 
	
}
