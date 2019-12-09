package com.bisa.health.shop.enumerate;

/**
 * 商品类别
 * @author Administrator
 */
public enum GoodsClassify {

    /**
     * 心电仪
     */
    ECG(1, "ECG"),
    /**
     * 摄像头
     */
    CAMERA(2, "CAMERA"),
    /**
     * 血压计
     */
    BLOOD(3, "BLOOD"),

    /**
     * 配件
     */
    FITTING(4, "FITTING"),
    /**
     * 虚拟商品（服务）
     */
    VIRTUAL(5, "VIRTUAL"),
    /**
     * 虚拟商品-次数型
     */
    COUNT(10, "COUNT"),
    /**
     * 虚拟商品-时限型单位是天
     */
    TIME(11, "TIME");

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

    private GoodsClassify(int value, String name) {
        this.value = value;
        this.name = name;
    }

    public static GoodsClassify getByValue(int value) {
        for (GoodsClassify status : values()) {
            if (status.getValue() == value) {
                return status;
            }
        }
        return null;
    }

}
