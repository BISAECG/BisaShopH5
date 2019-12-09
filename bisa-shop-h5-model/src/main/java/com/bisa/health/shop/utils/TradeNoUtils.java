package com.bisa.health.shop.utils;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

/**
 * 生成订单编号的工具类
 * 
 * @author Administrator
 *
 */
public class TradeNoUtils {

	/**
	 * 根据时间生成订单的编号
	 * @return
	 */
	public static String getTradeNoByTime() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyMMddHHmmss");
		String newDate = sdf.format(new Date());
		String result = "";
		Random random = new Random();
		for (int i = 0; i < 3; i++) {
			result += random.nextInt(10);
		}
		return newDate + result;
	}

	/**
	 * 根据时间生成订单的编号
	 * @return
	 */
	public static String getGoodsNoByTime() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String newDate = sdf.format(new Date());
		String result = "";
		Random random = new Random();
		for (int i = 0; i < 4; i++) {
			result += random.nextInt(10);
		}
		return newDate + result;
	}
}
