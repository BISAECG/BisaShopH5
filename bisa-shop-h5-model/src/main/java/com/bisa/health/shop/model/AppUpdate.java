package com.bisa.health.shop.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.Range;

import com.bisa.health.entity.bind.CustomDateSerializer;
import com.bisa.health.shop.entity.SysErrorCode;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;

@Entity
@Table(name = "s_app")
public class AppUpdate implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@NotBlank(message=SysErrorCode.RequestFormat)
	private String version;
	@NotBlank(message=SysErrorCode.RequestFormat)
	private String appUrl;
	
	private int id;
	@Range(min=0,max=1,message=SysErrorCode.RequestFormat)
	private int status;
	
	private String fileName;
	
	private Date createTime;
	
	public String getVersion() {
		return version;
	}
	public void setVersion(String version) {
		this.version = version;
	}
	
    @Column(name = "app_url")
	public String getAppUrl() {
		return appUrl;
	}
	public void setAppUrl(String appUrl) {
		this.appUrl = appUrl;
	}
	
    @Id
    @GeneratedValue
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getStatus() {
		return status;
	}
	
    @Column(name = "status")
	public void setStatus(int status) {
		this.status = status;
	}
	
	
    @Column(name = "file_name")
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	@JsonSerialize(using = CustomDateSerializer.class)
	@Column(name="create_time",columnDefinition="timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP")
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	
	public AppUpdate toAppUpdate(AppUpdate appUpdate){
		this.setAppUrl(appUpdate.getAppUrl());
		this.setFileName(appUpdate.getFileName());
		this.setStatus(appUpdate.getStatus());
		this.setVersion(appUpdate.getVersion());
		return this;
	}
	
}
