package com.bisa.health.shop.dao;

import java.util.List;

import com.bisa.health.basic.dao.IBaseDao;
import com.bisa.health.basic.entity.Pager;
import com.bisa.health.shop.model.AppUpdate;

public interface IAppUpdateDao extends IBaseDao<AppUpdate>{
	public void updateStatus(int id);
	public Pager<AppUpdate> page();
	public AppUpdate loadByStatus(int status);
	public AppUpdate loadByVersion(String version);
	public AppUpdate load(int id);
	public Pager<AppUpdate> pageLikeAll(String keyword);
}
