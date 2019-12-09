package com.bisa.health.shop.enumerate;

/**
 * 商品的类型(这里定义的是前台自定义的类型，主要用途是商品的详情页面下单 或者加入购物车的时候要用到)
 * @author Administrator
 */

public enum GoodsTypeEnum {

    /**
     * 实体
     */
	REAL(0),
    /**
     * 虚拟
     */
    VIRTUAL(1);


    private int value;

    public int getValue() {
        return value;
    }

    public void setValue(int value) {
        this.value = value;
    }

	private GoodsTypeEnum(int value) {
		this.value = value;
	}

}
