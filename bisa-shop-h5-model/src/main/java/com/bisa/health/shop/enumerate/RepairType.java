package com.bisa.health.shop.enumerate;


/**
 * 维修类型
 * @author Administrator
 */

public enum RepairType {

    /**
     * 无法连接手机
     */
    unconnected(1, "UNCONNECTED"),
    /**
     * 不通电
     */
    nopower(2, "NOPOWER"),
    /**
     * 破损
     */
    damaged(3, "DAMAGED"),
    /**
     * 其他
     */
    other(4, "OTHER");

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

    private RepairType(int value, String name) {
        this.value = value;
        this.name = name;
    }

    public static RepairType getByValue(int value) {
        for (RepairType status : values()) {
            if (status.getValue() == value) {
                return status;
            }
        }
        return null;
    }

}
