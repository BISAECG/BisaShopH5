package com.bisa.health.shop.entity;

import java.io.Serializable;
import java.util.List;

public class TreeData implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String title;
	private String id;
	private String field;
	private List<TreeData> children=null;
	private String href;
	private boolean spread=true;
	private boolean checked=false;
	private boolean disabled=false;
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getField() {
		return field;
	}
	public void setField(String field) {
		this.field = field;
	}
	public List<TreeData> getChildren() {
		return children;
	}
	public void setChildren(List<TreeData> children) {
		this.children = children;
	}
	public String getHref() {
		return href;
	}
	public void setHref(String href) {
		this.href = href;
	}
	public boolean isSpread() {
		return spread;
	}
	public void setSpread(boolean spread) {
		this.spread = spread;
	}
	public boolean isChecked() {
		return checked;
	}
	public void setChecked(boolean checked) {
		this.checked = checked;
	}
	public boolean isDisabled() {
		return disabled;
	}
	public void setDisabled(boolean disabled) {
		this.disabled = disabled;
	}
	
	public TreeData() {
		super();
	}
	public TreeData(String title, String id, String field, List<TreeData> children, String href, boolean spread,
			boolean checked, boolean disabled) {
		super();
		this.title = title;
		this.id = id;
		this.field = field;
		this.children = children;
		this.href = href;
		this.spread = spread;
		this.checked = checked;
		this.disabled = disabled;
	}
	@Override
	public String toString() {
		return "TreeData [title=" + title + ", id=" + id + ", field=" + field + ", children=" + children + ", href="
				+ href + ", spread=" + spread + ", checked=" + checked + ", disabled=" + disabled + "]";
	}
	
	
	
	
	
}
