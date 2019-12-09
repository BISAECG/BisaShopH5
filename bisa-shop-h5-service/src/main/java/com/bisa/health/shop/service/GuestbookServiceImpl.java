package com.bisa.health.shop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.stereotype.Service;

import com.bisa.health.basic.entity.Pager;
import com.bisa.health.shop.dao.IGuestbookDao;
import com.bisa.health.shop.model.Guestbook;


@Service
@CacheConfig(cacheNames = "GuestbookServiceImpl")
public class GuestbookServiceImpl implements IGuestbookService {
    
	@Autowired
	private IGuestbookDao iGuestbookDao;
	
	@Override
	public Guestbook getGuestbookById(int id) {
		return iGuestbookDao.getGuestbookById(id);
	}

	@Override
	public Pager<Guestbook> getPageGuestbook(int offset,String vKey, String vVal) {
		return iGuestbookDao.getPageGuestbook(vKey, vVal);
	}

	@Override
	public List<Guestbook> listGuestbook() {
		return iGuestbookDao.listGuestbook();
	}

	@Override
	public Guestbook addGuestbook(Guestbook guestbook) {
		return iGuestbookDao.add(guestbook);
	}

	@Override
	public Guestbook updateGuestbook(Guestbook guestbook) {
		iGuestbookDao.update(guestbook);
		return guestbook;
	}

	@Override
	public void deleteGuestbook(int id) {
		iGuestbookDao.delete(id);
	}

}
