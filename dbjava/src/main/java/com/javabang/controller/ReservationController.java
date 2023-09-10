package com.javabang.controller;

import java.sql.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.javabang.model.MemberDTO;
import com.javabang.model.RentDTO;
import com.javabang.model.ReservationDTO;
import com.javabang.service.RentService;
import com.javabang.service.ReservationService;

@Controller
@RequestMapping("/reservation")
public class ReservationController {
	
	@Autowired private ReservationService reservationService;
	@Autowired private RentService rentService;
	
	@GetMapping("/reservationManage/{idx}")
	public ModelAndView reservationManage(@PathVariable("idx") int rent, HttpSession session) {
		ModelAndView mav = new ModelAndView("reservation/reservationManage");
		
		List<ReservationDTO> list = reservationService.selectReservation(rent);
		RentDTO rentDTO = rentService.selectOne(rent);
		MemberDTO login = (MemberDTO)session.getAttribute("login");
		if(rentDTO == null) {
			mav.setViewName("alert");
			mav.addObject("url", "/");
			mav.addObject("msg", "잘못된 접근입니다 ~ ");
			
			return mav;
		}
		if(login.getIdx() != rentDTO.getMember()) {
			mav.setViewName("alert");
			mav.addObject("url", "/");
			mav.addObject("msg", "잘못된 접근입니다 ~ ");
		}
		else {
			mav.addObject("reservationList", list);
			mav.addObject("rent", rent);
		}
	      
		return mav;
	}
   
	@GetMapping("/hostReservation/{idx}")
	public ModelAndView hostReservation(@PathVariable("idx") int idx, HttpSession session) {
		ModelAndView mav = new ModelAndView("reservation/hostReservation");
		
		RentDTO rent = rentService.selectOne(idx);
		List<ReservationDTO> reservationList = reservationService.selectReservationDate(idx);
		
		if(rent == null) {
			mav.setViewName("alert");
			mav.addObject("url", "/");
			mav.addObject("msg", "잘못된 접근입니다 ~ ");
		  
			return mav;
		}
		MemberDTO login = (MemberDTO)session.getAttribute("login");
		if(login.getIdx() != rent.getMember()) {
			mav.setViewName("alert");
			mav.addObject("url", "/");
			mav.addObject("msg", "잘못된 접근입니다 ~ ");
		}
		else {
			try {
			ObjectMapper mapper = new ObjectMapper();
				String json = mapper.writeValueAsString(reservationList);
				mav.addObject("rent", rent);
				mav.addObject("reservationList", json);
			} catch (JsonProcessingException e) {
				e.printStackTrace();
			}
		}
      
		return mav;
	}
   
	@PostMapping("/hostReservation/{idx}")
	public ModelAndView hostReservation(@PathVariable("idx") int idx, ReservationDTO dto) {
		ModelAndView mav = new ModelAndView("alert");
		dto.setRent(idx);

		int row = reservationService.insertReservation(dto);
		String msg = row != 0 ? "예약이 완료되었습니다 ~" : "예약에 실패하셨습니다 ~\n 계속 실패할 경우 관리자에게 문의주세요";
		String url = row != 0 ? "/" : "redirect:/rent/rentManage/";
      
		mav.addObject("msg", msg);
		mav.addObject("url", url);
        
		return mav;
	}
   
	@GetMapping("/reservationList/{member}")
	public ModelAndView reservationList(@PathVariable("member") int member, HttpSession session) {
		ModelAndView mav = new ModelAndView("reservation/reservationList");
		
		List<ReservationDTO> list = reservationService.selectReservationList(member);
		Date today = reservationService.selectSysdate();
		MemberDTO login = (MemberDTO)session.getAttribute("login");
		if(login.getIdx() != member) {
			mav.setViewName("alert");
			mav.addObject("url", "/");
			mav.addObject("msg", "잘못된 접근입니다 ~ ");
		}
		else {
			mav.addObject("list", list);
			mav.addObject("today", today);
		}
      
		return mav;
	}
}