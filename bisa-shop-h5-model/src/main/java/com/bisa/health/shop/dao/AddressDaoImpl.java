package com.bisa.health.shop.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.bisa.health.basic.dao.BaseDao;
import com.bisa.health.basic.entity.Pager;
import com.bisa.health.shop.model.Address;
import com.bisa.health.shop.model.Pay;

@Repository
public class AddressDaoImpl extends BaseDao<Address> implements IAddressDao {

	@Override
	public Address getAddressById(int id) {
		return super.load(id);
	}

	@Override
	public List<Address> listAddress(int userId) {
		String sql = "SELECT * FROM s_address WHERE user_id=?";
		return super.listBySql(sql, new Object[]{userId}, Address.class);
	}

	@Override
	public Pager<Address> pagerAddress(int userId) {
		String sql = "SELECT * FROM s_address WHERE user_id=?";
		return super.findBySql(sql, new Object[]{userId}, Address.class,true);
	}

	@Override
	public void updateByDefault(String def,int userId) {
		String sql = "UPDATE s_address SET is_default=? WHERE user_id=?";
		super.queryBySql(sql, new Object[]{def,userId});
		
	}
	
	
	
	
}
