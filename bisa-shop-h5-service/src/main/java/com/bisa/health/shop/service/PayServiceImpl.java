package com.bisa.health.shop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.stereotype.Service;

import com.bisa.health.basic.entity.Pager;
import com.bisa.health.shop.dao.IPayDao;
import com.bisa.health.shop.model.Pay;


@Service
@CacheConfig(cacheNames = "PayServiceImpl")
public class PayServiceImpl implements IPayService {
    
	@Autowired
	private IPayDao iPayDao;
	
	@Override
	public Pay getPayById(int id) {
		return iPayDao.getPayById(id);
	}

	@Override
	public Pager<Pay> getPagePay(int offset,String vKey, String vVal) {
		return iPayDao.getPagePay(vKey, vVal);
	}

	@Override
	public List<Pay> listPay() {
		return iPayDao.listPay();
	}

	@Override
	public Pay addPay(Pay pay) {
		return iPayDao.add(pay);
	}

	@Override
	public Pay updatePay(Pay pay) {
		iPayDao.update(pay);
		return pay;
	}

	@Override
	public void deletePay(int id) {
		iPayDao.delete(id);
	}

	@Override
	public Pay getPatByOrderNum(String order_num) {
		return iPayDao.getPatByOrderNum(order_num);
	}
	
	

}
