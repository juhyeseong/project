package com.javabang.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.javabang.model.PagingDTO;
import com.javabang.model.RentDTO;
import com.javabang.model.ReservationDTO;
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
	public ModelAndView reservation() {
	
		ModelAndView mav = new ModelAndView();
		List<ReservationDTO> list = adminService.selectAllReservation();
		mav.addObject("list", list);
		return mav; 
	}
	
	@PostMapping("/reservation")
	public ModelAndView reservation(@RequestParam String search) {
	
		ModelAndView mav = new ModelAndView();
		List<ReservationDTO> list = adminService.selectAllReservation(search);
		mav.addObject("list", list);
		return mav; 
	}
	
	
	
	@GetMapping("/registration")
	public ModelAndView registration(@RequestParam(value="page", defaultValue="1") int page) {
		ModelAndView mav = new ModelAndView();
		
		int boardCount = adminService.selectCount();
		PagingDTO paging = new PagingDTO(page, boardCount);
		
		List<RentDTO> list = adminService.selectAllRoom(paging);
		
		mav.addObject("list", list);
		mav.addObject("paging", paging);
		return mav;
	}
	
	@GetMapping("/payment")
	public void payment() {}
	
	@GetMapping("/permit/{idx}")
	public String permit(@PathVariable("idx") int idx) {
		adminService.permitAccomodation(idx);
		return "redirect:/admin/registration";
	}
	
	@GetMapping("/cencel/{idx}")
	public String cencel(@PathVariable("idx") int idx) {
		adminService.cencelAccomodation(idx);
		return "redirect:/admin/registration";
	}

}
