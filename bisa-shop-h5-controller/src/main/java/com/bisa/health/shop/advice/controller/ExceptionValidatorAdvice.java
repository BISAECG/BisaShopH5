package com.bisa.health.shop.advice.controller;

import javax.servlet.http.HttpServletRequest;
import javax.validation.ValidationException;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.beanvalidation.MethodValidationPostProcessor;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import com.bisa.health.common.entity.ResultData;
import com.bisa.health.shop.component.InternationalizationUtil;
import com.bisa.health.shop.entity.SysStatusCode;

@ControllerAdvice
public class ExceptionValidatorAdvice {


	private Logger logger = LogManager.getFormatterLogger(ExceptionValidatorAdvice.class);

    @Autowired
    private InternationalizationUtil i18nUtil;
    

	
	@ExceptionHandler(value={ValidationException.class})
	@ResponseBody
	public ResponseEntity<ResultData> ConstraintViolationExceptionHandler(ValidationException ex,HttpServletRequest req) {
		String code =ex.getMessage();
		String resultMessage = i18nUtil.i18n(code);
		return new ResponseEntity<ResultData>(ResultData.success(SysStatusCode.FAIL,resultMessage), HttpStatus.OK);
	}
	@Bean
    public MethodValidationPostProcessor methodValidationPostProcessor() {
        return new MethodValidationPostProcessor();
    }
	
}
