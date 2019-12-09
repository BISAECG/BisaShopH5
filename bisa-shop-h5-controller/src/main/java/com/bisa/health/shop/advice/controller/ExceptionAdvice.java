package com.bisa.health.shop.advice.controller;


import org.apache.commons.lang3.StringUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bisa.health.common.entity.ResultData;
import com.bisa.health.shop.component.InternationalizationUtil;
import com.bisa.health.shop.entity.AppException;
import com.bisa.health.shop.entity.SysErrorCode;
import com.bisa.health.shop.entity.SysStatusCode;
import com.bisa.health.shop.entity.WebException;

@ControllerAdvice
public class ExceptionAdvice {


	private Logger logger = LogManager.getFormatterLogger(ExceptionAdvice.class);

    @Autowired
    private InternationalizationUtil i18nUtil;
    
	
	/**
     * 处理AppException异常返回信息
     *
     * @param AppException
     * @return
     */
    @ExceptionHandler(AppException.class)
    @ResponseBody
    public ResponseEntity<ResultData>  handleBusinessException(AppException appException) {
        String message = appException.getMessage();
        String errorCode = appException.getCode();
        if (StringUtils.isEmpty(errorCode)) {
            errorCode = SysErrorCode.SystemError;
        }
        String resultMessage = i18nUtil.i18n(errorCode);
        logger.info("业务异常:{}-{}-{}", errorCode, message, resultMessage);
        return new ResponseEntity<ResultData>(ResultData.success(SysStatusCode.FAIL, resultMessage), HttpStatus.OK);
    }
	/**
     * 处理WebException异常返回信息
     *
     * @param WebException
     * @return
     */
    @ExceptionHandler(WebException.class)
    @ResponseBody
    public ResponseEntity<ResultData>  handleBusinessException(WebException webException) {
        String message = webException.getMessage();
        String errorCode = webException.getCode();
        if (StringUtils.isEmpty(errorCode)) {
            errorCode = SysErrorCode.SystemError;
        }
        String resultMessage = i18nUtil.i18n(errorCode);
        logger.info("业务异常:{}-{}-{}", errorCode, message, resultMessage);
        return new ResponseEntity<ResultData>(ResultData.success(SysStatusCode.FAIL, resultMessage), HttpStatus.OK);
    }
	
    
    @ExceptionHandler(RuntimeException.class)
    @ResponseBody
    public ResponseEntity<ResultData>  handle(RuntimeException runtimeException) {
        logger.error("运行时异常:", runtimeException);
        return new ResponseEntity<ResultData>(ResultData.success(SysStatusCode.FAIL, i18nUtil.i18n(SysErrorCode.SystemError)), HttpStatus.NOT_FOUND);
    }

    @ExceptionHandler(Exception.class)
    @ResponseBody
    public ResponseEntity<ResultData>  handle(Exception exception) {
        logger.error("异常:", exception);
        return new ResponseEntity<ResultData>(ResultData.success(SysStatusCode.FAIL, i18nUtil.i18n(SysErrorCode.SystemError)), HttpStatus.INTERNAL_SERVER_ERROR);
    }
    
    
}
