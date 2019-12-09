package com.bisa.health.shop.enumerate;


/**
 * 保修状态
 * @author Administrator
 */

public enum WarrantyStatus {

    /**
     * 无保修
     */
    no_guarantee(10, "NO_GUARANTEE"),
    /**
     * 未激活
     */
    not_activate(20, "NOT_ACTIVATE"),
    /**
     * 保修中
     */
    in_guarantee(30, "IN_GUARANTEE"),
    /**
     * 已过期
     */
    expire(40, "EXPIRE");

    private int value;
    private String name;

    public int getValue() {
        return value;
    }

    public void setValue(int value) {
        this.value = value;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    private WarrantyStatus(int value, String name) {
        this.value = value;
        this.name = name;
    }

    public static WarrantyStatus getByValue(int value) {
        for (WarrantyStatus status : values()) {
            if (status.getValue() == value) {
                return status;
            }
        }
        return null;
    }


}
