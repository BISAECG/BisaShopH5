package com.bisa.health.shop.enumerate;

/**
 * 是否需要邮递枚举
 * @author Administrator
 */

public enum NeedPostType {
    /**
     * 不需要邮递
     */
    no_post(0, "NO_POST"),
    /**
     * 需要邮递
     */
    need_post(1, "NEED_POST");

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

    private NeedPostType(int value, String name) {
        this.value = value;
        this.name = name;
    }

    public static NeedPostType getByValue(int value) {
        for (NeedPostType status : values()) {
            if (status.getValue() == value) {
                return status;
            }
        }
        return null;
    }
}
