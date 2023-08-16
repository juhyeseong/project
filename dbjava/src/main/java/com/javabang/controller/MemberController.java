package com.javabang.controller;



import java.security.NoSuchAlgorithmException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.javabang.model.MemberDTO;
import com.javabang.service.MemberService;
     
@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired private MemberService  mservice;
	
	//회원가입
	@GetMapping("/join")
	public void join() {}
	
	@PostMapping("/join")
	public String join(MemberDTO dto) throws NoSuchAlgorithmException  {
		int row = mservice.add(dto);
		System.out.println(row + "행이 추가 되었습니다");
		return "redirect:/member/login";
	}
	
	//로그인
	@GetMapping("/login")
	public void login() {}
	@PostMapping("/login")
	public String login(MemberDTO dto, HttpSession session) throws NoSuchAlgorithmException  {
		MemberDTO login = mservice.login(dto); 
		session.setAttribute("login", login);
		return "redirect:/";
	}
	
	//로그아웃
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
}
