package com.bisa.health.shop.enumerate;


public enum PayEnum {
	PAY(1),NOT_PAY(0),CURR_PAY(2);
	private int value;

	private PayEnum(int value) {
		this.value = value;
	}

	public int getValue() {
		return value;
	}
	
	public static PayEnum getByValue(int value){
	      for (PayEnum auction : values()) {  
	            if (auction.getValue() == value) {  
	                return auction;  
	            }  
	        }  
	        return null;  
	}
}
