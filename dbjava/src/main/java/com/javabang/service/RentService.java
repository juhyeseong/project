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
import org.springframework.web.multipart.MultipartFile;

import com.javabang.model.RentDTO;
import com.javabang.repository.RentDAO;
import com.jcraft.jsch.Channel;
import com.jcraft.jsch.ChannelSftp;
import com.jcraft.jsch.JSch;
import com.jcraft.jsch.JSchException;
import com.jcraft.jsch.Session;
import com.jcraft.jsch.SftpException;

@Service
public class RentService {
	@Autowired private RentDAO rdao;
	private String serverIp = "192.168.64.200";
	private int serverPort = 22;
	private String serverUser = "root";
	private String serverPass = "1";
	private ChannelSftp chSftp = null;

	public int rentInsert(RentDTO dto) {
		int row = 0;
		int idx = 0;
		
		row += rdao.rentInsert(dto);
		idx = rdao.getRentIdx();
		
		for(MultipartFile file : dto.getFiles()) {
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
				
				HashMap<String, Object> map = new HashMap<>();
				String filePath = "http://192.168.64.200/" + dest.getName();
				
				map.put("rent", idx);
				map.put("filePath", filePath);
				
				row += rdao.fileInsert(map);
			} catch (JSchException | SftpException | IOException e) {
				e.printStackTrace();
			}
		}
		
		return row;
	}

	
	public List<RentDTO> selectAll() {
		return rdao.selectAll();
	}


	public RentDTO selectOne(int idx) {
		
		return rdao.selectOne(idx);
	}

}
