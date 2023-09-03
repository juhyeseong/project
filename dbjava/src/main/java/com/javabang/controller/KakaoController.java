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
public class KakaoController {
	
	@Autowired MemberService memberService;
	
	@PostMapping("/kakaosignup")   //카카오 회원가입 + 로그인
	public ModelAndView signup(MemberDTO dto, HttpSession session) {
		ModelAndView mav = new ModelAndView();
	   MemberDTO tmp = memberService.selectKakao(dto);      // 회원정보 조회

		if (tmp == null) {     // 조회된 회원정보가 없는 경우
			mav.addObject("dto", dto);    // dto 를 추가
			mav.setViewName("/member/socialJoin");       // 회원가입 페이지로 이동
			return mav;
		} 
	 else {
			session.setAttribute("login", tmp);        //세션에 로그인 정보를 설정함
			mav.setViewName("redirect:/");           // 이미 회원가입이 완료된 경우 로그인 하고 홈 화면으로 이동
			return mav;
		}
	}
}
