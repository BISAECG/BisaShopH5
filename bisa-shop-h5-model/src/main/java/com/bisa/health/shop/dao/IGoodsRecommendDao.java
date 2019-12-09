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

public interface IGoodsRecommendDao extends IBaseDao<GoodsRecommend>{
	
	public GoodsRecommend addGoodsRecommend(GoodsRecommend goodsRecommend);
	public List<GoodsRecommend> listRecommendByNum(String num);
	public int delGoodsRecommendByNum(String num);
	
}
