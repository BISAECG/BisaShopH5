package com.bisa.health.shop.dao;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Repository;

import com.bisa.health.basic.dao.BaseDao;
import com.bisa.health.basic.entity.Pager;
import com.bisa.health.shop.model.Pay;

@Repository
public class PayDaoImpl extends BaseDao<Pay> implements IPayDao {


	@Override
	public Pay getPayById(int id) {
		String sql = "SELECT * FROM s_pay WHERE ID=?";
		return super.queryObjectBySql(sql, new Object[] { id }, Pay.class);
	}


	@Override
	public Pager<Pay> getPagePay(String vKey, String vVal) {

		String sql = "SELECT * FROM s_pay ";

		if (!StringUtils.isEmpty(vKey)) {
			sql = "SELECT * FROM s_pay WHERE  " + vKey + " LIKE '" + vVal + "%'";

		}
		return super.findBySql(sql,null, Pay.class, true);
	}


	@Override
	public List<Pay> listPay() {
		String sql = "SELECT * FROM s_pay";
		return super.listBySql(sql, null, Pay.class);
	}
}
