package com.bisa.health.shop.entity;

public class SysErrorCode {
	
	
	
	/**
	 * 请求异常
	 */
	public final static String RequestBad="10000";
	/**
	 * 请求参数错误
	 */
	public final static String RequestFormat="10001";
	/**
	 * 系统异常
	 */
	public final static String SystemError="10002";

	/**
	 * 请求成功.
	 */
	public final static String OptSuccess="12021";
	/**
	 * 请求超时!
	 */
	public final static String OptTimeOut="12022";
	/**
	 * 操作失败,请重新尝试!
	 */
	public final static String OptFailTry="12023";
	
	/**
	 * 操作失败！
	 */
	public final static String OptFail="670";
	//##########################PAY################################
	public final static String PayError="9002";
	
	//##########################特殊编码################################
	/**
	 * 实体商品不能含有虚拟服务
	 */
	public final static String REAL_NOT_SERVICE="2011";
	/**
	 * 虚拟商品需要包含虚拟服务
	 */
	public final static String VIRTUAL_SERVICE="2012";
	/**
	 * 发货商品不允许更改地址
	 */
	public final static String MODIFY_ADDRESS_UNSHIPPED="3004";
	
	/**
	 * 优惠券不可用
	 */
	public final static String NOT_COUPON="4003";
	
	
	
	
	
	
	
}
