package com.javabang.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.javabang.model.ReservationDTO;
import com.javabang.service.ReservationService;

@Controller
@RequestMapping("/reservation")
public class ReservationController {
	
	@Autowired private ReservationService reservationService;
	
   @GetMapping("/reservationManage/{idx}")
   public ModelAndView reservationManage() {
      ModelAndView mav = new ModelAndView("reservation/reservationManage");
      
      return mav;
   }
   
   @PostMapping("/insertReservation")
   public ModelAndView insertReservation(ReservationDTO dto) {
      ModelAndView mav = new ModelAndView("alert");
      int row = reservationService.insertReservation(dto);
      String msg = row != 0 ? "예약이 완료되었습니다 ~" : "예약에 실패하셨습니다 ~\n 계속 실패할 경우 관리자에게 문의주세요";
      String url = row != 0 ? "/" : "redirect:/rent/room/" + dto.getRent();

      mav.addObject("msg", msg);
      mav.addObject("url", url);
      
      return mav;
   }
}