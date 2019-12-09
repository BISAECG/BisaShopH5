package com.bisa.health.shop.enumerate;


public enum ONOFFEnum {
	/**
	 * 禁用
	 */
	ON("on"),
	/**
	 * 激活
	 */
	OFF("off");
	
	private String value;
	
	private ONOFFEnum(String value) {
		this.value = value;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}




	public static ONOFFEnum getByValue(String value){
	      for (ONOFFEnum auction : values()) {  
	            if (auction.getValue().equals(value)) {  
	                return auction;  
	            }  
	        }  
	        return null;  
	}
}
