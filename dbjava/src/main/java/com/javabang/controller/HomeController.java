package com.javabang.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.javabang.model.RentDTO;
import com.javabang.service.RentService;

@Controller
public class HomeController {
	
	@Autowired RentService rentService;
	
	// 홈 화면에서 등록한 숙소들 보이기
	@RequestMapping("/")
	public ModelAndView home() {
		ModelAndView mav = new ModelAndView("/home");
		List<RentDTO> list = rentService.selectAll();
    	mav.addObject("list", list);
		return mav;
	}
	
	// 검색어
	@GetMapping("/search")
	public ModelAndView search (@RequestParam("search") String search) {
		ModelAndView mav = new ModelAndView("home");
		List<RentDTO> list = rentService.search(search);
		mav.addObject("list", list);
		return mav;
	}
}

