package com.javabang.service;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;
import java.util.Scanner;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.javabang.component.HashComponent;
import com.javabang.mail.MailComponent;
import com.javabang.model.MemberDTO;
import com.javabang.repository.MemberDAO;

import org.springframework.core.io.Resource;

@Service
public class MemberService {
	@Autowired private MemberDAO mdao;
	@Autowired private HashComponent hcomponent;
	@Autowired private MailComponent mcomponent;
	
	@Value("classpath:resetPassword.html")
	private Resource html;
	
	Random ran = new Random();

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

	// 비밀번호 재설정
	public int reset(MemberDTO dto) throws FileNotFoundException, IOException{
		String userPw = (ran.nextInt(999999)+100000) + "";
		int row = mdao.reset(dto);
		while(row != 0)
		{
			String content = "";
			Scanner sc = new Scanner(html.getFile());
			while(sc.hasNextLine())
			{
				content += sc.nextLine();
			}
			sc.close();
			
			content = String.format(content, userPw);
			mcomponent.sendMail(dto.getEmail(), content);
		}
		return row;
	}

	// 회원정보 수정 목록 하나만 불러오기
	public MemberDTO selectOne(int idx) {
		return mdao.selectOne(idx);
	}

	// 회원정보수정
	public int update(MemberDTO dto)  {

		return mdao.update(dto);
	}

	// 회원탈퇴(삭제)
	public int delete(int idx) {
		return mdao.delete(idx);
	}

	// 비밀번호 재설정 이메일 받기
	public String getEmail(MemberDTO dto) {
		
		return mdao.getMail(dto);
	}

	public MemberDTO userCheck(MemberDTO dto) {
		return mdao.userCheck(dto);
	}

	public int updatePw(MemberDTO tmp) {
		return mdao.updatePw(tmp);
	}

	public int modifyPassword(MemberDTO dto) throws NoSuchAlgorithmException {
		String userPw = dto.getUserPw();
		userPw = hcomponent.getHash(userPw);
		dto.setUserPw(userPw);
		return mdao.updatePw(dto);
	}
}
