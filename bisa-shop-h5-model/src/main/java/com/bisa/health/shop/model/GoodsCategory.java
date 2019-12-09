package com.bisa.health.shop.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.Range;

import com.bisa.health.common.utils.RegexConstants;
import com.bisa.health.entity.bind.CustomDateSerializer;
import com.bisa.health.shop.entity.SysErrorCode;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;

/**
 * 商品分类
 * @author Administrator
 *
 */
@Entity
@Table(name = "s_category")
public class GoodsCategory implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private int id;
	
	
	/**
	 * 分类编号
	 */
	private String number;
	/**
	 * 分类名字
	 */
	private String name;
	/**
	 * 语言版本
	 */
	private String language;
	/**
	 * 父类ID
	 */
	private int super_id;
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
	
	@NotBlank(message=SysErrorCode.RequestFormat)
	@Column(length=50)
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	@NotBlank(message=SysErrorCode.RequestFormat)
	@Column(length=16)
	public String getLanguage() {
		return language;
	}
	public void setLanguage(String language) {
		this.language = language;
	}
	
	@Range(min=0,max=10000,message=SysErrorCode.RequestFormat)
	public int getSuper_id() {
		return super_id;
	}
	public void setSuper_id(int super_id) {
		this.super_id = super_id;
	}

	@JsonSerialize(using = CustomDateSerializer.class)
	@Column(name="c_time",columnDefinition="timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP")
	public Date getC_time() {
		return c_time;
	}
	public void setC_time(Date c_time) {
		this.c_time = c_time;
	}
	
	@Column(length=32)
	public String getNumber() {
		return number;
	}
	public void setNumber(String number) {
		this.number = number;
	}
	@Override
	public String toString() {
		return "GoodsCategory [id=" + id + ", number=" + number + ", name=" + name + ", language=" + language
				+ ", super_id=" + super_id + ", c_time=" + c_time + "]";
	}
	
	
	
	
}
