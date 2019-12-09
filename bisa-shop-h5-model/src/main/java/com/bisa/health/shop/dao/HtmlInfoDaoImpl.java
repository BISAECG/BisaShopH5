package com.bisa.health.shop.dao;

import com.bisa.health.basic.dao.BaseDao;
import com.bisa.health.basic.entity.Pager;
import com.bisa.health.shop.model.HtmlInfo;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public class HtmlInfoDaoImpl extends BaseDao<HtmlInfo> implements IHtmlInfoDao {
    @Override
    public HtmlInfo addHtmlInfo(HtmlInfo htmlInfo) {
    	return super.add(htmlInfo);
    }

    @Override
    public HtmlInfo updateHtmlInfo(HtmlInfo htmlInfo) {
    	super.update(htmlInfo);
    	return htmlInfo;
    }

    @Override
    public Pager<HtmlInfo> page() {
        String sql = "select * from s_html_info";
        return super.findBySql(sql, null,HtmlInfo.class,true);
    }

    @Override
    public HtmlInfo selectHtmlInfoById(Integer id) {
        String sql = "select * from s_html_info where id=?";
        return super.queryObjectBySql(sql, new Object[]{id}, HtmlInfo.class, true);
    }

    @Override
    public Boolean delectHtmlInfoById(Integer id) {
        String sql = "DELETE FROM s_html_info WHERE id=?";
        int result = super.deleteBySql(sql, new Object[]{id});
        return result >= 1 ? true : false;
    }

    @Override
    public List<HtmlInfo> selectHtmlInfo() {
        String sql = "select * from s_html_info order  by order_id";
        return super.listBySql(sql, null, HtmlInfo.class, true);
    }

	@Override
	public List<HtmlInfo> selectHtmlInfo(int type) {
		  String sql = "select * from s_html_info WHERE type=? order by order_id";
	        return super.listBySql(sql, new Object[]{type}, HtmlInfo.class, true);
	}
}
