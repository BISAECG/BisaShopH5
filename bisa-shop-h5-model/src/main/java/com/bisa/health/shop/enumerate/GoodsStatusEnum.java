package com.bisa.health.shop.enumerate;

/**
 * 商品状态
 * @author Administrator
 */
public enum GoodsStatusEnum {

    /**
     * 售罄0
     */
	SALE_OUT(0),
    /**
     * 上架
     */
    IN_SALE(1),
    /**
     * 下架
     */
    INVALID(2);

    private int value;

    public int getValue() {
        return value;
    }

    public void setValue(int value) {
        this.value = value;
    }

	private GoodsStatusEnum(int value) {
		this.value = value;
	}


}
