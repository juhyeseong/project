package com.javabang.exception;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

@ControllerAdvice
public class JavabangException {
	@ExceptionHandler(Exception.class)
	public ModelAndView exception() {
		ModelAndView mav = new ModelAndView("alert");
	
		String msg = "서버에 일시적인 오류가 발생하였습니다 ~\\n오류가 계속 진행되면 관리자에게 문의주세요 ~ ";
		String url = "history.go";
		mav.addObject("msg", msg);
		mav.addObject("url", url);
		
		return mav;
	}
}