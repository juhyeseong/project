package com.javabang.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.javabang.model.ReviewDTO;
import com.javabang.repository.ReviewDAO;
import com.jcraft.jsch.Channel;
import com.jcraft.jsch.ChannelSftp;
import com.jcraft.jsch.JSch;
import com.jcraft.jsch.JSchException;
import com.jcraft.jsch.Session;
import com.jcraft.jsch.SftpException;

@Service
public class ReviewService {
	@Autowired
	ReviewDAO reviewDao;
	
	private String serverIp = "192.168.64.200";
	private int serverPort = 22;
	private String serverUser = "root";
	private String serverPass = "1";
	private ChannelSftp chSftp = null;

	public List<ReviewDTO> review(int idx) {

		return reviewDao.review(idx);
	}

	
	public int insertReview(int rentIdx, int memberIdx, ReviewDTO review) {
		int row = 0;

		HashMap<String, String> map = new HashMap<String, String>();
		
		for(MultipartFile file : review.getUpload()) {
			String ymd = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
			String fileName = file.getOriginalFilename();
			fileName = fileName.substring(0, fileName.lastIndexOf("."));
			String ext = file.getContentType().substring(file.getContentType().indexOf("/") + 1);
			File dest = new File(ymd + "_" + fileName + "." + ext);
			try {
				file.transferTo(dest);
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
			Session session = null;
			Channel channel = null;
			JSch jsch = new JSch();
			
			try {
				session = jsch.getSession(serverUser, serverIp, serverPort);
				session.setPassword(serverPass);
				session.setConfig("StrictHostKeyChecking", "no");
				session.connect();
				
				channel = session.openChannel("sftp");
				channel.connect();
				
				chSftp = (ChannelSftp)channel;
	
				FileInputStream fis = new FileInputStream(dest);
				
				chSftp.cd("/var/www/html");
				chSftp.put(fis, dest.getName());
				
				fis.close();
				chSftp.isClosed();
				
				HashMap<String, Object> map2 = new HashMap<>();
				String filePath = "http://192.168.64.200/" + dest.getName();
				System.out.println("review.IDX : " + review.getIdx());
				map2.put("review", review.getIdx());
				map2.put("filePath", filePath);
				
				row += reviewDao.fileInsert(map2);
			} catch (JSchException | SftpException | IOException e) {
				e.printStackTrace();
			}
		}
		
		

		
		/*
		 * //리뷰 글 파일 사진 업로드 처리 for(MultipartFile file: review.getUpload()) {
		 * if(!file.isEmpty()) { String uploadDirectory = "http://192.168.64.200/";
		 * String uploadDirectory = "/var/www"; //서버의 로컬 파일 시스템에 리뷰 사진을 저장 String
		 * fileName = file.getOriginalFilename(); String filePath = fileName +
		 * uploadDirectory;
		 * 
		 * try { file.transferTo(new File(filePath)); } catch (IllegalStateException |
		 * IOException e) { // TODO Auto-generated catch block e.printStackTrace(); } }
		 * }
		 */

		// rentIdx와 memberIdx를 HashMap에 추가
		map.put("rentIdx", String.valueOf(rentIdx));
		map.put("memberIdx", String.valueOf(memberIdx));
		// review 내용을 HashMap에 추가
		map.put("content", review.getContent());
		map.put("point", String.valueOf(review.getPoint()));

		return reviewDao.insertReview(map);
	}

}
