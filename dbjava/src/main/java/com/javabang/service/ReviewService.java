package com.javabang.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
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
	ReviewDAO reviewDAO;
	
	private String serverIp = "192.168.64.200";
	private int serverPort = 22;
	private String serverUser = "root";
	private String serverPass = "1";
	private ChannelSftp chSftp = null;

	public List<ReviewDTO> reviewSelectAll(int idx) {
		List<ReviewDTO> list = reviewDAO.reviewSelectAll(idx);

		list.forEach(review -> {
			review.setFilePathList(reviewDAO.reviewFileSelectAll(review.getIdx()));
		});
		
		return list;
	}

	
	public int insertReview(ReviewDTO review) {
		int row = 0;

		row += reviewDAO.insertReview(review);
		review.setIdx(reviewDAO.selectIdx());
		
		for(MultipartFile file : review.getUpload()) {
			String ymd = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
			String fileName = UUID.randomUUID().toString();
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
				
				HashMap<String, Object> map = new HashMap<>();
				String filePath = "http://192.168.64.200/" + dest.getName();
				System.out.println("review.IDX : " + review.getIdx());
				map.put("review", review.getIdx());
				map.put("filePath", filePath);
				
				System.out.println("review : " + map.get("review"));
				System.out.println("filePath : " + map.get("filePath"));
				
				row += reviewDAO.fileInsert(map);
			} catch (JSchException | SftpException | IOException e) {
				e.printStackTrace();
			}
		}
		return row;
	}


	public void deleteReview(int reviewIdx, int memberIdx) {
		
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		
		map.put("reviewIdx", reviewIdx);
		map.put("memberIdx", memberIdx);
		
		reviewDAO.deleteReview(map);
		
	}

}
