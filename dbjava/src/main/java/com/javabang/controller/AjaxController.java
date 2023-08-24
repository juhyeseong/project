package com.javabang.controller;
import java.io.IOException;
import java.util.HashMap;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.javabang.model.MemberDTO;
import com.javabang.model.RentDTO;
import com.javabang.service.MemberService;
import com.javabang.service.RentService;


@RestController
public class AjaxController {
	@Autowired private MemberService mservice;
	@Autowired private RentService rservice;

	@GetMapping("/getmail/{email}")
	public HashMap<String, Object> getEmail(@RequestBody MemberDTO dto){
		String email = mservice.getEmail(dto);
		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("email", email);
		result.put("status", email != null);
		return result;
	}
	@GetMapping("/dupCheck/{userId}/")
	public int dupCheck(@PathVariable("userId") String userId) {
		int row = mservice.dupCheck(userId);
		return row;
	}
	
	@GetMapping("/sendAuthNumber/{email}/")
	public HashMap<String, Object> sendAuthNumber(@PathVariable("email") String email, HttpSession session) throws IOException {
		System.out.println("email : " + email);
		int row = mservice.sendAuthNumber(email);
		if(row != 0) {
			session.setAttribute("authNumber", row);
			session.setMaxInactiveInterval(180);
		}
		HashMap<String, Object> result = new HashMap<>();
		result.put("success", row > 0 ? 1 : 0);
		result.put("message", row > 0 ? "인증번호가 발송 되었습니다 !" : "인증번호 발송에 실패했습니다 !");
		return result;
	}
	
	@GetMapping("/checkAuthNumber/{authNumber}")
	public int checkAuthNumber(@PathVariable("authNumber") int authNumber, HttpSession session) {
		int sessionNumber = (int)session.getAttribute("authNumber");
		session.setMaxInactiveInterval(1800);
		return authNumber == sessionNumber ? 1 : 0;
	}

	@PostMapping("/rent/createRent")
	public HashMap<String, String> createRent(RentDTO dto) {
		HashMap<String, String> map = new HashMap<String, String>();
		int row = 0;
		String msg = null;
		String url = null;
		
		row = rservice.rentInsert(dto);
		msg = row != 0 ? "숙소 등록이 완료되었습니다 ~~ " : "숙소 등록에 실패하였습니다 ~~";
		url = row != 0 ? "/member/mypage" : "/rent/hosting";

		map.put("msg", msg);
		map.put("url", url);
		
		return map;
	} 
}
