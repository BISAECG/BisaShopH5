package com.bisa.health.shop.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.bisa.health.basic.dao.BaseDao;
import com.bisa.health.shop.model.GoodsRecommend;

@Repository
public class GoodsRecommendDaoImpl extends BaseDao<GoodsRecommend> implements IGoodsRecommendDao {

	@Override
	public GoodsRecommend addGoodsRecommend(GoodsRecommend goodsRecommend) {
		return super.add(goodsRecommend);
	}

	@Override
	public List<GoodsRecommend> listRecommendByNum(String num) {
		String sql="SELECT * FROM s_recommend where goods_number=?";
		return super.listBySql(sql, new Object[]{num}, GoodsRecommend.class);
	}

	@Override
	public int delGoodsRecommendByNum(String num) {
		String sql="DELETE FROM s_recommend WHERE  goods_number=?";
		return super.queryBySql(sql, new Object[]{num});
	}
	
	
}
