package com.javabang.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.javabang.model.MemberDTO;
import com.javabang.model.WishListDTO;
import com.javabang.service.WishListService;

@Controller
@RequestMapping("/wishList")
public class WishListController {
	@Autowired private WishListService wishListService;

	@GetMapping("/myWishList/{member}")
	public ModelAndView myWishList(@PathVariable("member") int member, HttpSession session) {
		ModelAndView mav = new ModelAndView("wishList/myWishList");
		List<WishListDTO> wishList = wishListService.selectMyWishList(member);
		MemberDTO login = (MemberDTO)session.getAttribute("login");
		if(login.getIdx() != member) {
			mav.setViewName("alert");
			mav.addObject("url", "/");
			mav.addObject("msg", "잘못된 접근입니다 ~ ");
		}
		else {
			mav.addObject("wishList", wishList);			
		}
		
		return mav;
	}
}