package com.bisa.health.shop.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.validator.constraints.NotBlank;

import com.bisa.health.entity.bind.CustomDateSerializer;
import com.bisa.health.shop.entity.SysErrorCode;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;

@Entity
@org.hibernate.annotations.Proxy(lazy = false)
@Table(name = "s_server")
public class AppServer implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int id;
	@NotBlank(message=SysErrorCode.RequestFormat)
	private String phoneCode;
	@NotBlank(message=SysErrorCode.RequestFormat)
	private String countryCode;
	@NotBlank(message=SysErrorCode.RequestFormat)
	private String domain;
	private int status=0;
	@NotBlank(message=SysErrorCode.RequestFormat)
	private String time_zone;
	@NotBlank(message=SysErrorCode.RequestFormat)
	private String en_country;
	@NotBlank(message=SysErrorCode.RequestFormat)
	private String hk_country;
	@NotBlank(message=SysErrorCode.RequestFormat)
	private String cn_country;
	@NotBlank(message=SysErrorCode.RequestFormat)
	private String datserver;
	@NotBlank(message=SysErrorCode.RequestFormat)
	private String shopserver;
	@NotBlank(message=SysErrorCode.RequestFormat)
	private String version;
	private Date createTime;
	
	
    @Id
    @GeneratedValue
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	@Column(name = "phone_code")
	public String getPhoneCode() {
		return phoneCode;
	}
	public void setPhoneCode(String phoneCode) {
		this.phoneCode = phoneCode;
	}
	@Column(name = "country_code")
	public String getCountryCode() {
		return countryCode;
	}
	public void setCountryCode(String countryCode) {
		this.countryCode = countryCode;
	}
	
	public String getDomain() {
		return domain;
	}
	public void setDomain(String domain) {
		this.domain = domain;
	}
	
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getTime_zone() {
		return time_zone;
	}
	public void setTime_zone(String time_zone) {
		this.time_zone = time_zone;
	}
	public String getEn_country() {
		return en_country;
	}
	public void setEn_country(String en_country) {
		this.en_country = en_country;
	}
	
	public String getHk_country() {
		return hk_country;
	}
	public void setHk_country(String hk_country) {
		this.hk_country = hk_country;
	}
	public String getCn_country() {
		return cn_country;
	}
	public void setCn_country(String cn_country) {
		this.cn_country = cn_country;
	}
	public String getDatserver() {
		return datserver;
	}
	public void setDatserver(String datserver) {
		this.datserver = datserver;
	}
	public String getShopserver() {
		return shopserver;
	}
	public void setShopserver(String shopserver) {
		this.shopserver = shopserver;
	}
	
	public String getVersion() {
		return version;
	}
	public void setVersion(String version) {
		this.version = version;
	}
	@JsonSerialize(using = CustomDateSerializer.class)
	@Column(name="create_time",columnDefinition="timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP")
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	
	public AppServer toAppServer(AppServer appServer){
		this.setCn_country(appServer.getCn_country());
		this.setCountryCode(appServer.getCountryCode());
		this.setDatserver(appServer.getDatserver());
		this.setDomain(appServer.getDomain());
		this.setEn_country(appServer.getEn_country());
		this.setHk_country(appServer.getHk_country());
		this.setPhoneCode(appServer.getPhoneCode());
		this.setShopserver(appServer.getShopserver());
		this.setTime_zone(appServer.getTime_zone());
		this.setVersion(appServer.getVersion());
		return this;
	}
	
	
	
}
