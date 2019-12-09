package com.bisa.health.shop.dao;

import com.bisa.health.basic.dao.IBaseDao;
import com.bisa.health.basic.entity.Pager;
import com.bisa.health.shop.model.GoodsCategory;

import java.util.List;

/**
 * 新闻表
 * @author Administrator
 */

public interface IGoodsCategoryDao extends IBaseDao<GoodsCategory>{
	
	public Pager<GoodsCategory> listAll();
	public Pager<GoodsCategory> listAll(String language);
	public Pager<GoodsCategory> listBySuperid(int super_id);
	public GoodsCategory loadById(int id);
	public GoodsCategory loadByNumber(String number,String language);
	public List<GoodsCategory> listAllByNumber();
	public List<GoodsCategory> listByLanguage(String language);
}
