package com.javabang.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

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
	   public ModelAndView reservationManage(@PathVariable("idx") int rent) {
	      ModelAndView mav = new ModelAndView("reservation/reservationManage");
	      int idx = rent;
	      List<ReservationDTO> list = reservationService.selectReservation(rent);
	      
	      mav.addObject("reservationList", list);
	      mav.addObject("rent", idx);
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
   
   @GetMapping("/insertReservation")
   public ModelAndView insertReservation(HttpSession session) {
     int rent = (int)session.getAttribute("rent");
     int member = (int)session.getAttribute("member");
     String sDateString = (String)session.getAttribute("sDateString");
     String eDateString = (String)session.getAttribute("eDateString");
     int guestCount = (int)session.getAttribute("guestCount");
     int totalPrice = (int)session.getAttribute("totalPrice");
     
     ReservationDTO dto = new ReservationDTO(rent, member, sDateString, eDateString, guestCount, totalPrice);
     ModelAndView mav = new ModelAndView("alert");
     int row = reservationService.insertReservation(dto);
     String msg = row != 0 ? "예약이 완료되었습니다 ~" : "예약에 실패하셨습니다 ~\n 계속 실패할 경우 관리자에게 문의주세요";
     String url = row != 0 ? "/" : "redirect:/rent/room/" + dto.getRent();

     mav.addObject("msg", msg);
     mav.addObject("url", url);
      
     session.removeAttribute("rent");
     session.removeAttribute("member");
     session.removeAttribute("sDateString");
     session.removeAttribute("eDateString");
     session.removeAttribute("guestCount");
     session.removeAttribute("totalPrice");
      
     return mav;
   }

   
   @GetMapping("/kakaopayFailed")
   public ModelAndView kakaopayFailed(HttpSession session) {
      ModelAndView mav = new ModelAndView("alert");
      String url = "/rent/room/" + session.getAttribute("rent");
      String msg = "결제 실패하셨습니다 ~\n실패가 계속될 경우 관리자에게 문의주세요 ~~";
      
      mav.addObject("url", url);
      mav.addObject("msg", msg);
      
      return mav;	
   }
   
   @GetMapping("/hostReservation/{idx}")
   public ModelAndView hostReservation(@PathVariable("idx") int idx) {
      ModelAndView mav = new ModelAndView("reservation/hostReservation");
      RentDTO rent = rentService.selectOne(idx);
      
      mav.addObject("rent", rent);
      
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
   public ModelAndView reservationList(@PathVariable("member") int member) {
      ModelAndView mav = new ModelAndView("reservation/reservationList");
      List<ReservationDTO> list = reservationService.selectReservationList(member);
      
      mav.addObject("list", list);
      
      return mav;
   }
}