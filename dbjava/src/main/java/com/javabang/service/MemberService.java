package com.javabang.service;



import java.security.NoSuchAlgorithmException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javabang.component.HashComponent;
import com.javabang.model.MemberDTO;
import com.javabang.repository.MemberDAO;

@Service
public class MemberService {
	@Autowired private MemberDAO mdao;
	@Autowired private HashComponent hcomponent;

	// 회원가입
	public int add(MemberDTO dto) throws NoSuchAlgorithmException  {
		String hash = hcomponent.getHash(dto.getUserPw());
		dto.setUserPw(hash);
		int row = 0;
		
		String dateString = dto.getYear() + "-" + dto.getMonth() + "-" + dto.getDay();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		try {
			Date utilDate = sdf.parse(dateString);
			java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
			
			dto.setBirth(sqlDate);
			row = mdao.add(dto);
		} catch (ParseException e) {
			System.err.println("dateFormat 예외 : "  + e);
		}
		
		return row;
	}

	// 로그인
	public MemberDTO login(MemberDTO dto) throws NoSuchAlgorithmException  {
		String hash = hcomponent.getHash(dto.getUserPw());
		dto.setUserPw(hash);
		MemberDTO login = mdao.login(dto);
		return login;
	}
}
