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
import com.jcraft.jsch.SftpException;

@Controller
@RequestMapping("/member")
public class MemberController {
   
   @Autowired private MemberService mservice;
   @Autowired private MailComponent mcomponent;
   @Autowired private HashComponent hcomponent;
   
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
   
   
   //회원 탈퇴
   @GetMapping("/delete/{idx}")
   public ModelAndView delete(@PathVariable("idx") int idx, HttpSession session) {
      ModelAndView mav = new ModelAndView("alert");
      int row = mservice.delete(idx);
      String msg = row != 0 ? "회원탈퇴 완료!" : "회원탈퇴에 실패했습니다";
      String url = row != 0 ? "/" : "/member/update";
      mav.addObject("msg", msg);
      mav.addObject("url",url);
      session.invalidate();
      return mav;
   }
   
   //비밀번호 재설정
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
   // 마이페이지
   @GetMapping("/mypage/{idx}")
   public ModelAndView mypage(@PathVariable("idx") int idx) {
      ModelAndView mav = new ModelAndView("/member/mypage");
      MemberDTO one = mservice.selectOne(idx);
      mav.addObject("one", one);
      return mav;
   }
   
   // 프로필 수정
   
   @GetMapping("/updateProfile/{idx}")
   public ModelAndView profile(@PathVariable("idx") int idx) {
      ModelAndView mav = new ModelAndView("/member/updateProfile");
      MemberDTO tmp = mservice.selectOne(idx);
      mav.addObject("tmp", tmp);
      return mav;
   }
   
   @PostMapping("/updateProfile/{idx}")
   public String profile(HttpSession session,MemberDTO dto, @PathVariable("idx") int idx) throws IllegalStateException, SftpException, IOException, Exception {
      int row = mservice.updateProfile(dto);
      MemberDTO tmp = mservice.selectOne(idx);
      session.setAttribute("login", tmp);
      return "redirect:/member/mypage/"+ idx;
   }
   
   
   
}