package com.marlonluan.mldemo.config;

import com.marlonluan.mlframework.config.RestExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;
import org.springframework.web.servlet.mvc.method.annotation.ResponseEntityExceptionHandler;

@RestControllerAdvice
public class GlobalExceptionHandler extends RestExceptionHandler {

}
