package com.bisa.health.shop.dao;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Repository;

import com.bisa.health.basic.dao.BaseDao;
import com.bisa.health.basic.entity.Pager;
import com.bisa.health.shop.model.Order;

@Repository
public class OrderDaoImpl extends BaseDao<Order> implements IOrderDao {


	@Override
	public Order getOrderById(int id) {
		String sql = "SELECT * FROM s_order WHERE ID=?";
		return super.queryObjectBySql(sql, new Object[] { id }, Order.class);
	}


	@Override
	public Pager<Order> getPageOrder(String vKey, String vVal) {

		String sql = "SELECT * " + "FROM s_order ";

		if (!StringUtils.isEmpty(vKey)) {
			sql = "SELECT * FROM s_order WHERE  " + vKey + " LIKE '" + vVal + "%'";

		}
		return super.findBySql(sql,null, Order.class, true);
	}


	@Override
	public List<Order> listOrder() {
		String sql = "SELECT * FROM s_order";
		return super.listBySql(sql, null, Order.class);
	}


	@Override
	public Order getOrderByNum(String num) {
		String sql = "SELECT * FROM s_order WHERE order_num=?";
		return super.queryObjectBySql(sql, new Object[] { num }, Order.class);
	}
}
