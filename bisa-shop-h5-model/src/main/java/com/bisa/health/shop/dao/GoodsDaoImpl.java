package com.bisa.health.shop.dao;

import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Repository;

import com.bisa.health.basic.dao.BaseDao;
import com.bisa.health.basic.entity.Pager;
import com.bisa.health.shop.model.Goods;
import com.bisa.health.shop.model.GoodsRecommend;

@Repository
public class GoodsDaoImpl extends BaseDao<Goods> implements IGoodsDao{

	@Override
	public Pager<Goods> listAllGroupNumber() {
		String sql="SELECT a.* FROM (SELECT * FROM s_goods GROUP BY number) AS a";
		return findBySql(sql,Goods.class,true);
	}

	@Override
	public Goods loadByNumAndlanguage(String num, String language) {
		String sql="SELECT * FROM s_goods WHERE number=? AND language=? ";
		return queryObjectBySql(sql, new Object[]{num,language}, Goods.class);
	}

	@Override
	public List<Goods> listByNum(String num) {
		String sql="SELECT * FROM s_goods WHERE number=?";
		return listBySql(sql,new Object[]{num}, Goods.class, true);
	}

	@Override
	public Goods loadById(int id) {
		String sql="SELECT * FROM s_goods WHERE id=?";
		return queryObjectBySql(sql, new Object[]{id}, Goods.class);
	}

	@Override
	public List<Goods> listByNum(Map<String, Object> alias) {
		String sql="SELECT * FROM s_goods where number in (:numList) GROUP BY number";
		return listByAliasSql(sql, alias, Goods.class, true);
	}

	@Override
	public List<Goods> listByCategoryNum(String categoryNum,String language) {
		String sql="SELECT * FROM  s_goods  where language=? AND category_num =?";
		return super.listBySql(sql,new Object[]{language,categoryNum},Goods.class, true);
	}

	@Override
	public Pager<Goods> pageAllByLanguage(String language,String vKey,String vVal) {
		String sql="SELECT * FROM s_goods WHERE language=?'";
		if(!StringUtils.isEmpty(vKey)){
			sql="SELECT * FROM s_goods WHERE language=? AND  " + vKey + " LIKE '%" + vVal + "%'";
		}
		
		return findBySql(sql,new Object[]{language},Goods.class,true);
	}

	@Override
	public List<Goods> listAllByLanguage(String language) {
		String sql="SELECT * FROM s_goods WHERE language=?";
		return listBySql(sql, new Object[]{language}, Goods.class);
	}

	@Override
	public List<Goods> listAllByLanguage(String language, Map<String, Object> alias) {
		String sql="SELECT * FROM s_goods where language=? AND number in (:numList) GROUP BY number";
		return listBySql(sql,new Object[]{language}, alias, Goods.class, true);
	}

	
	

}
