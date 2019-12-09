package com.bisa.health.shop.model;

import javax.persistence.*;

import org.hibernate.validator.constraints.NotBlank;

import com.bisa.health.entity.bind.CustomDateSerializer;
import com.bisa.health.shop.entity.SysErrorCode;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;

import java.io.Serializable;
import java.util.Date;

@Entity
@Table(name="s_news_classify")
public class NewsClassify implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private int id;
	
	
	/**
	 * 新闻编号
	 */
	private String number;
	/**
	 * 新闻名字
	 */
	private String name;
	/**
	 * 新闻语言版本
	 */
	private String language;
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
		return "NewsClassify [id=" + id + ", number=" + number + ", name=" + name + ", language=" + language
				+ ", c_time=" + c_time + "]";
	}
	
	
}
