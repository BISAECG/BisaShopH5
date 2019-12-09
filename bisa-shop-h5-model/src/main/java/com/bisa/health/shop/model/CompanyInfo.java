package com.bisa.health.shop.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;
import java.util.Date;

@Entity
@Table(name = "s_company_info")
public class CompanyInfo implements Serializable {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;
	private int uniqueid;
    private String company_address_CN; //公司中文地址
    private String company_address_HK;//公司繁体地址
    private String company_address_US;//公司英文地址
    private String company_domain;//公司域名
    private String company_logo_url;//公司logo路径
    private String company_phone;//公司电话
    private String company_name_CN;//公司中文名字
    private String company_name_HK;//公司 繁体名字
    private String company_name_US;//公司英文名字
    private Date update_time;//修改时间

    @Id
    @GeneratedValue
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCompany_address_CN() {
        return company_address_CN;
    }

    public void setCompany_address_CN(String company_address_CN) {
        this.company_address_CN = company_address_CN;
    }

    public String getCompany_address_HK() {
        return company_address_HK;
    }

    public void setCompany_address_HK(String company_address_HK) {
        this.company_address_HK = company_address_HK;
    }

    public String getCompany_address_US() {
        return company_address_US;
    }

    public void setCompany_address_US(String company_address_US) {
        this.company_address_US = company_address_US;
    }

    public String getCompany_domain() {
        return company_domain;
    }

    public void setCompany_domain(String company_domain) {
        this.company_domain = company_domain;
    }

    public String getCompany_logo_url() {
        return company_logo_url;
    }

    public void setCompany_logo_url(String company_logo_url) {
        this.company_logo_url = company_logo_url;
    }

    public String getCompany_phone() {
        return company_phone;
    }

    public void setCompany_phone(String company_phone) {
        this.company_phone = company_phone;
    }

    public String getCompany_name_CN() {
        return company_name_CN;
    }

    public void setCompany_name_CN(String company_name_CN) {
        this.company_name_CN = company_name_CN;
    }

    public String getCompany_name_HK() {
        return company_name_HK;
    }

    public void setCompany_name_HK(String company_name_HK) {
        this.company_name_HK = company_name_HK;
    }

    public String getCompany_name_US() {
        return company_name_US;
    }

    public void setCompany_name_US(String company_name_US) {
        this.company_name_US = company_name_US;
    }

    public Date getUpdate_time() {
        return update_time;
    }

    public void setUpdate_time(Date update_time) {
        this.update_time = update_time;
    }
    public int getUniqueid() {
		return uniqueid;
	}

	public void setUniqueid(int uniqueid) {
		this.uniqueid = uniqueid;
	}

	public CompanyInfo() {
    }

    public void toThis(CompanyInfo info){
    	this.setCompany_address_CN(info.getCompany_address_CN());
    	this.setCompany_address_HK(info.getCompany_address_HK());
    	this.setCompany_address_US(info.getCompany_address_US());
    	this.setCompany_domain(info.getCompany_domain());
    	this.setCompany_logo_url(info.getCompany_logo_url());
    	this.setCompany_name_CN(info.getCompany_name_CN());
    	this.setCompany_name_HK(info.getCompany_name_HK());
    	this.setCompany_name_US(info.getCompany_name_US());
    	this.setCompany_phone(info.getCompany_phone());
    	this.setUpdate_time(info.getUpdate_time());
    	this.setUniqueid(info.getUniqueid());
    }

	@Override
	public String toString() {
		return "CompanyInfo [id=" + id + ", uniqueid=" + uniqueid + ", company_address_CN=" + company_address_CN
				+ ", company_address_HK=" + company_address_HK + ", company_address_US=" + company_address_US
				+ ", company_domain=" + company_domain + ", company_logo_url=" + company_logo_url + ", company_phone="
				+ company_phone + ", company_name_CN=" + company_name_CN + ", company_name_HK=" + company_name_HK
				+ ", company_name_US=" + company_name_US + ", update_time=" + update_time + "]";
	}


}
