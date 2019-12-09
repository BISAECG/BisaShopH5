package com.bisa.health.shop.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bisa.health.basic.entity.Pager;
import com.bisa.health.shop.dao.IGoodsDao;
import com.bisa.health.shop.dao.IGoodsRecommendDao;
import com.bisa.health.shop.model.Goods;
import com.bisa.health.shop.model.GoodsRecommend;

@Service
public class GoodsServiceImpl implements IGoodsService {

	@Autowired
	private IGoodsDao goodsDao;
	@Autowired
	private IGoodsRecommendDao goodsRecommendDao;
	
	@Override
	public Pager<Goods> listAllGroupNumber(Integer offset) {
		return goodsDao.listAllGroupNumber();
	}

	@Override
	public Goods loadByNumAndlanguage(String num, String language) {
		return goodsDao.loadByNumAndlanguage(num, language);
	}

	@Override
	public List<Goods> listByNum(String num) {
		return goodsDao.listByNum(num);
	}
	

	@Override
	public Goods loadById(int id) {
		return goodsDao.load(id);
	}

	@Override
	public Goods save(Goods goods) {
		return goodsDao.add(goods);
	}

	@Override
	public Goods update(Goods goods) {
		goodsDao.update(goods);
		return goods;
	}

	@Override
	public void delete(int id) {
		goodsDao.delete(id);
	}

	@Override
	public List<Goods> listByCategoryNum(String categoryNum,String language){
		return goodsDao.listByCategoryNum(categoryNum,language);
	}

	@Override
	public List<Goods> listByNum(Map<String, Object> alias) {
		return goodsDao.listByNum(alias);
	}

	@Override
	public List<GoodsRecommend> listRecommendByNum(String num) {
		return goodsRecommendDao.listRecommendByNum(num);
	}

	@Override
	public int delGoodsRecommendByNum(String num) {
		return goodsRecommendDao.delGoodsRecommendByNum(num);
	}


	@Override
	public GoodsRecommend addGoodsRecommend(GoodsRecommend goodsRecommend) {
		return goodsRecommendDao.add(goodsRecommend);
	}

	@Override
	public Pager<Goods> pageAllByLanguage(String language, String vKey, String vVal,int offset) {
		return goodsDao.pageAllByLanguage(language, vKey, vVal);
	}

	@Override
	public List<Goods> listAllByLanguage(String language) {
		return goodsDao.listAllByLanguage(language);
	}

	@Override
	public List<Goods> listAllByLanguage(String language, Map<String, Object> alias) {
		return goodsDao.listAllByLanguage(language, alias);
	}



}
