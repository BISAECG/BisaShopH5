package com.bisa.health.shop.enumerate;


/**
 * 设备类型
 * @author Administrator
 */
public enum DeviceType {

    ECG(1001, "ECG"),  //心电仪
    BLOOD(1002, "BLOOD"),  //血压计
    CAMERA(1003, "CAMERA");   //摄像头


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

    private DeviceType(int value, String name) {
        this.value = value;
        this.name = name;
    }

    public static DeviceType getByValue(int value) {
        for (DeviceType status : values()) {
            if (status.getValue() == value) {
                return status;
            }
        }
        return null;
    }

}
