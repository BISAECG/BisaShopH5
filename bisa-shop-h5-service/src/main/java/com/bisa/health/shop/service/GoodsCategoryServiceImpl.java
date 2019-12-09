package com.bisa.health.shop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import com.bisa.health.basic.entity.Pager;
import com.bisa.health.basic.entity.SystemContext;
import com.bisa.health.shop.dao.IGoodsCategoryDao;
import com.bisa.health.shop.model.GoodsCategory;

@Service
@CacheConfig(cacheNames = "GoodsCategoryServiceImpl")
public class GoodsCategoryServiceImpl implements IGoodsCategoryService {

	@Autowired
	private IGoodsCategoryDao iGoodsCategoryDao;
	
	@Override
	@Cacheable(key="targetClass.name+methodName+#offset")
	public Pager<GoodsCategory> listAll(Integer offset) {
		return iGoodsCategoryDao.listAll();
	}

	@Override
	@Cacheable(key="targetClass.name+methodName+#super_id+#offset")
	public Pager<GoodsCategory> listBySuperid(int super_id,Integer offset) {
		return iGoodsCategoryDao.listBySuperid(super_id);
	}

	@Override
	@Cacheable(key="targetClass.name+methodName+#id")
	public GoodsCategory loadById(int id) {
		return iGoodsCategoryDao.loadById(id);
	}

	@Override
	@CacheEvict(value="GoodsCategoryServiceImpl",allEntries=true)
	public GoodsCategory save(GoodsCategory goodsCategory) {
		return iGoodsCategoryDao.add(goodsCategory);
	}

	@Override
	@CacheEvict(value="GoodsCategoryServiceImpl",allEntries=true)
	public GoodsCategory update(GoodsCategory goodsCategory) {
		 iGoodsCategoryDao.update(goodsCategory);
		 return goodsCategory;
	}

	@Override
	@CacheEvict(value="GoodsCategoryServiceImpl",allEntries=true)
	public void delete(int id) {
		iGoodsCategoryDao.delete(id);
	}

	@Override
	public GoodsCategory loadByNumber(String number, String language) {
		return iGoodsCategoryDao.loadByNumber(number, language);
	}

	@Override
	public Pager<GoodsCategory> listAll(String language, Integer offset) {
		return iGoodsCategoryDao.listAll(language);
	}

	@Override
	public List<GoodsCategory> listAllByNumber() {
		return iGoodsCategoryDao.listAllByNumber();
	}

	@Override
	public List<GoodsCategory> listAllByLanguage(String language) {
		return iGoodsCategoryDao.listByLanguage(language);
	}
	
	

}
