package com.javabang.controller;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.javabang.component.HashComponent;
import com.javabang.mail.MailComponent;
import com.javabang.model.MemberDTO;
import com.javabang.service.MemberService;
import com.jcraft.jsch.SftpException;

@Controller
@RequestMapping("/member")
public class MemberController {
	@Autowired
	private MemberService mservice;
	@Autowired
	private MailComponent mcomponent;
	@Autowired
	private HashComponent hcomponent;

	// 회원가입
	@GetMapping("/join")
	public void join() {
	}

	@PostMapping("/join")
	public String join(MemberDTO dto) throws NoSuchAlgorithmException {
		int row = mservice.add(dto);
		return "redirect:/member/login";
	}

	// 로그인
	@GetMapping("/login")
	public void login() {
	}

	@PostMapping("/login")
	public String login(MemberDTO dto, HttpSession session, HttpServletRequest request)
			throws NoSuchAlgorithmException {
		MemberDTO login = mservice.login(dto);
		session.setAttribute("login", login);

		return "redirect:/";
	}

	// 로그아웃
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}

	// 회원정보수정
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

	// 비밀번호만 수정하기
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

	// 회원 탈퇴
	@GetMapping("/delete/{idx}")
	public ModelAndView delete(@PathVariable("idx") int idx, HttpSession session) {
		ModelAndView mav = new ModelAndView("alert");
		int row = mservice.delete(idx);
		String msg = row != 0 ? "회원탈퇴 완료!" : "회원탈퇴에 실패했습니다";
		String url = row != 0 ? "/" : "/member/update";
		mav.addObject("msg", msg);
		mav.addObject("url", url);
		session.invalidate();
		return mav;
	}

	// 비밀번호 재설정
	@GetMapping("/resetPassword")
	public void resetPassword() {
	}

	@PostMapping("/resetPassword")
	@Transactional
	public ModelAndView resetPassword(MemberDTO dto) throws Exception {
		ModelAndView mav = new ModelAndView("alert");

		MemberDTO tmp = mservice.userCheck(dto);
		String random = UUID.randomUUID().toString().replace("-", "").substring(0, 16);

		tmp.setUserPw(random);

		mcomponent.sendMailPw(tmp.getEmail(), tmp.getUserPw());

		random = hcomponent.getHash(random);
		tmp.setUserPw(random);
		int row = mservice.updatePw(tmp);

		String msg = row != 0 ? "재설정 메일 발송 성공!" : "재설정 메일 발송 실패. .";
		String url = row != 0 ? "/" : "/member/update";
		mav.addObject("msg", msg);
		mav.addObject("url", url);

		return mav;
	}

	// 마이페이지
	@GetMapping("/mypage/{idx}")
	public ModelAndView mypage(@PathVariable("idx") int idx) {
		ModelAndView mav = new ModelAndView("/member/mypage");
		MemberDTO one = mservice.selectOne(idx);
		mav.addObject("one", one);
		return mav;
	}

	// 프로필 사진 수정
	@GetMapping("/updateProfile/{idx}")
	public ModelAndView profile(@PathVariable("idx") int idx) {
		ModelAndView mav = new ModelAndView("/member/updateProfile");
		MemberDTO tmp = mservice.selectOne(idx);
		mav.addObject("tmp", tmp);
		return mav;
	}

	@PostMapping("/updateProfile/{idx}")
	public String profile(HttpSession session, MemberDTO dto, @PathVariable("idx") int idx) throws Exception {
		int row = mservice.updateProfile(dto);
		MemberDTO tmp = mservice.selectOne(idx);
		session.setAttribute("login", tmp);
		return "redirect:/member/mypage/" + idx;
	}

	// 프로필 기본 이미지로 변경
	@GetMapping("/updateBasicProfile/{idx}")
	public ModelAndView basicProfilePage(@PathVariable("idx") int idx) {
		ModelAndView mav = new ModelAndView("/member/updateBasicProfile");
		MemberDTO tmp = mservice.selectOne(idx);
		mav.addObject("tmp", tmp);
		return mav;
	}

	@PostMapping("/updateBasicProfile/{idx}")
	public String basicProfile(HttpSession session, @PathVariable("idx") int idx, MemberDTO dto) throws Exception {
		// 여기에서 기본 이미지로 변경하는 로직을 수행합니다.
		dto.setProfile("http://192.168.64.200/basicProfile.jpeg"); // 기본 이미지 URL로 설정
		int row = mservice.basicProfile(dto); // 기본 이미지로 변경 작업 수행
		MemberDTO tmp = mservice.selectOne(idx);
		session.setAttribute("login", tmp); // 로그인 정보를 변경된 MemberDTO로 업데이트
		return "redirect:/member/mypage/" + idx;

	}

	@GetMapping("/naverlogin")
	public void naver() {
	}

	@GetMapping("/navercallback")
	public void naver2() {
	}

	@GetMapping("/findId")
	public void findId() {
	}

	@PostMapping("/findId")
	public ModelAndView findId(MemberDTO dto) {
		ModelAndView mav = new ModelAndView("/member/resultId");
		MemberDTO tmp = mservice.findId(dto);
		mav.addObject("tmp", tmp);
		return mav;
	}

	@PostMapping("/resultId")
	public void resultId() {
	}

}
