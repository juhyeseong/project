package com.javabang.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.javabang.model.MemberDTO;
import com.javabang.service.MemberService;

@Controller   
@RequestMapping("/api")
public class NaverController {
	@Autowired MemberService memberService;
	
	@PostMapping("/naversignup")   //네이버 회원가입 + 로그인
	public ModelAndView signup(String url, MemberDTO dto, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		MemberDTO tmp = memberService.selectNaver(dto);

		if (tmp == null) { 
			mav.addObject("dto", dto);
			mav.setViewName("/member/socialJoin");
		} 
		else {
			String msg = tmp.getUserNick() + "님 환영합니다 ~~ ";
			String goUrl = url != null ? url : "/";
			session.setAttribute("login", tmp);
			mav.setViewName("alert");
			mav.addObject("msg", msg);
			mav.addObject("url", goUrl);
		}
		
		return mav;
	}
}
