package com.javabang.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.javabang.model.MemberDTO;
import com.javabang.service.MemberService;

@Controller   
@RequestMapping("/api")
public class NaverController {
	@Autowired MemberService service;
	
	
	@PostMapping("/naversignup")   //네이버 회원가입 + 로그인
	public String signup(MemberDTO dto, HttpSession session) {
		
	MemberDTO tmp = service.selectKakao(dto);
	
	
		if (tmp == null) {
			int row = service.insertKakao(dto);
			
		} 
	 else {
			session.setAttribute("login", tmp);
		}
		return "redirect:/";
		



	}
}
