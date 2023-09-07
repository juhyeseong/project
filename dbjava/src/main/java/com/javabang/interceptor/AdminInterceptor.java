package com.javabang.interceptor;

import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.javabang.model.MemberDTO;

public class AdminInterceptor extends HandlerInterceptorAdapter {

	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		
		HttpSession session = request.getSession();
		MemberDTO login = (MemberDTO) session.getAttribute("login");
		
		
		if(login != null && login.getUserId().equals("admin")) {
			
			return true;
		}
		String requestURI = request.getRequestURI().toString();
		String contextPath = request.getContextPath();
		
		requestURI = requestURI.substring(contextPath.length());
		requestURI = URLEncoder.encode(requestURI, "UTF-8");
		response.sendRedirect(contextPath + "/");
		
		return false;
	}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
	}
	
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
	}
}
