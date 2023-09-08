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
	
	//리뷰 글 등록
	@PostMapping("/room/{idx}")
	public String room(@PathVariable("idx") int idx, HttpSession session, ReviewDTO review) {
		MemberDTO login = (MemberDTO) session.getAttribute("login");
		review.setMember(login.getIdx());
		review.setRent(idx);
	
		reviewService.insertReview(review); 

		return "redirect:/room/" + idx;
	}
}