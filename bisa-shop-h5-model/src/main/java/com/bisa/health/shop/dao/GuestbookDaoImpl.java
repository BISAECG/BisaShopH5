package com.bisa.health.shop.dao;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Repository;

import com.bisa.health.basic.dao.BaseDao;
import com.bisa.health.basic.entity.Pager;
import com.bisa.health.shop.model.Guestbook;

@Repository
public class GuestbookDaoImpl extends BaseDao<Guestbook> implements IGuestbookDao {


	@Override
	public Guestbook getGuestbookById(int id) {
		String sql = "SELECT * FROM s_guestbook WHERE ID=?";
		return super.queryObjectBySql(sql, new Object[] { id }, Guestbook.class);
	}


	@Override
	public Pager<Guestbook> getPageGuestbook(String vKey, String vVal) {

		String sql = "SELECT * " + "FROM s_guestbook ";

		if (!StringUtils.isEmpty(vKey)) {
			sql = "SELECT * FROM s_guestbook WHERE  " + vKey + " LIKE '" + vVal + "%'";

		}
		return super.findBySql(sql,null, Guestbook.class, true);
	}


	@Override
	public List<Guestbook> listGuestbook() {
		String sql = "SELECT * FROM s_guestbook";
		return super.listBySql(sql, null, Guestbook.class);
	}
}
