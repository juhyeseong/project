package com.javabang.controller;

import java.util.HashMap;
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
import com.javabang.service.WishListService;

@Controller
@RequestMapping("/rent")
public class RentController {
	@Autowired private RentService rentService;
	@Autowired private WishListService wishListService;

	@GetMapping("/hosting")
	public void hosting() {}
	
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
	
	@GetMapping("/rentDelete/{idx}/{member}")
	public ModelAndView rentDelete(@PathVariable("idx") int idx, @PathVariable("member") int member) {
		ModelAndView mav = new ModelAndView("alert");
		int row = rentService.deleteRent(idx);
		String msg = row != 0 ? "숙소가 삭제되었습니다!" : "숙소 삭제에 실패했습니다";
		String url = row != 0 ? "/rent/rentManage/" + member : "/rent/modify/" + idx;
		
		mav.addObject("msg", msg);
		mav.addObject("url", url);
		
		return mav;
	}
	// 카테고리
		@GetMapping("/category/{category}")
		public ModelAndView pension(@PathVariable("category") String category, HttpSession session) {
			ModelAndView mav = new ModelAndView("home");
			List<RentDTO> rentList = rentService.filterPension(category);
			
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

}
