package com.bisa.health.shop.dao;


import org.springframework.stereotype.Repository;
import com.bisa.health.basic.dao.BaseDao;
import com.bisa.health.basic.entity.Pager;
import com.bisa.health.shop.model.AppUpdate;

@Repository
public class AppUpdateDaoImpl extends BaseDao<AppUpdate> implements IAppUpdateDao {

	@Override
	public void updateStatus(int id) {
		String sql="UPDATE s_app SET status=0 WHERE id!=?";
		this.queryBySql(sql, new Object[]{id});
	}


	@Override
	public Pager<AppUpdate> page() {
		String sql="SELECT * FROM s_app";
		return this.findBySql(sql,null,AppUpdate.class,true);
	}

	@Override
	public AppUpdate loadByStatus(int status) {
		String sql="SELECT * FROM s_app WHERE status=?";
		return this.queryObjectBySql(sql, new Object[]{status}, AppUpdate.class);
	}

	@Override
	public Pager<AppUpdate> pageLikeAll(String keyword) {
		String sql="SELECT * FROM s_app  LIKE '"+keyword+"%'";
		return this.findBySql(sql,null,AppUpdate.class,true);
	}




	@Override
	public AppUpdate loadByVersion(String version) {
		String sql="SELECT * FROM s_app WHERE version=?";
		return this.queryObjectBySql(sql, new Object[]{version}, AppUpdate.class);
	}

}
