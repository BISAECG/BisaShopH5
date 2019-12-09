package com.bisa.health.shop.pay.utils;

import com.bisa.health.shop.entity.BaseResponse;

/**
 * 查询响应对象
 * @author Ben.
 */

public class QueryResponse extends BaseResponse {

	/**
	 * 賬單編號
	 */
	private String paymentId;

	/**
	 * 賬單狀態
	 */
	private String status;

	/**
	 * 交易狀態
	 */
	private String lastStatus;

	/**
	 * 最後交易類型
	 */
	private String lastTransType;

	/**
	 * 第三方渠道狀態
	 */
	private String queryResult;

	/**
	 * 響應碼
	 */
	private String respCode;

	/**
	 * 響應碼描述
	 */
	private String respMsg;

	/**
	 * 清算匯率
	 */
	private String exchangeRate;
	/**
	 * 清算日期
	 */
	private String settleDate;

	/**
	 * 清算幣種
	 */
	private String settleCurrency;

	/**
	 * 清算金額
	 */
	private String settleAmount;

	/**
	 * 訂單幣種
	 */
	private String orderCurrency;

	/**
	 * 訂單金額
	 */
	private String orderAmount;

	/**
	 * 商戶保留域
	 */
	private String reserved;

	public String getPaymentId() {
		return paymentId;
	}

	public void setPaymentId(String paymentId) {
		this.paymentId = paymentId;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getLastStatus() {
		return lastStatus;
	}

	public void setLastStatus(String lastStatus) {
		this.lastStatus = lastStatus;
	}

	public String getLastTransType() {
		return lastTransType;
	}

	public void setLastTransType(String lastTransType) {
		this.lastTransType = lastTransType;
	}

	public String getQueryResult() {
		return queryResult;
	}

	public void setQueryResult(String queryResult) {
		this.queryResult = queryResult;
	}

	public String getRespCode() {
		return respCode;
	}

	public void setRespCode(String respCode) {
		this.respCode = respCode;
	}

	public String getRespMsg() {
		return respMsg;
	}

	public void setRespMsg(String respMsg) {
		this.respMsg = respMsg;
	}

	public String getExchangeRate() {
		return exchangeRate;
	}

	public void setExchangeRate(String exchangeRate) {
		this.exchangeRate = exchangeRate;
	}

	public String getSettleDate() {
		return settleDate;
	}

	public void setSettleDate(String settleDate) {
		this.settleDate = settleDate;
	}

	public String getSettleCurrency() {
		return settleCurrency;
	}

	public void setSettleCurrency(String settleCurrency) {
		this.settleCurrency = settleCurrency;
	}

	public String getSettleAmount() {
		return settleAmount;
	}

	public void setSettleAmount(String settleAmount) {
		this.settleAmount = settleAmount;
	}

	public String getOrderCurrency() {
		return orderCurrency;
	}

	public void setOrderCurrency(String orderCurrency) {
		this.orderCurrency = orderCurrency;
	}

	public String getOrderAmount() {
		return orderAmount;
	}

	public void setOrderAmount(String orderAmount) {
		this.orderAmount = orderAmount;
	}

	public String getReserved() {
		return reserved;
	}

	public void setReserved(String reserved) {
		this.reserved = reserved;
	}

}
