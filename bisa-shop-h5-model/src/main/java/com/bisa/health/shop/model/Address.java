package com.bisa.health.shop.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.validator.constraints.NotBlank;

import com.bisa.health.shop.entity.SysErrorCode;

import java.io.Serializable;

/**
 * 用户地址次标暂时没有用
 * @author Administrator
 */

@Entity
@Table(name = "s_address")
@org.hibernate.annotations.Proxy(lazy = false)
public class Address implements Serializable {

	private static final long serialVersionUID = 1L;
	private Integer id;
    private Integer user_id;        // 用户id
	@NotBlank(message=SysErrorCode.RequestFormat)
    private String consignee;         // 收货人名字
	@NotBlank(message=SysErrorCode.RequestFormat)
	private String area;
	@NotBlank(message=SysErrorCode.RequestFormat)
    private String phone;            // 收货人手机号码
    private String country;        // 国家
    private String province;        // 省
	@NotBlank(message=SysErrorCode.RequestFormat)
    private String city;            // 城市
    private String county;            // 区，县
    private String town;            // 镇
	@NotBlank(message=SysErrorCode.RequestFormat)
    private String detail_address;   // 详细地址
	@NotBlank(message=SysErrorCode.RequestFormat)
    private String address_label;   // 标签(家，公司，其他)
	@NotBlank(message=SysErrorCode.RequestFormat)
    private String is_default;        // 是否是默认地址 on-不是默认； off-默认


    @Id
    @GeneratedValue
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUser_id() {
        return user_id;
    }

    public void setUser_id(Integer user_id) {
        this.user_id = user_id;
    }

    public String getConsignee() {
        return consignee;
    }

    public void setConsignee(String consignee) {
        this.consignee = consignee;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getCounty() {
        return county;
    }

    public void setCounty(String county) {
        this.county = county;
    }

    public String getTown() {
        return town;
    }

    public void setTown(String town) {
        this.town = town;
    }

    public String getDetail_address() {
        return detail_address;
    }

    public void setDetail_address(String detail_address) {
        this.detail_address = detail_address;
    }

    public String getAddress_label() {
        return address_label;
    }

    public void setAddress_label(String address_label) {
        this.address_label = address_label;
    }

    public String getIs_default() {
        return is_default;
    }

    public void setIs_default(String is_default) {
        this.is_default = is_default;
    }

	public String getArea() {
		return area;
	}

	public void setArea(String area) {
		this.area = area;
	}

	@Override
	public String toString() {
		return "Address [id=" + id + ", user_id=" + user_id + ", consignee=" + consignee + ", area=" + area + ", phone="
				+ phone + ", country=" + country + ", province=" + province + ", city=" + city + ", county=" + county
				+ ", town=" + town + ", detail_address=" + detail_address + ", address_label=" + address_label
				+ ", is_default=" + is_default + "]";
	}

	
    


}