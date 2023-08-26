package com.javabang.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.javabang.model.RentDTO;
import com.javabang.model.RentImgDTO;
import com.javabang.model.ReviewDTO;
import com.javabang.service.RentService;
import com.javabang.service.ReviewService;

@Controller
@RequestMapping("/rent")
public class RentController {

	@Autowired
	RentService rservice;
	@Autowired
	ReviewService reviewservice;

	@GetMapping("/hosting")
	public void hosting() {
	}

	@GetMapping("/room/{idx}")
	public ModelAndView room(@PathVariable("idx") int idx) {
		ModelAndView mav = new ModelAndView("/rent/room");
		RentDTO dto = rservice.selectOne(idx);
		List<RentImgDTO> imgs = rservice.selectImg(idx);
		List<ReviewDTO> reviewList = reviewservice.review(idx);
		mav.addObject("dto", dto);
		mav.addObject("imgs", imgs);
		mav.addObject("reviewList", reviewList);
		return mav;
	}

}
