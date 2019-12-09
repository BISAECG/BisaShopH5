package com.bisa.health.shop.dao;


import java.util.List;

import com.bisa.health.basic.dao.IBaseDao;
import com.bisa.health.basic.entity.Pager;
import com.bisa.health.shop.model.AppServer;

public interface IAppServerDao extends IBaseDao<AppServer>{
	public List<AppServer> list();
	public Pager<AppServer> listPager();
	public AppServer loadByID(int id);
	public AppServer loadByVersion();
	public void updateStatus(String version);
	public AppServer saveAppServer(AppServer appServer);
	public void updateAppServer(AppServer appServer);
	public void deleteAppServer(AppServer appServer);
}
