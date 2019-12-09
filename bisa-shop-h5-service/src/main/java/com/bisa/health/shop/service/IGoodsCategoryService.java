package com.bisa.health.shop.service;

import java.util.List;

import com.bisa.health.basic.entity.Pager;
import com.bisa.health.shop.model.GoodsCategory;

/**
 * 商品分类
 * @author Administrator
 */

public interface IGoodsCategoryService{
	
	public GoodsCategory loadById(int id);
	public GoodsCategory loadByNumber(String number,String language);
	public Pager<GoodsCategory> listAll(Integer offset);
	public Pager<GoodsCategory> listAll(String language,Integer offset);
	public Pager<GoodsCategory> listBySuperid(int super_id,Integer offset);
	public List<GoodsCategory> listAllByNumber();
	public List<GoodsCategory> listAllByLanguage(String language);
	public GoodsCategory save(GoodsCategory goodsCategory);
	public GoodsCategory update(GoodsCategory goodsCategory);
	public void delete(int id);
}
