package com.bisa.health.shop.enumerate;

/**
 * 售后处理状态
 * @author Administrator
 */
public enum AfterSalesStatus {
    /**
     * 已付款(收货前的状态)
     */
    paid(0, "paid"),
    /**
     * 待申请
     */
    apply_for(1, "APPLY_FOR"),
    /**
     * 申请中
     */
    apply_for_ing(2, "APPLY_FOR_ING"),
    /**
     * 客服审核  成功
     */
    service_success(3, "SERVICE_SUCCESS"),
    /**
     * 客服审核  失败
     */
    service_fail(4, "SERVICE_FAIL"),
    /**
     * 物流 审核——>成功
     */
    logistics_success(5, "LOGISTICS_SUCCESS"),
    /**
     * 物流 审核失败
     */
    logistics_fail(6, "LOGISTICS_FAIL"),
    /**
     * 财务 审核-->成功
     */
    finance_success(7, "FINANCE_SUCCESS"),
    /**
     * 财务 审核失败
     */
    finance_fail(8, "FINANCE_FAIL"),
    /**
     * 退款  中(用不上)
     */
    refund_ing(9, "REFUND_ING"),
    /**
     * 退款成功--->(交易流水表的最后状态)
     */
    refund_success(10, "REFUND_SUCCESS"),
    /**
     * 退款失败
     */
    refund_failure(11, "REFUND_FAILURE"),
    /**
     * 已完成(流程结束了)(用户的最后状态)
     */
    complete(12, "COMPLETE"),
    /**
     * 已取消(用户发起的  取消)(用户的最后状态)
     */
    cancel(13, "CANCEL");

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

    private AfterSalesStatus(int value, String name) {
        this.value = value;
        this.name = name;
    }

    public static AfterSalesStatus getByValue(int value) {
        for (AfterSalesStatus status : values()) {
            if (status.getValue() == value) {
                return status;
            }
        }
        return null;
    }
}
