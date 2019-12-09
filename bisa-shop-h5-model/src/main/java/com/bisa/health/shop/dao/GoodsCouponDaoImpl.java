package com.bisa.health.shop.dao;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Repository;

import com.bisa.health.basic.dao.BaseDao;
import com.bisa.health.basic.entity.Pager;
import com.bisa.health.shop.model.GoodsCoupon;

@Repository
public class GoodsCouponDaoImpl extends BaseDao<GoodsCoupon> implements IGoodsCouponDao {

	@Override
	public GoodsCoupon getGoodsCouponById(int id) {
		String sql = "SELECT * FROM s_coupon WHERE id=?";
		return super.queryObjectBySql(sql, new Object[] { id }, GoodsCoupon.class);
	}


	@Override
	public Pager<GoodsCoupon> getPageGoodsCoupon(String vKey, String vVal) {

		String sql = "SELECT * " + "FROM s_coupon ";

		if (!StringUtils.isEmpty(vKey)) {
			sql = "SELECT * FROM s_coupon WHERE  " + vKey + " LIKE '" + vVal + "%'";

		}
		return super.findBySql(sql,null, GoodsCoupon.class, true);
	}


	@Override
	public List<GoodsCoupon> listGoodsCoupon() {
		String sql = "SELECT * FROM s_coupon";
		return super.listBySql(sql, null, GoodsCoupon.class);
	}


	@Override
	public GoodsCoupon getGoodsCouponByNum(String num) {
		String sql = "SELECT * FROM s_coupon WHERE coupon_num=? AND coupon_status=1";
		return super.queryObjectBySql(sql, new Object[] { num }, GoodsCoupon.class);
	}

	
}
