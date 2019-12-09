package com.bisa.health.shop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.stereotype.Service;

import com.bisa.health.basic.entity.Pager;
import com.bisa.health.shop.dao.IOrderDao;
import com.bisa.health.shop.model.Order;


@Service
@CacheConfig(cacheNames = "OrderServiceImpl")
public class OrderServiceImpl implements IOrderService {
    
	@Autowired
	private IOrderDao iOrderDao;
	
	@Override
	public Order getOrderById(int id) {
		return iOrderDao.getOrderById(id);
	}

	@Override
	public Pager<Order> getPageOrder(int offset,String vKey, String vVal) {
		return iOrderDao.getPageOrder(vKey, vVal);
	}

	@Override
	public List<Order> listOrder() {
		return iOrderDao.listOrder();
	}

	@Override
	public Order addOrder(Order order) {
		return iOrderDao.add(order);
	}

	@Override
	public Order updateOrder(Order order) {
		iOrderDao.update(order);
		return order;
	}

	@Override
	public void deleteOrder(int id) {
		iOrderDao.delete(id);
	}

	@Override
	public Order getOrderByNum(String num) {
		return iOrderDao.getOrderByNum(num);
	}

}
