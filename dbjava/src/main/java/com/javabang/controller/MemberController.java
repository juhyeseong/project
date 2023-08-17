package com.javabang.controller;



import java.io.FileNotFoundException;
import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.javabang.component.HashComponent;
import com.javabang.mail.MailComponent;
import com.javabang.model.MemberDTO;
import com.javabang.service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired private MemberService mservice;
	@Autowired private MailComponent mcomponent;
	@Autowired private HashComponent hcomponent;
	
	//ȸ������
	@GetMapping("/join")
	public void join() {}
	
	@PostMapping("/join")
	public String join(MemberDTO dto) throws NoSuchAlgorithmException  {
		int row = mservice.add(dto);
		return "redirect:/member/login";
	}
	
	//�α���
	@GetMapping("/login")
	public void login() {}
	@PostMapping("/login")
	public String login(MemberDTO dto, HttpSession session) throws NoSuchAlgorithmException  {
		MemberDTO login = mservice.login(dto);
		session.setAttribute("login", login);
		return "redirect:/";
	}
	
	//�α׾ƿ�
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	// ȸ����������
	@GetMapping("/update/{idx}")
	public ModelAndView update(@PathVariable("idx") int idx) {
		ModelAndView mav = new ModelAndView("/member/update");
		MemberDTO dto = mservice.selectOne(idx);
		mav.addObject("dto", dto);
		return mav;
	}
	@PostMapping("/update/{idx}")
	public String update(MemberDTO dto, HttpSession session) {
		int row = mservice.update(dto);
		MemberDTO tmp = mservice.selectOne(dto.getIdx());
		session.setAttribute("login", tmp);
		return "redirect:/";
	}
	
	// ��й�ȣ�� �����ϱ�
	@GetMapping("/modifyPassword/{idx}")
	public ModelAndView modifyPassword(@PathVariable("idx") int idx) {
		ModelAndView mav = new ModelAndView("/member/modifyPassword");
		MemberDTO dto = mservice.selectOne(idx);
		mav.addObject("dto", dto);
		return mav;
	}
	
	@PostMapping("/modifyPassword/{idx}")
	public String modifyPassword(MemberDTO dto) throws NoSuchAlgorithmException {
		int row = mservice.modifyPassword(dto);
		return "redirect:/";
	}
	
	
	//ȸ�� Ż��
	@GetMapping("/delete/{idx}")
	public String delete(@PathVariable("idx") int idx) {
		int row = mservice.delete(idx);
		return "redirect:/";
	}
	
	//��й�ȣ �缳��
	@GetMapping("/resetPassword")
	public void resetPassword() {}
	
	@PostMapping("/resetPassword")
	@Transactional
	public String resetPassword(MemberDTO dto) throws FileNotFoundException, IOException, NoSuchAlgorithmException {
		System.out.println("dto.userid : " + dto.getUserId());
		System.out.println("dto.useremail : " + dto.getEmail());
		
		MemberDTO tmp = mservice.userCheck(dto);
		
		System.out.println("row.getIdx : " + tmp.getIdx());
		System.out.println("row.getUserId : " + tmp.getUserId());
		System.out.println("row.getEmail : " + tmp.getEmail());
		
		String random = UUID.randomUUID().toString().replace("-", "").substring(0,16);
		
		tmp.setUserPw(random);
		
		mcomponent.sendMail(tmp.getEmail(), tmp.getUserPw());
		
		random = hcomponent.getHash(random);
		tmp.setUserPw(random);
		int row = mservice.updatePw(tmp);
		
		return "redirect:/member/login";
	}
	// ����������
	@GetMapping("/mypage/{idx}")
	public ModelAndView mypage(@PathVariable("idx") int idx) {
		ModelAndView mav = new ModelAndView("/member/mypage");
		MemberDTO one = mservice.selectOne(idx);
		mav.addObject("one", one);
		return mav;
	}
	
}
