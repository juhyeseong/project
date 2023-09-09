package com.javabang.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.javabang.model.MemberDTO;
import com.javabang.model.RentDTO;
import com.javabang.service.RentService;

@Controller
@RequestMapping("/rent")
public class RentController {
	
	@Autowired private RentService rentService;

	@GetMapping("/hosting")
	public void hosting() {}
	
	@GetMapping("/rentManage/{member}")
	public ModelAndView hostManage(@PathVariable("member") int member, HttpSession session) {
		ModelAndView mav = new ModelAndView("rent/rentManage");
		
		List<RentDTO> list = rentService.selectHost(member);
		MemberDTO login = (MemberDTO)session.getAttribute("login");
		if(login.getIdx() != member) {
			mav.setViewName("alert");
			mav.addObject("url", "/");
			mav.addObject("msg", "잘못된 접근입니다 ~ ");
		}
		else {
			mav.addObject("rentList", list);
		}
		
		return mav;
	}
	
	@GetMapping("/modify/{idx}")
	public ModelAndView rentModify(@PathVariable("idx") int idx, HttpSession session) {
		ModelAndView mav = new ModelAndView("rent/modify");
		
		RentDTO rent = rentService.selectOne(idx);
		if(rent == null) {
			mav.setViewName("alert");
			mav.addObject("url", "/");
			mav.addObject("msg", "없는 숙소입니다 ~ ");
			
			return mav;
		}
		MemberDTO login = (MemberDTO)session.getAttribute("login");
		if(login.getIdx() != rent.getMember()) {
			mav.setViewName("alert");
			mav.addObject("url", "/");
			mav.addObject("msg", "잘못된 접근입니다 ~ ");
		}
		else {
			mav.addObject("rent", rent);
		}
		
		return mav;
	}
	
	@GetMapping("/fileUpdate/{idx}")
	public ModelAndView fileUpdate(@PathVariable("idx") int idx, HttpSession session) {
		ModelAndView mav = new ModelAndView("rent/fileUpdate");
		
		RentDTO rent = rentService.selectOne(idx);
		if(rent == null) {
			mav.setViewName("alert");
			mav.addObject("url", "/");
			mav.addObject("msg", "없는 숙소입니다 ~ ");
			
			return mav;
		}
		ObjectMapper obm = new ObjectMapper();
		MemberDTO login = (MemberDTO)session.getAttribute("login");
		if(login.getIdx() != rent.getMember()) {
			mav.setViewName("alert");
			mav.addObject("url", "/");
			mav.addObject("msg", "잘못된 접근입니다 ~ ");
		}
		else {
			try {
				String listToJson = obm.writeValueAsString(rent.getFilePathList());

				mav.addObject("rent", rent);
				mav.addObject("listToJson", listToJson);
			} catch (JsonProcessingException e) {
				e.printStackTrace();
			}
		}
		
		return mav;
	}
	
	@GetMapping("/rentDelete/{idx}/{member}")
	public ModelAndView rentDelete(@PathVariable("idx") int idx, @PathVariable("member") int member, HttpSession session) {
		ModelAndView mav = new ModelAndView("alert");
		
		MemberDTO login = (MemberDTO)session.getAttribute("login");
		if(login.getIdx() != member) {
			mav.setViewName("alert");
			mav.addObject("url", "/");
			mav.addObject("msg", "잘못된 접근입니다 ~ ");
			
			return mav;
		}
		int row = rentService.deleteRent(idx);
		String msg = row != 0 ? "숙소가 삭제되었습니다!" : "숙소 삭제에 실패했습니다";
		String url = row != 0 ? "/rent/rentManage/" + member : "/rent/modify/" + idx;
		mav.addObject("msg", msg);
		mav.addObject("url", url);
		
		return mav;
	}
}