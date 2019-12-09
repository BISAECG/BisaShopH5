package com.bisa.health.shop.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 商品推荐
 * @author Administrator
 *
 */

@Entity
@Table(name = "s_recommend")
public class GoodsRecommend implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int id;
	/**
	 * 商品编号
	 */
	private String goods_number;
	/**
	 * 推荐编号
	 */
	private String recommend_num;
	
	
    @Id
    @GeneratedValue
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	@Column(length=32)
	public String getGoods_number() {
		return goods_number;
	}
	public void setGoods_number(String goods_number) {
		this.goods_number = goods_number;
	}
	
	@Column(length=32)
	public String getRecommend_num() {
		return recommend_num;
	}
	public void setRecommend_num(String recommend_num) {
		this.recommend_num = recommend_num;
	}
	

	@Override
	public String toString() {
		return "GoodsRecommend [id=" + id + ", goods_number=" + goods_number + ", recommend_num=" + recommend_num + "]";
	}
	
	
}
