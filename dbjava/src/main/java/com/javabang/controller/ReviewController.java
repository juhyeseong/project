package com.javabang.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.javabang.model.MemberDTO;
import com.javabang.model.ReviewDTO;
import com.javabang.service.ReviewService;

@Controller
public class ReviewController {

	
	@Autowired private ReviewService reviewService;
	
	@PostMapping("/rent/room/{idx}")
	public String room(@PathVariable("idx") int idx, HttpSession session, ReviewDTO review) {
		MemberDTO login = (MemberDTO) session.getAttribute("login");
		
		reviewService.insertReview(idx, login.getIdx(), review);
		
		return "redirect:/rent/room/" + idx;
	}
}
