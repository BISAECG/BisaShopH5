package com.bisa.health.shop.pay.utils;

import org.hibernate.validator.constraints.NotEmpty;

import com.bisa.health.shop.entity.BaseRequest;
import com.bisa.health.shop.pay.annotation.Signature;

/**
 * 查询接口基础请求对象
 * @author Ben.
 *
 */
@SuppressWarnings("serial")
public class QueryRequest extends BaseRequest {
	/**
	 * 賬單編號
	 */
	@NotEmpty
	@Signature
	private String paymentId;

	public String getPaymentId() {
		return paymentId;
	}

	public void setPaymentId(String paymentId) {
		this.paymentId = paymentId;
	}

	@Override
	public String toString() {
		return "QueryRequest [paymentId=" + paymentId + "]";
	}

}
