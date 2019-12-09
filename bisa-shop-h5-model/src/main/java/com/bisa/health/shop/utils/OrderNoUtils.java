package com.bisa.health.shop.utils;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

/**
 * 生成订单编号的工具类
 * @author Administrator
 */

public class OrderNoUtils {

    /**
     * 根据时间生成订单的编号
     * @return
     */
    public static String getOrderIdByTime() {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
        long date = new Date().getTime();
        //String date = sdf.format( new Date());
        String dateTime = String.valueOf(date).substring(0,10);
        String result = "";
        Random random = new Random();
        for (int i = 0; i < 5; i++) {
            result += random.nextInt(10);
        }
        return dateTime + result;
    }

    public static String getOrderRandom() {
        String result = "";
        Random random = new Random();
        for (int i = 0; i < 4; i++) {
            result += random.nextInt(10);
        }
        return result;
    }

}
