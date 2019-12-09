package com.bisa.health.shop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bisa.health.basic.entity.Pager;
import com.bisa.health.shop.dao.IAddressDao;
import com.bisa.health.shop.model.Address;

@Service
public class AddressServiceImpl implements IAddressService {

	@Autowired
	private IAddressDao addressDao;
	@Override
	public Address getAddressById(int id) {
		return addressDao.load(id);
	}

	@Override
	public List<Address> listAddress(int userId) {
		return addressDao.listAddress(userId);
	}

	@Override
	public Address save(Address address) {
		return addressDao.add(address);
	}

	@Override
	public Address update(Address address) {
		addressDao.update(address);
		return address;
	}

	@Override
	public Pager<Address> pagerAddress(int userId) {
		return addressDao.pagerAddress(userId);
	}

	@Override
	public void updateByDefault(String def, int userId) {
		addressDao.updateByDefault(def, userId);
	}
	
	

}
