package com.javabang.interceptor;

import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		
		if(session.getAttribute("login") != null) {	
			
			return true;							
		}
		String requestURI = request.getRequestURI().toString();
		String contextPath = request.getContextPath();
		
		requestURI = requestURI.substring(contextPath.length());
		requestURI = URLEncoder.encode(requestURI, "UTF-8");
		response.sendRedirect(contextPath + "/member/login?url=" + requestURI);
						
		return false;	
	}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {

	}
	
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
 
	}
}
