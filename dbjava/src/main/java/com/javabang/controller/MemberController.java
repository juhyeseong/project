package com.javabang.controller;



import java.security.NoSuchAlgorithmException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.javabang.model.MemberDTO;
import com.javabang.service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired private MemberService mservice;
	
	//회원가입
	@GetMapping("/join")
	public void join() {}
	
	@PostMapping("/join")
	public String join(MemberDTO dto) throws NoSuchAlgorithmException  {
		int row = mservice.add(dto);
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
	
	// 회원정보 수정 
	@GetMapping("/update/{idx}")
	public ModelAndView update(@PathVariable("idx") int idx) {
		ModelAndView mav = new ModelAndView("/member/update");
		MemberDTO dto = mservice.selectOne(idx);
		mav.addObject("dto", dto);
		return mav;
	}
	@PostMapping("/update/{idx}")
	public String update(MemberDTO dto) {
		int row = mservice.update(dto);
		return "redirect:/member/login";
	}
	//회원탈퇴 
	@GetMapping("/delete/{idx}")
	public String delete(@PathVariable("idx") int idx) {
		int row = mservice.delete(idx);
		return "redirect:/";
	}
	
	//비밀번호 재설정
	@GetMapping("/resetPassword")
	public void resetPassword() {}
	@PostMapping("/resetPassword")
	public String resetPassword(MemberDTO dto) {
		int row = mservice.reset(dto);
		return "redirect:/member/login";
	}
}
