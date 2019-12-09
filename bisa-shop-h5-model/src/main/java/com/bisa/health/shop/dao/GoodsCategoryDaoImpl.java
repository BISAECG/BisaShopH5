package com.bisa.health.shop.dao;

import java.util.List;

import org.springframework.stereotype.Repository;
import com.bisa.health.basic.dao.BaseDao;
import com.bisa.health.basic.entity.Pager;
import com.bisa.health.shop.model.GoodsCategory;

@Repository
public class GoodsCategoryDaoImpl extends BaseDao<GoodsCategory> implements IGoodsCategoryDao {

	@Override
	public Pager<GoodsCategory> listAll() {
		String sql = "SELECT a.*  FROM (SELECT * FROM s_category GROUP BY number) AS a";
		return super.findBySql(sql, GoodsCategory.class, true);
	}

	@Override
	public Pager<GoodsCategory> listBySuperid(int super_id) {
		String sql = "SELECT * FROM s_category WHERE super_id=?";
		return super.findBySql(sql, new Object[] { super_id }, GoodsCategory.class, true);
	}

	@Override
	public GoodsCategory loadById(int id) {
		String sql = "SELECT * FROM s_category WHERE id=?";
		return super.queryObjectBySql(sql, new Object[] { id }, GoodsCategory.class);
	}

	@Override
	public GoodsCategory loadByNumber(String number, String language) {
		String sql = "SELECT * FROM s_category WHERE number=? AND language=?";
		return super.queryObjectBySql(sql, new Object[] { number, language }, GoodsCategory.class);
	}

	@Override
	public Pager<GoodsCategory> listAll(String language) {
		String sql = "SELECT *  FROM s_category WHERE language=?";
		return super.findBySql(sql, new Object[] { language }, GoodsCategory.class, true);
	}

	@Override
	public List<GoodsCategory> listAllByNumber() {
		String sql = "SELECT a.* FROM (SELECT * FROM s_category ORDER BY language)  AS a GROUP BY number";
		return super.listBySql(sql, GoodsCategory.class, true);
	}

	@Override
	public List<GoodsCategory> listByLanguage(String language) {
		String sql = "SELECT * FROM s_category WHERE language=?";
		return super.listBySql(sql, new Object[]{language}, GoodsCategory.class);
	}

}
