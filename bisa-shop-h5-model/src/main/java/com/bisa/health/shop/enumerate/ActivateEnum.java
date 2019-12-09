package com.bisa.health.shop.enumerate;


public enum ActivateEnum {
	/**
	 * 禁用
	 */
	INACTIVATED(0),
	/**
	 * 激活
	 */
	ACTIVATE(1);
	
	private int value;

	private ActivateEnum(int value) {
		this.value = value;
	}

	public int getValue() {
		return value;
	}
	
	public static ActivateEnum getByValue(int value){
	      for (ActivateEnum auction : values()) {  
	            if (auction.getValue() == value) {  
	                return auction;  
	            }  
	        }  
	        return null;  
	}
}
