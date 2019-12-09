package com.bisa.health.shop.service;

import java.util.List;

import com.bisa.health.basic.entity.Pager;
import com.bisa.health.shop.model.AppServer;

public interface IAppServerService{
	public List<AppServer> list();
	public Pager<AppServer> listPager(Integer offset);
	public AppServer loadByID(int id);
	public AppServer loadByVersion();
	public void updateStatus(String version);
	public AppServer saveAppServer(AppServer appServer);
	public void updateAppServer(AppServer appServer);
	public void deleteAppServer(AppServer appServer);
}
