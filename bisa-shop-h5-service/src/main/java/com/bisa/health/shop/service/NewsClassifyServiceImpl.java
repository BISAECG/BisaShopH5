package com.bisa.health.shop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import com.bisa.health.basic.entity.Pager;
import com.bisa.health.shop.dao.INewsClassifyDao;
import com.bisa.health.shop.model.NewsClassify;

@Service
@CacheConfig(cacheNames = "NewsClassifyServiceImpl")
public class NewsClassifyServiceImpl implements INewsClassifyService {

	@Autowired
	private INewsClassifyDao iNewsClassifyDao;
	
	@Override
	@Cacheable(key="targetClass.name+methodName+#offset")
	public Pager<NewsClassify> listAll(Integer offset) {
		return iNewsClassifyDao.listAll();
	}


	@Override
	@Cacheable(key="targetClass.name+methodName+#id")
	public NewsClassify loadById(int id) {
		return iNewsClassifyDao.loadById(id);
	}

	@Override
	@CacheEvict(value="GoodsCategoryServiceImpl",allEntries=true)
	public NewsClassify save(NewsClassify NewsClassify) {
		return iNewsClassifyDao.add(NewsClassify);
	}

	@Override
	@CacheEvict(value="GoodsCategoryServiceImpl",allEntries=true)
	public NewsClassify update(NewsClassify NewsClassify) {
		 iNewsClassifyDao.update(NewsClassify);
		 return NewsClassify;
	}

	@Override
	@CacheEvict(value="GoodsCategoryServiceImpl",allEntries=true)
	public void delete(int id) {
		iNewsClassifyDao.delete(id);
	}

	@Override
	public NewsClassify loadByNumber(String number, String language) {
		return iNewsClassifyDao.loadByNumber(number, language);
	}

	@Override
	public Pager<NewsClassify> listAll(String language, Integer offset) {
		return iNewsClassifyDao.listAll(language);
	}

	@Override
	public List<NewsClassify> listAllByNumber() {
		return iNewsClassifyDao.listAllByNumber();
	}

	@Override
	public List<NewsClassify> listAllByLanguage(String language) {
		return iNewsClassifyDao.listByLanguage(language);
	}
	
	

}
