package com.bisa.health.shop.enumerate;


public enum CouponEnum {
	COUPON(1),NOT_COUPON(0);
	private int value;

	private CouponEnum(int value) {
		this.value = value;
	}

	public int getValue() {
		return value;
	}
	
	public static CouponEnum getByValue(int value){
	      for (CouponEnum auction : values()) {  
	            if (auction.getValue() == value) {  
	                return auction;  
	            }  
	        }  
	        return null;  
	}
}
