package com.javabang.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.javabang.model.MemberDTO;
import com.javabang.model.RentDTO;
import com.javabang.model.ReservationDTO;
import com.javabang.model.ReviewDTO;
import com.javabang.service.RentService;
import com.javabang.service.ReportService;
import com.javabang.service.ReservationService;
import com.javabang.service.ReviewService;
import com.javabang.service.WishListService;

@Controller
public class HomeController {
	@Autowired private RentService rentService;
	@Autowired private WishListService wishListService;
	@Autowired private ReviewService reviewService;
	@Autowired private ReservationService reservationService;
	@Autowired private ReportService reportService;
	
	// 홈 화면에서 등록한 숙소들 보이기
	@RequestMapping("/")
	public ModelAndView home(HttpSession session) {
		ModelAndView mav = new ModelAndView("/home");
		List<RentDTO> rentList = rentService.selectAll();
		
		rentList.forEach(rent -> {
			HashMap<String, Object> map = new HashMap<>();
			MemberDTO login = (MemberDTO)session.getAttribute("login");
			
			if(login != null) {
				map.put("rent", rent.getIdx());
				map.put("member", login.getIdx());
				rent.setWishCount(wishListService.countWish(map));
			}
			else {
				rent.setWishCount(0);
			}
		});
		
    	mav.addObject("rentList", rentList);
    	
		return mav;
	}
	
	// 검색어
	@GetMapping("/search")
	public ModelAndView search (@RequestParam("search") String search, HttpSession session) {
		ModelAndView mav = new ModelAndView("home");
		List<RentDTO> rentList = rentService.search(search);
		
		rentList.forEach(rent -> {
			HashMap<String, Object> map = new HashMap<>();
			MemberDTO login = (MemberDTO)session.getAttribute("login");
			
			if(login != null) {
				map.put("rent", rent.getIdx());
				map.put("member", login.getIdx());
				rent.setWishCount(wishListService.countWish(map));
			}
			else {
				rent.setWishCount(0);
			}
		});
		
		mav.addObject("rentList", rentList);
		
		return mav;
	}
	
	@GetMapping("/room/{idx}")
	public ModelAndView room(@PathVariable("idx") int idx, HttpSession session) {
	      ModelAndView mav = new ModelAndView("rent/room");
	      RentDTO dto = rentService.selectOne(idx);
	        List<ReviewDTO> reviewList = reviewService.reviewSelectAll(idx);
	        List<ReservationDTO> reservationList = reservationService.selectReservationDate(idx);
	        int count = 0;
	        MemberDTO tmp = null;
	        
	        if(session.getAttribute("login") != null) {
	        	tmp = (MemberDTO) session.getAttribute("login");
		        count = reportService.usedCount(idx, tmp.getIdx());
	        }
	        
	        ObjectMapper mapper = new ObjectMapper();
	        try {
	         String json = mapper.writeValueAsString(reservationList);
	         mav.addObject("dto", dto);
	         mav.addObject("reviewList", reviewList);
	         mav.addObject("reservationList", json);
	         mav.addObject("rentIdx", idx);
	         mav.addObject("count", count);
	      } catch (JsonProcessingException e) {
	         e.printStackTrace();
	      }
	        
	      return mav;
	}
}

