package com.bisa.health.shop.utils;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;

import com.bisa.health.shop.pay.annotation.Signature;

/**
 * 签名工具类
 * @author
 *
 */
public class SignatureUtil {

	private final static Logger logger = Logger.getLogger(SignatureUtil.class);

	public static String joinString(String name, String value, String symbol) {
		StringBuffer sf = new StringBuffer();
		sf.append(name).append(symbol);
		if (StringUtils.isNotEmpty(value)) {
			sf.append(value);
		}
		return sf.toString();
	}

	/**
	 * 将map转换为有序List
	 * 
	 * @param map
	 * @return
	 */
	public static List<String> mapToListBySort(Map<String, String> map) {
		Iterator<Entry<String, String>> it = map.entrySet().iterator();
		String[] tmpReqVo = new String[map.size()];
		int index = 0;
		while (it.hasNext()) {
			Entry<?, ?> entry = (Entry<?, ?>) it.next();
			tmpReqVo[index] = joinString((String) entry.getKey(), (String) entry.getValue(), "=");
			index++;
		}

		List<String> list = Arrays.asList(tmpReqVo);
		Collections.sort(list);

		return list;
	}

	/**
	 * Bean转Map
	 * 
	 * @param obj
	 * @return
	 */
	public static Map<String, String> beanToMap(Object obj) {
		Map<String, String> map = new HashMap<String, String>();
		Class<?> clazz = obj.getClass();
		while (clazz != Object.class) {
			Field[] files = clazz.getDeclaredFields();
			for (Field field : files) {
				field.setAccessible(true);
				try {
					if (field.get(obj) == null) {
						map.put(field.getName(), "");
					} else {
						map.put(field.getName(), (String) field.get(obj));
					}
				} catch (IllegalArgumentException e) {
					logger.error(e.getMessage(), e);
				} catch (IllegalAccessException e) {
					logger.error(e.getMessage(), e);
				}
			}
			clazz = clazz.getSuperclass();
		}
		return map;
	}

	/**
	 * 签名信息名称集合
	 * 
	 * @param obj
	 * @return
	 */
	public static String[] getSignatureKeyNames(Class<?> clazz) {
		List<String> names = new ArrayList<String>();
		while (clazz != Object.class) {
			Field[] files = clazz.getDeclaredFields();
			for (Field field : files) {
				field.setAccessible(true);
				if (field.getAnnotation(Signature.class) != null) {
					names.add(field.getName());
				}
			}
			clazz = clazz.getSuperclass();
		}
		String[] namesArray = new String[names.size()];
		for (int i = 0; i < names.size(); i++) {
			namesArray[i] = names.get(i);
		}
		return namesArray;
	}

	/**
	 * 获取签名信息映射集
	 * 
	 * @param object
	 * @return
	 */
	public static Map<String, String> getSignatureMap(Object object) {
		Map<String, String> map = new HashMap<String, String>();
		Class<?> clazz = object.getClass();
		while (clazz != Object.class) {
			Field[] files = clazz.getDeclaredFields();
			try {
				for (Field field : files) {
					field.setAccessible(true);
					if (field.getAnnotation(Signature.class) != null) {
						//						String value = (String) field.get(object);
						//						if (StringUtils.isEmpty(value)) {
						//							continue;
						//						}
						map.put(field.getName(), (String) field.get(object));
					}
				}
			} catch (IllegalArgumentException e) {
				logger.error(e.getMessage(), e);
			} catch (IllegalAccessException e) {
				logger.error(e.getMessage(), e);
			}
			clazz = clazz.getSuperclass();
		}
		return map;
	}
}
