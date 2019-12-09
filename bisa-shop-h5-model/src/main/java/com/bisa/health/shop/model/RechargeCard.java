package com.bisa.health.shop.model;

import java.io.Serializable;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Version;
import javax.validation.constraints.Max;

import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.Range;

import com.bisa.health.entity.bind.CustomDateSerializer;
import com.bisa.health.shop.entity.SysErrorCode;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;


/**
 * 充值卡
 * @author Administrator
 *
 */

@Entity
@Table(name = "s_recharge_card")
@org.hibernate.annotations.Proxy(lazy = false)
public class RechargeCard implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private int id;
	
	/**
	 * 卡最终使用者ID
	 */
	private int user_id;
	
	/**
	 * 卡号
	 */
	private String card_num;
	/**
	 * 卡密
	 */
	private String card_pwd;
	@Version
	private int version;
	/**
	 * 订单编号.如果是0就是后台生成的
	 */
	private String order_num;
	/**
	 * 卡属于哪个用户的ID
	 */
	private int creator;
	/**
	 * 是否使用0未用1使用
	 */
	@Range(min=0,max=1,message=SysErrorCode.RequestFormat)
	private int status;
	/**
	 * 对应服务的TOKEN
	 */
	@NotBlank(message=SysErrorCode.RequestFormat)
	private String service_token;
	/**
	 * 卡描述
	 */
	private String card_desc;
	/**
	 * 创建时间
	 */
	private Date c_time;
	/**
	 * 卡次数
	 */
	@Max(value=Integer.MAX_VALUE,message=SysErrorCode.RequestFormat)
	private int card_count;
	/**
	 * 卡单位 TIME 对应天数 COUNT次数
	 */
	@NotBlank(message=SysErrorCode.RequestFormat)
	private String card_unit;
	
	
	@Id
	@GeneratedValue
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	@Column(length=32)
	public String getCard_num() {
		return card_num;
	}
	public void setCard_num(String card_num) {
		this.card_num = card_num;
	}
	
	@Column(length=32)
	public String getCard_pwd() {
		return card_pwd;
	}
	public void setCard_pwd(String card_pwd) {
		this.card_pwd = card_pwd;
	}
	public int getVersion() {
		return version;
	}
	public void setVersion(int version) {
		this.version = version;
	}
	
	@Column(length=32)
	public String getOrder_num() {
		return order_num;
	}
	public void setOrder_num(String order_num) {
		this.order_num = order_num;
	}
	public int getCreator() {
		return creator;
	}
	public void setCreator(int creator) {
		this.creator = creator;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getService_token() {
		return service_token;
	}
	public void setService_token(String service_token) {
		this.service_token = service_token;
	}
	public String getCard_desc() {
		return card_desc;
	}
	public void setCard_desc(String card_desc) {
		this.card_desc = card_desc;
	}
	
	@JsonSerialize(using = CustomDateSerializer.class)
	@Column(name="c_time",columnDefinition="timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP")
	public Date getC_time() {
		return c_time;
	}
	public void setC_time(Date c_time) {
		this.c_time = c_time;
	}
	
	public int getCard_count() {
		return card_count;
	}
	public void setCard_count(int card_count) {
		this.card_count = card_count;
	}
	public String getCard_unit() {
		return card_unit;
	}
	public void setCard_unit(String card_unit) {
		this.card_unit = card_unit;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	@Override
	public String toString() {
		return "RechargeCard [id=" + id + ", user_id=" + user_id + ", card_num=" + card_num + ", card_pwd=" + card_pwd
				+ ", version=" + version + ", order_num=" + order_num + ", creator=" + creator + ", status=" + status
				+ ", service_token=" + service_token + ", card_desc=" + card_desc + ", c_time=" + c_time
				+ ", card_count=" + card_count + ", card_unit=" + card_unit + "]";
	}
	

	
	
	
}
