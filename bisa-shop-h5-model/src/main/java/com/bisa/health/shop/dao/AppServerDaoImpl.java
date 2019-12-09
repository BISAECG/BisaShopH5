package com.bisa.health.shop.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.bisa.health.basic.dao.BaseDao;
import com.bisa.health.basic.entity.Pager;
import com.bisa.health.basic.entity.Pager;
import com.bisa.health.shop.model.AppServer;
import com.bisa.health.shop.model.AppUpdate;

@Repository
public class AppServerDaoImpl extends BaseDao<AppServer> implements IAppServerDao {

	
	@Override
	public void updateStatus(String version) {
		String sql="update s_server set version=?";
		this.updateBySql(sql, new Object[]{version});
	}


	@Override
	public AppServer loadByID(int id) {
		String sql="SELECT * from s_server id=?";
		return this.queryObjectBySql(sql, null, AppServer.class);
	}


	@Override
	public Pager<AppServer> listPager() {
		String sql="SELECT * from s_server";
		return this.findBySql(sql,null,AppServer.class,true);
	}
	

	@Override
	public AppServer saveAppServer(AppServer appServer) {
		return this.add(appServer);
	}


	@Override
	public void updateAppServer(AppServer appServer) {
		this.getSession().merge(appServer);
	}


	@Override
	public void deleteAppServer(AppServer appServer) {
		this.delete(appServer.getId());
	}


	@Override
	public AppServer loadByVersion() {
		String sql="SELECT * from s_server order by id desc";
		return this.queryObjectBySql(sql, null, AppServer.class);
	}


	@Override
	public List<AppServer> list() {
		String sql="SELECT * from s_server";
		return this.listBySql(sql, AppServer.class, true);
	}
	
	


}
