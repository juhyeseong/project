package com.javabang.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.javabang.model.RentDTO;
import com.javabang.model.ReviewDTO;
import com.javabang.service.RentService;
import com.javabang.service.ReviewService;

@Controller
@RequestMapping("/rent")
public class RentController {

	@Autowired
	RentService rentService;
	@Autowired
	ReviewService reviewservice;

	@GetMapping("/hosting")
	public void hosting() {
	}

	@GetMapping("/room/{idx}")
	public ModelAndView room(@PathVariable("idx") int idx) {
		ModelAndView mav = new ModelAndView("/rent/room");
		RentDTO dto = rentService.selectOne(idx);
		List<ReviewDTO> reviewList = reviewservice.review(idx);
		mav.addObject("dto", dto);
		mav.addObject("reviewList", reviewList);
		return mav;
	}
	
	@GetMapping("/rentManage/{member}")
	public ModelAndView hostManage(@PathVariable("member") int member) {
		ModelAndView mav = new ModelAndView("rent/rentManage");
		List<RentDTO> list = rentService.selectHost(member);
		
		mav.addObject("rentList", list);
		
		return mav;
	}
	
	@GetMapping("/modify/{idx}")
	public ModelAndView rentModify(@PathVariable("idx") int idx) {
		ModelAndView mav = new ModelAndView("rent/modify");
		RentDTO rent = rentService.selectOne(idx);
		
		mav.addObject("rent", rent);
		
		return mav;
	}
	
	@GetMapping("/fileUpdate/{idx}")
	public ModelAndView fileUpdate(@PathVariable("idx") int idx) {
		ModelAndView mav = new ModelAndView("rent/fileUpdate");
		RentDTO rent = rentService.selectOne(idx);
		ObjectMapper obm = new ObjectMapper();
		try {
			String listToJson = obm.writeValueAsString(rent.getFilePathList());
			mav.addObject("rent", rent);
			mav.addObject("listToJson", listToJson);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		
		
		return mav;
	}
}
