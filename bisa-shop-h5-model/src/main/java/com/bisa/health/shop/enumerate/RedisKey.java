package com.bisa.health.shop.enumerate;


public  enum RedisKey {

	COMMON_CODE("sms_"),BIND_EMAIL_CODE("email_bind_");

	private String value;

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	private RedisKey(String value) {
		this.value = value;
	}

	public static RedisKey getByValue(String value) {
		for (RedisKey status : values()) {
			if (status.getValue() == value) {
				return status;
			}
		}
		return null;
	}

}
