package com.javabang.controller;
import java.io.IOException;
import java.util.HashMap;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import com.javabang.model.MemberDTO;
import com.javabang.service.MemberService;


@RestController
public class AjaxController {
	@Autowired private MemberService mservice;
	
	@GetMapping("/getmail/{email}")
	public HashMap<String, Object> getEmail(@RequestBody MemberDTO dto){
		String email = mservice.getEmail(dto);
		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("email", email);
		result.put("status", email != null);
		return result;
	}
	@GetMapping("/dupCheck/{userId}")
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
		result.put("message", row > 0 ? "메일이 발송되었습니다" : "메일 전송에 실패했습니다");
		return result;
	}
	
	@GetMapping("/checkAuthNumber/{authNumber}")
	public int checkAuthNumber(@PathVariable("authNumber") int authNumber, HttpSession session) {
		int sessionNumber = (int)session.getAttribute("authNumber");
		session.setMaxInactiveInterval(1800);
		return authNumber == sessionNumber ? 1 : 0;
	}

	
	        
	   
}
