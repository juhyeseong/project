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
import com.javabang.model.ReportDTO;
import com.javabang.model.ReservationDTO;
import com.javabang.model.ReviewReportDTO;
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
	
	@GetMapping("/reporting")
	public ModelAndView reporting() {
		ModelAndView mav = new ModelAndView();
		List<ReportDTO> list = adminService.selectAllReport();
		mav.addObject("list", list);
		return mav;
	}
	@PostMapping("/reporting")
	public ModelAndView reporting(@RequestParam String search) {
		ModelAndView mav = new ModelAndView();
		List<ReportDTO> list = adminService.selectAllReport(search);
		mav.addObject("list", list);
		return mav;
	}
	
	
	@PostMapping("userReport")
	public ModelAndView userReport(ReportDTO dto) {
		ModelAndView mav = new ModelAndView("alert");
		int row = adminService.insertReport(dto);
		String msg = row != 0 ? "신고가 완료되었습니다. 관리자가 빠르게 처리해 드리겠습니다 ~" : "신고에 실패하셨습니다. 계속 실패할 경우 관리자에게 문의주세요";
		String url = "/room/" + dto.getRent();
		
		mav.addObject("msg", msg);
		mav.addObject("url", url);
		
		return mav;
	}
	
	@PostMapping("reviewReport")
	public ModelAndView replyReport(ReviewReportDTO dto, @RequestParam int rentIdx) {
		ModelAndView mav = new ModelAndView("alert");
		System.out.println("dto.memberIdx : " + dto.getMember());
		System.out.println("dto.reviewIdx : " + dto.getReview());
		int row = adminService.insertReviewReport(dto);
		String msg = row != 0 ? "신고가 완료되었습니다. 관리자가 빠르게 처리해 드리겠습니다 ~" : "신고에 실패하셨습니다. 계속 실패할 경우 관리자에게 문의주세요";
		String url = "/room/" + rentIdx;
		
		mav.addObject("msg", msg);
		mav.addObject("url", url);
		
		return mav;
	}
	
	@GetMapping("reviewReporting")
	public ModelAndView replyReporting() {
		ModelAndView mav = new ModelAndView();
		List<ReviewReportDTO> list = adminService.selectAllReviewReport();
		mav.addObject("list", list);
		return mav;
	}
	@PostMapping("reviewReporting")
	public ModelAndView replyReporting(@RequestParam String search) {
		ModelAndView mav = new ModelAndView();
		List<ReviewReportDTO> list = adminService.selectAllReviewReport(search);
		mav.addObject("list", list);
		return mav;
	}
	
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
