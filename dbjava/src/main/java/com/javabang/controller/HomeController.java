package com.javabang.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.javabang.model.MemberDTO;
import com.javabang.model.RentDTO;
import com.javabang.service.RentService;
import com.javabang.service.WishListService;

@Controller
public class HomeController {
	@Autowired RentService rentService;
	@Autowired WishListService wishListService;
	
	// 홈 화면에서 등록한 숙소들 보이기
	@RequestMapping("/")
	public ModelAndView home(HttpSession session) {
		ModelAndView mav = new ModelAndView("/home");
		List<RentDTO> rentList = rentService.selectAll();
		
		rentList.forEach(rent -> {
			HashMap<String, Object> map = new HashMap<>();
			MemberDTO login = (MemberDTO)session.getAttribute("login");
			
			if(login != null) {
				map.put("rent", rent.getIdx());
				map.put("member", login.getIdx());
				rent.setWishCount(wishListService.countWish(map));
			}
			else {
				rent.setWishCount(0);
			}
		});
		
    	mav.addObject("rentList", rentList);
    	
		return mav;
	}
	
	// 검색어
	@GetMapping("/search")
	public ModelAndView search (@RequestParam("search") String search) {
		ModelAndView mav = new ModelAndView("home");
		List<RentDTO> rentList = rentService.search(search);
		mav.addObject("rentList", rentList);
		return mav;
	}
	
}

