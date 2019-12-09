package com.bisa.health.shop.entity;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class AppException extends RuntimeException {
    private static final long serialVersionUID = 1L;

    private String code;
    public AppException(String messageCode) {
        super(getCodeMessage(messageCode));
        this.code = messageCode;
    }
    public AppException(String messageCode,Object... args) {
        super(getCodeMessage(messageCode));
        this.code = messageCode;
    }
    private static String getCodeMessage(String messageCode) {
        List<String> fieldName = new ArrayList<String>();
        ClassLoader classLoader = Thread.currentThread().getContextClassLoader();
        try {
            Class appErrorCode = classLoader.loadClass("com.bisa.health.shop.entity.AppErrorCode");
            Field[] fields = appErrorCode.getDeclaredFields();
            List<Field> fieldList = Arrays.asList(fields);
            
            for(Field field : fieldList){
           	 field.isAccessible();
           	 if (field.get(appErrorCode) == messageCode) {
                    fieldName.add(field.getName());
                }
            }
            return fieldName.get(0);
        } catch (Exception e) {
            e.printStackTrace();
            return "OptFail";
        }
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

}
