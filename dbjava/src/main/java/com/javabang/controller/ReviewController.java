package com.javabang.controller;

import java.awt.List;
import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.javabang.model.MemberDTO;
import com.javabang.model.ReviewDTO;
import com.javabang.service.ReviewService;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class ReviewController {

	
	@Autowired private ReviewService reviewService;
	
	//리뷰 글 등록
	@PostMapping("/rent/room/{idx}")
	public String room(@PathVariable("idx") int idx, HttpSession session, ReviewDTO review) {
		
		MemberDTO login = (MemberDTO) session.getAttribute("login");
	
		
	    reviewService.insertReview(idx, login.getIdx(), review); 
		
	
		
		return "redirect:/rent/room/" + idx;
	}

	
}
