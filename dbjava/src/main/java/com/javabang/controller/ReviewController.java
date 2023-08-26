package com.javabang.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.javabang.model.MemberDTO;
import com.javabang.model.RentDTO;
import com.javabang.model.RentImgDTO;
import com.javabang.model.ReviewDTO;
import com.javabang.service.RentService;
import com.javabang.service.ReviewService;

@Controller
public class ReviewController {

	
	@Autowired private ReviewService reviewService;
	@Autowired private RentService rentService;
	
	@PostMapping("/rent/room/{idx}")
	public ModelAndView room(@PathVariable("idx") int idx, HttpSession session, ReviewDTO review) {
		ModelAndView mav = new ModelAndView("/rent/room");
		MemberDTO tmp = (MemberDTO) session.getAttribute("login");
		
		 reviewService.insertReview(idx, tmp.getIdx(), review);
		
		
		RentDTO dto = rentService.selectOne(idx);
		List<RentImgDTO> imgs = rentService.selectImg(idx);
		List<ReviewDTO> reviewList = reviewService.review(idx);
		mav.addObject("dto", dto);
		mav.addObject("imgs", imgs);
		mav.addObject("reviewList", reviewList);
		return mav;
	}
}
