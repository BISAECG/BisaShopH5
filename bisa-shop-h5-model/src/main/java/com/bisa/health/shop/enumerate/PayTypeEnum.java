package com.bisa.health.shop.enumerate;


public enum PayTypeEnum {
	WECHAT(0),//微信
	ALIPAY(1),//支付宝
	VISA(2),
	MASTER(3),
	EASY(4);//银联
	
	private int value;

	public int getValue() {
		return value;
	}

	public void setValue(int value) {
		this.value = value;
	}

	private PayTypeEnum(int value) {
		this.value = value;
	}
	
	public static PayTypeEnum getByValue(int value){
	      for (PayTypeEnum auction : values()) {  
	            if (auction.getValue() == value) {  
	                return auction;  
	            }  
	        }  
	        return null;  
	}
}
