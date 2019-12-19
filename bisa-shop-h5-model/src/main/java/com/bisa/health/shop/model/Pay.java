package com.bisa.health.shop.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import com.bisa.health.entity.bind.CustomDateSerializer;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;

/**
 * 支付
 * @author Administrator
 *
 */

@Entity
@Table(name = "s_pay")
@org.hibernate.annotations.Proxy(lazy = false)
public class Pay implements Serializable {

	private static final long serialVersionUID = 1L;
	private int id;
	/**
	 * 用户ID
	 */
	private int user_id;
	/**
	 * 支付价格
	 */
	private double pay_price;
	/**
	 * 商品编号
	 */
	private String goods_num;
	
	/**
	 * 订单编号
	 */
	private String order_num;
	
	/**
	 * 支付类型
	 */
	private int pay_type;
	/**支付时间
	 * 
	 */
	private Date c_time;
	
	
	/**
	 * 第三方支付ID
	 */
	private String pay_id;
	
    @Id
    @GeneratedValue
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public double getPay_price() {
		return pay_price;
	}
	public void setPay_price(double pay_price) {
		this.pay_price = pay_price;
	}
	@Column(length=32)
	public String getGoods_num() {
		return goods_num;
	}
	public void setGoods_num(String goods_num) {
		this.goods_num = goods_num;
	}
	public int getPay_type() {
		return pay_type;
	}
	public void setPay_type(int pay_type) {
		this.pay_type = pay_type;
	}
	
	
	public String getOrder_num() {
		return order_num;
	}
	public void setOrder_num(String order_num) {
		this.order_num = order_num;
	}
	@JsonSerialize(using = CustomDateSerializer.class)
	@Column(name="c_time",columnDefinition="timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP")
	public Date getC_time() {
		return c_time;
	}
	public void setC_time(Date c_time) {
		this.c_time = c_time;
	}
	
	
	public String getPay_id() {
		return pay_id;
	}
	public void setPay_id(String pay_id) {
		this.pay_id = pay_id;
	}
	@Override
	public String toString() {
		return "Pay [id=" + id + ", user_id=" + user_id + ", pay_price=" + pay_price + ", goods_num=" + goods_num
				+ ", order_num=" + order_num + ", pay_type=" + pay_type + ", c_time=" + c_time + ", pay_id=" + pay_id
				+ "]";
	}


	
	
}
