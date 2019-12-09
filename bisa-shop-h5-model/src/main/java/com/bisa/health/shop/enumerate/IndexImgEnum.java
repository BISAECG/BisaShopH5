package com.bisa.health.shop.enumerate;

/**
 * 商城其他非商品的图片 枚举
 * @author Administrator
 */
public enum IndexImgEnum {

    /**
     * 商城首页轮播图 图片
     */
    index_img(1, "index_img");

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

    private IndexImgEnum(int value, String name) {
        this.value = value;
        this.name = name;
    }

    public static IndexImgEnum getByValue(int value) {
        for (IndexImgEnum status : values()) {
            if (status.getValue() == value) {
                return status;
            }
        }
        return null;
    }

}
