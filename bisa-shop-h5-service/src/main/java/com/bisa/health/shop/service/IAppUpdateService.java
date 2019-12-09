package com.bisa.health.shop.service;

import java.util.List;

import com.bisa.health.basic.entity.Pager;
import com.bisa.health.shop.model.AppUpdate;

public interface IAppUpdateService {
	public AppUpdate saveAppUpdate(AppUpdate appUpdate);
	public AppUpdate updateAppUpdate(AppUpdate appUpdate);
	public void updateStatus(int id);
	public Pager<AppUpdate> page(Integer offset);
	public AppUpdate loadByVersion(String version);
	public AppUpdate loadByStatus(int status);
	public AppUpdate load(int id);
	public Pager<AppUpdate> pageLikeAll(String keyword,Integer offset);
}
