package com.javabang.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.javabang.service.AdminService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired private AdminService adminService;
	
	@GetMapping("/adminPage/{idx}")
	public ModelAndView adminPage(@PathVariable("idx") int idx) {
		ModelAndView mav = new ModelAndView("admin/adminPage");
		 
		return mav;
	}
	
	@GetMapping("/reservation")
	public void reservation() {}
	
	@GetMapping("/registration")
	public void registration() {}
	
	@GetMapping("/payment")
	public void payment() {}

}
