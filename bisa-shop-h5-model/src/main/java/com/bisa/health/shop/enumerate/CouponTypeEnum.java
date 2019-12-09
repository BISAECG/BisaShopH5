package com.bisa.health.shop.enumerate;

/**
 * 商品状态
 * @author Administrator
 */
public enum CouponTypeEnum {
	
	
	/**
	 * 折扣卷
	 */
	DISRATE(0),
	/**
	 * 满减卷
	 */
	TOTAL(1),
	/**
	 * 直减卷
	 */
	DISPRICE(2);
    private int value;

    public int getValue() {
        return value;
    }

    public void setValue(int value) {
        this.value = value;
    }

	private CouponTypeEnum(int value) {
		this.value = value;
	}


}
