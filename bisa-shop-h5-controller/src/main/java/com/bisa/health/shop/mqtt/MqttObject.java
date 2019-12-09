package com.bisa.health.shop.mqtt;

import java.io.Serializable;

import com.bisa.health.client.entity.User;

public class MqttObject<T> implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private User user;
	private T data;
	private int status;
	
	
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public T getData() {
		return data;
	}
	public void setData(T data) {
		this.data = data;
	}
	
	
	public MqttObject(User user, T data) {
		super();
		this.user = user;
		this.data = data;
	}
	public MqttObject() {
		super();
	}

}
