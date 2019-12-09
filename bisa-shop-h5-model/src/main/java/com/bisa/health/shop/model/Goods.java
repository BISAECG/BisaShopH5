package com.bisa.health.shop.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.Digits;

import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.Range;
import org.springframework.format.annotation.DateTimeFormat;

import com.bisa.health.entity.bind.CustomDateSerializer;
import com.bisa.health.shop.entity.SysErrorCode;
import com.bisa.health.shop.enumerate.GoodsTypeEnum;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;

/**
 * 商品表
 * @author Administrator
 *
 */
@Entity
@Table(name = "s_goods")
@org.hibernate.annotations.Proxy(lazy = false)
public class Goods implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	/**
	 * 自增ID
	 */
	private int id;
	/**
	 * 商品ID
	 */
	private String number;
	
	/**
	 * 商品状态
	 */
	private int status;
	
	/**
	 * 商品名字
	 */
	private String name;
	/**
	 * 商品描述
	 */
	private String description;
	/**
	 * 商品类型
	 */
	private int type;
	/**
	 * 商品价格
	 */
	private double price;
	/**
	 * 语言版本
	 */
	private String language;
	/**
	 * 商品详情ID
	 */
	private String detail_body;
	/**
	 * 商品分类名字
	 */
	private String category_num;
	
	/**
	 * 商品主图
	 */
	private String img_url;
	
	/**
	 * 虚拟服务的TOKEN
	 */
	private String service_token;
	/**
	 * 创建时间
	 */

	
	private Date c_time;
	
    @Id
    @GeneratedValue
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	
	@Column(length=32)
	public String getNumber() {
		return number;
	}
	public void setNumber(String number) {
		this.number = number;
	}
	@NotBlank(message=SysErrorCode.RequestFormat)
	@Column(length=50)
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@NotBlank(message=SysErrorCode.RequestFormat)
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	@Range(min=0,max=1000,message=SysErrorCode.RequestFormat)
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	
	@Digits(integer = 13, fraction = 2,message=SysErrorCode.RequestFormat)
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	@NotBlank(message=SysErrorCode.RequestFormat)
	@Column(length=16)
	public String getLanguage() {
		return language;
	}
	public void setLanguage(String language) {
		this.language = language;
	}
	@NotBlank(message=SysErrorCode.RequestFormat)
	@Column(columnDefinition="text")
	public String getDetail_body() {
		return detail_body;
	}
	public void setDetail_body(String detail_body) {
		this.detail_body = detail_body;
	}
	
	
	@Column(length=32)
	@NotBlank(message=SysErrorCode.RequestFormat)
	public String getCategory_num() {
		return category_num;
	}
	public void setCategory_num(String category_num) {
		this.category_num = category_num;
	}
	
	@DateTimeFormat(pattern = "yyyy-MM-dd hh:MM:ss")
	@JsonSerialize(using = CustomDateSerializer.class)
	@Column(name="c_time",columnDefinition="timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP")
	public Date getC_time() {
		return c_time;
	}
	public void setC_time(Date c_time) {
		this.c_time = c_time;
	}
	
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	
	@Column(length=32)
	public String getService_token() {
		return service_token;
	}
	public void setService_token(String service_token) {
		this.service_token = service_token;
	}
	
	public String getImg_url() {
		return img_url;
	}
	public void setImg_url(String img_url) {
		this.img_url = img_url;
	}
	@Override
	public String toString() {
		
		return "Goods [id=" + id + ", number=" + number + ", name=" + name + ", description=" + description + ", type="
				+ type + ", price=" + price + ", language=" + language + ", detail_body=" + detail_body
				+ ", category_num=" + category_num + ", c_time=" + c_time + "]";
	}

	
	

	
	
}
