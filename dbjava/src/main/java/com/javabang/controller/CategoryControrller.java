package com.javabang.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.javabang.model.RentDTO;
import com.javabang.service.CategoryService;

@Controller
@RequestMapping("/rent")
public class CategoryControrller {
	@Autowired
	private CategoryService categoryService;

	// 카테고리 호텔만 불러오기

	@GetMapping("/hotelcategory/{category}")
	public ModelAndView hotelcategory(@PathVariable("category") String category) {
		/* String category = "호텔"; */
		
		ModelAndView mav = new ModelAndView("/rent/hotelcategory") ;
		List<RentDTO> hotelList = categoryService.filterHotel(category);
		mav.addObject("hotelList", hotelList);
		return mav;
	}
}
