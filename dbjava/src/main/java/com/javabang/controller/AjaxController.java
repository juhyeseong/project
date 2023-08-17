package com.javabang.controller;


import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
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
}
