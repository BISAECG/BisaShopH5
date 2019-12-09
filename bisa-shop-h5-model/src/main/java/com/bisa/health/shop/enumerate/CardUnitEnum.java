package com.bisa.health.shop.enumerate;


/**
 * 商品状态
 * @author Administrator
 */
public enum CardUnitEnum {
    /**
     * 次数
     */
    COUNT("COUNT"),
    /**
     * 时限
     */
    TIME("TIME");
	
    private String value;

    private CardUnitEnum(String value) {
        this.value = value;
    }

    public String getValue() {
        return value;
    }

    public static CardUnitEnum getByValue(String value) {
        for (CardUnitEnum roleType : values()) {
            if (roleType.getValue().equals(value.trim())) {
                return roleType;
            }
        }
        return null;
    }

}
