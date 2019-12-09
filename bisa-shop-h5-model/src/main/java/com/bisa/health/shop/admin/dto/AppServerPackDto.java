package com.bisa.health.shop.admin.dto;

import java.io.Serializable;
import java.util.List;

public class AppServerPackDto implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String version;
	private List<AppServerDto> list;
	public String getVersion() {
		return version;
	}
	public void setVersion(String version) {
		this.version = version;
	}
	public List<AppServerDto> getList() {
		return list;
	}
	public void setList(List<AppServerDto> list) {
		this.list = list;
	}
	
	
}
