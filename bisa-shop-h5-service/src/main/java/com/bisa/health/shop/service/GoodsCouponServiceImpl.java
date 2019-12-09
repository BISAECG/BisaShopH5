package com.bisa.health.shop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.stereotype.Service;

import com.bisa.health.basic.entity.Pager;
import com.bisa.health.shop.dao.IGoodsCouponDao;
import com.bisa.health.shop.model.GoodsCoupon;


@Service
@CacheConfig(cacheNames = "GoodsCouponServiceImpl")
public class GoodsCouponServiceImpl implements IGoodsCouponService {
    
	@Autowired
	private IGoodsCouponDao iGoodsCouponDao;
	
	@Override
	public GoodsCoupon getGoodsCouponById(int id) {
		return iGoodsCouponDao.getGoodsCouponById(id);
	}

	@Override
	public Pager<GoodsCoupon> getPageGoodsCoupon(int offset,String vKey, String vVal) {
		return iGoodsCouponDao.getPageGoodsCoupon(vKey, vVal);
	}

	@Override
	public List<GoodsCoupon> listGoodsCoupon() {
		return iGoodsCouponDao.listGoodsCoupon();
	}

	@Override
	public GoodsCoupon addGoodsCoupon(GoodsCoupon goodsCoupon) {
		return iGoodsCouponDao.add(goodsCoupon);
	}

	@Override
	public GoodsCoupon updateGoodsCoupon(GoodsCoupon goodsCoupon) {
		iGoodsCouponDao.update(goodsCoupon);
		return goodsCoupon;
	}

	@Override
	public void deleteGoodsCoupon(int id) {
		iGoodsCouponDao.delete(id);
	}

	@Override
	public GoodsCoupon getGoodsCouponByNum(String num) {
		return iGoodsCouponDao.getGoodsCouponByNum(num);
	}

}
