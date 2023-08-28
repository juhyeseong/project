package com.javabang.controller;

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

import com.javabang.component.HashComponent;
import com.javabang.mail.MailComponent;
import com.javabang.model.MemberDTO;
import com.javabang.service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {
	@Autowired
	private MemberService memberService;
	@Autowired
	private MailComponent mailComponent;
	@Autowired
	private HashComponent hashComponent;

	// 회원가입
	@GetMapping("/join")
	public void join() {}

	@PostMapping("/join")
	public String join(MemberDTO dto) throws NoSuchAlgorithmException {
		memberService.add(dto);
		return "redirect:/member/login";
	}

	// 로그인
	@GetMapping("/login")
	public void login() {
	}

	@PostMapping("/login")
	public String login(MemberDTO dto, HttpSession session, HttpServletRequest request)
			throws NoSuchAlgorithmException {
		MemberDTO login = memberService.login(dto);
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
		MemberDTO dto = memberService.selectOne(idx);
		mav.addObject("dto", dto);
		return mav;
	}

	@PostMapping("/update/{idx}")
	public String update(MemberDTO dto, HttpSession session) {
		memberService.update(dto);
		MemberDTO tmp = memberService.selectOne(dto.getIdx());
		session.setAttribute("login", tmp);
		return "redirect:/";
	}

	// 비밀번호만 수정하기
	@GetMapping("/modifyPassword/{idx}")
	public ModelAndView modifyPassword(@PathVariable("idx") int idx) {
		ModelAndView mav = new ModelAndView("/member/modifyPassword");
		MemberDTO dto = memberService.selectOne(idx);
		mav.addObject("dto", dto);
		return mav;
	}

	@PostMapping("/modifyPassword/{idx}")
	public String modifyPassword(MemberDTO dto) throws NoSuchAlgorithmException {
		memberService.modifyPassword(dto);
		return "redirect:/";
	}

	// 회원 탈퇴
	@GetMapping("/delete/{idx}")
	public ModelAndView delete(@PathVariable("idx") int idx, HttpSession session) {
		ModelAndView mav = new ModelAndView("alert");
		int row = memberService.delete(idx);
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

		MemberDTO tmp = memberService.userCheck(dto);
		String random = UUID.randomUUID().toString().replace("-", "").substring(0, 16);

		tmp.setUserPw(random);

		mailComponent.sendMailPw(tmp.getEmail(), tmp.getUserPw());

		random = hashComponent.getHash(random);
		tmp.setUserPw(random);
		int row = memberService.updatePw(tmp);

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
		MemberDTO one = memberService.selectOne(idx);
		mav.addObject("one", one);
		return mav;
	}

	// 프로필 사진 수정
	@GetMapping("/updateProfile/{idx}")
	public ModelAndView profile(@PathVariable("idx") int idx) {
		ModelAndView mav = new ModelAndView("/member/updateProfile");
		MemberDTO tmp = memberService.selectOne(idx);
		mav.addObject("tmp", tmp);
		return mav;
	}

	@PostMapping("/updateProfile/{idx}")
	public String profile(HttpSession session, MemberDTO dto, @PathVariable("idx") int idx) throws Exception {
	    memberService.updateProfile(dto);
		MemberDTO tmp = memberService.selectOne(idx);
		session.setAttribute("login", tmp);
		return "redirect:/member/mypage/" + idx;
	}

	// 프로필 기본 이미지로 변경
	@GetMapping("/updateBasicProfile/{idx}")
	public ModelAndView basicProfilePage(@PathVariable("idx") int idx) {
		ModelAndView mav = new ModelAndView("/member/updateBasicProfile");
		MemberDTO tmp = memberService.selectOne(idx);
		mav.addObject("tmp", tmp);
		return mav;
	}

	@PostMapping("/updateBasicProfile/{idx}")
	public String basicProfile(HttpSession session, @PathVariable("idx") int idx, MemberDTO dto) throws Exception {
		// 여기에서 기본 이미지로 변경하는 로직을 수행합니다.
		dto.setProfile("http://192.168.64.200/basicProfile.png"); // 기본 이미지 URL로 설정
		memberService.basicProfile(dto); // 기본 이미지로 변경 작업 수행
		MemberDTO tmp = memberService.selectOne(idx);
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
		MemberDTO tmp = memberService.findId(dto);
		mav.addObject("tmp", tmp);
		return mav;
	}

	@PostMapping("/resultId")
	public void resultId() {
	}

}
