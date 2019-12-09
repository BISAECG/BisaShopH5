package com.bisa.health.shop.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Version;
import javax.validation.constraints.Digits;
import javax.validation.constraints.Max;

import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.Range;

import com.bisa.health.entity.bind.CustomDateSerializer;
import com.bisa.health.shop.entity.SysErrorCode;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;

/**
 * 商品优惠券
 * @author Administrator
 *
 */
@Entity
@Table(name = "s_coupon")
public class GoodsCoupon implements Serializable {
	

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private int id;
	
	/**
	 * 使用者ID一般就是用户ID
	 */
	@Max(value=Integer.MAX_VALUE,message=SysErrorCode.RequestFormat)
	private int useId;
	
	/**
	 * 优惠券编号
	 */
	@NotBlank(message=SysErrorCode.RequestFormat)
	private String coupon_num;
	/**
	 * 优惠券类型
	 */
	@Range(min = 0, max = 10,message=SysErrorCode.RequestFormat)
	private int coupon_type;
	/**
	 * 状态
	 */
	@Range(min = 0, max = 10,message=SysErrorCode.RequestFormat)
	private int coupon_status;
	/**
	 * 优惠券折扣率
	 */
	@Digits(integer = 13, fraction = 1,message=SysErrorCode.RequestFormat)
	private double coupon_disrate;
	/**
	 * 优惠券满XX减
	 */
	@Digits(integer = 13, fraction = 2,message=SysErrorCode.RequestFormat)
	private double coupon_total;
	/**
	 * 优惠券减XX价格
	 */
	@Digits(integer = 13, fraction = 2,message=SysErrorCode.RequestFormat)
	private int coupon_disprice;
	
	/**
	 * 创建者IDY一般就是用户ID
	 */
	private int creator;
	
	@Version
	private int version;
	
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
	@Column(length=32)
	public String getCoupon_num() {
		return coupon_num;
	}
	public void setCoupon_num(String coupon_num) {
		this.coupon_num = coupon_num;
	}
	public int getCoupon_type() {
		return coupon_type;
	}
	public void setCoupon_type(int coupon_type) {
		this.coupon_type = coupon_type;
	}
	public double getCoupon_disrate() {
		return coupon_disrate;
	}
	public void setCoupon_disrate(double coupon_disrate) {
		this.coupon_disrate = coupon_disrate;
	}
	public double getCoupon_total() {
		return coupon_total;
	}
	public void setCoupon_total(double coupon_total) {
		this.coupon_total = coupon_total;
	}
	public int getCoupon_disprice() {
		return coupon_disprice;
	}
	public void setCoupon_disprice(int coupon_disprice) {
		this.coupon_disprice = coupon_disprice;
	}
	
	public int getCreator() {
		return creator;
	}
	public void setCreator(int creator) {
		this.creator = creator;
	}
	public int getCoupon_status() {
		return coupon_status;
	}
	public void setCoupon_status(int coupon_status) {
		this.coupon_status = coupon_status;
	}
	@JsonSerialize(using = CustomDateSerializer.class)
	@Column(name="c_time",columnDefinition=" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP")
	public Date getC_time() {
		return c_time;
	}
	public void setC_time(Date c_time) {
		this.c_time = c_time;
	}
	public int getUseId() {
		return useId;
	}
	public void setUseId(int useId) {
		this.useId = useId;
	}
	public int getVersion() {
		return version;
	}
	public void setVersion(int version) {
		this.version = version;
	}
	@Override
	public String toString() {
		return "GoodsCoupon [id=" + id + ", useId=" + useId + ", coupon_num=" + coupon_num + ", coupon_type="
				+ coupon_type + ", coupon_status=" + coupon_status + ", coupon_disrate=" + coupon_disrate
				+ ", coupon_total=" + coupon_total + ", coupon_disprice=" + coupon_disprice + ", creator=" + creator
				+ ", version=" + version + ", c_time=" + c_time + "]";
	}
	
	
	
	
	
	
}
