package com.javabang.service;

import java.io.File;
import java.io.FileInputStream;
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
import org.springframework.web.multipart.MultipartFile;

import com.javabang.component.HashComponent;
import com.javabang.mail.MailComponent;
import com.javabang.model.MemberDTO;
import com.javabang.repository.MemberDAO;
import com.jcraft.jsch.Channel;
import com.jcraft.jsch.ChannelSftp;
import com.jcraft.jsch.JSch;
import com.jcraft.jsch.JSchException;
import com.jcraft.jsch.Session;

import org.springframework.core.io.Resource;

@Service
public class MemberService {
	@Autowired private MemberDAO mdao;
	@Autowired private HashComponent hcomponent;
	@Autowired private MailComponent mcomponent;
	
	
	private String serverIp = "192.168.64.200";
	private int serverPort = 22;
	private String serverUser = "root";
	private String serverPass = "1";
	private ChannelSftp chSftp = null;

	

	
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
			mcomponent.sendMailPw(dto.getEmail(), content);
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

	public int dupCheck(String userId) {
		
		return mdao.selectCount(userId);
	}

	public int sendAuthNumber(String email) throws IOException {
		String content = "<h3>인증번호는 [%s]입니다.</h3>";
		int authNumber = ran.nextInt(89999999) + 10000000;
		content = String.format(content, authNumber);
		int row = mcomponent.sendMailAuth(email, content);
		return row > 0 ? authNumber : row;
	}


	//프로필 사진 수정
	public int updateProfile(MemberDTO dto) throws Exception {

		MultipartFile f = dto.getUpload();
		File dest = new File(f.getOriginalFilename());
		f.transferTo(dest);
		
		
		Session sess = null;
		Channel channel = null;
		JSch jsch = new JSch();
		
		sess = jsch.getSession(serverUser, serverIp, serverPort);
		sess.setPassword(serverPass);
		sess.setConfig("StrictHostKeyChecking", "no");
		sess.connect();
		
		System.out.println("sftp> connected");
		
		channel = sess.openChannel("sftp");	
		channel.connect();
		
		chSftp = (ChannelSftp) channel;
		
		FileInputStream fis = new FileInputStream(dest);
		chSftp.cd("/var/www/html");		
		chSftp.put(fis, dest.getName());	
		System.out.println("sftp> transfer complete");
		
		fis.close();
		chSftp.isClosed();
		
		String filePath = "";	
		filePath += "http://";
		filePath += serverIp;
		filePath += "/" + dest.getName();
		
		dto.setProfile(filePath);
		

		dest.delete();
		
		return mdao.updateProfile(dto);

		}

	public int basicProfile(MemberDTO dto) throws Exception {
		

		    return mdao.basicProfile(dto);
		
		
		
	}

//	public int kakao(String id, String email, String name) {
//	    MemberDTO dto = new MemberDTO();
//	    dto.setUserId(id);
//	    dto.setEmail(email);
//	    dto.setUserNick(name);
//		return mdao.kakao(dto);
//	}



	public MemberDTO selectKakao(MemberDTO dto) {
	
		return mdao.selectKakao(dto);
	}

	public int insertKakao(MemberDTO dto) {
		
		return mdao.insertKakao(dto);
	}
}
		
		
		
		

		
	

