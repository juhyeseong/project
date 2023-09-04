package com.javabang.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.javabang.model.WishListDTO;
import com.javabang.service.WishListService;

@Controller
@RequestMapping("/wishList")
public class WishListController {
	@Autowired private WishListService wishListService;

	@GetMapping("/myWishList/{member}")
	public ModelAndView myWishList(@PathVariable("member") int member) {
		ModelAndView mav = new ModelAndView("wishList/myWishList");
		List<WishListDTO> wishList = wishListService.selectMyWishList(member);
		
		mav.addObject("wishList", wishList);
		
		return mav;
	}
}
