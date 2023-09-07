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

import com.javabang.model.RentDTO;
import com.javabang.model.RentExplainDTO;
import com.javabang.model.ReservationDTO;
import com.javabang.repository.RentDAO;
import com.javabang.repository.ReservationDAO;
import com.jcraft.jsch.Channel;
import com.jcraft.jsch.ChannelSftp;
import com.jcraft.jsch.JSch;
import com.jcraft.jsch.JSchException;
import com.jcraft.jsch.Session;
import com.jcraft.jsch.SftpException;

@Service
public class RentService {
	@Autowired private RentDAO rentDAO;
	@Autowired private ReservationDAO reservationDAO;
	
	private String serverIp = "192.168.64.200";
	private int serverPort = 22;
	private String serverUser = "root";
	private String serverPass = "1";
	private ChannelSftp chSftp = null;

	public int rentInsert(RentDTO dto) {
		int row = 0;
		int idx = 0;
		
		if(dto.getContactNum().contains("-") == false) {
	         String phoneNum = dto.getContactNum();
	         String hyphen = "";
	         
	         for(int i = 0; i < phoneNum.length(); i++) {
	            if(i == 2 || i == 6) {
	               hyphen += phoneNum.charAt(i) + "-";
	            }
	            else {
	               hyphen += phoneNum.charAt(i);
	            }
	         }
	         dto.setContactNum(hyphen);
	    }
		
		row += rentDAO.rentInsert(dto);
		idx = rentDAO.getRentIdx();
		
		for(MultipartFile file : dto.getFiles()) {
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
				
				map.put("rent", idx);
				map.put("filePath", filePath);
				
				row += rentDAO.fileInsert(map);
			} catch (JSchException | SftpException | IOException e) {
				e.printStackTrace();
			}
		}
		
		return row;
	}
	
	public List<RentDTO> selectAll() {
		return rentDAO.selectAll();
	}

	public RentDTO selectOne(int idx) {
		RentDTO dto = rentDAO.selectOne(idx);
		if(dto != null) {
			dto.setFilePathList(rentDAO.selectFilePath(idx));
		}
		
		return dto;
	}

	public List<RentDTO> selectHost(int member) {
		List<RentDTO> list = rentDAO.selectHost(member);
		
		if(list != null) {
			list.forEach(rent -> {
				String title = rent.getTitle();
				if(title.length() > 15) {
					rent.setTitle(title.substring(0, 16) + "...");;
				}
			});
		}
		
		return list;
	}
	
	public int updateRentTitle(RentDTO dto) {
		return rentDAO.updateRentTitle(dto);
	}
	
	public int updateRentContent(RentDTO dto) {
		return rentDAO.updateRentContent(dto);
	}
	
	public int updateRentPrice(RentDTO dto) {
		return rentDAO.updateRentPrice(dto);
	}

	public int updateRentCountMinus(RentDTO dto) {
		return rentDAO.updateRentCountMinus(dto);
	}

	public int updateRentCountPlus(RentDTO dto) {
		return rentDAO.updateRentCountPlus(dto);
	}

	public int insertRentFile(RentDTO dto) {
		int row = 0;
		
		for(MultipartFile file : dto.getFiles()) {
			System.out.println("for문 실행 !");
			String ymd = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
			String fileName = file.getOriginalFilename();
			fileName = UUID.randomUUID().toString();
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
				
				map.put("rent", dto.getIdx());
				map.put("filePath", filePath);
				System.out.println("rent : " + map.get("rent"));
				System.out.println("filePath : " + map.get("filePath"));
				
				row += rentDAO.fileInsert(map);
			} catch (JSchException | SftpException | IOException e) {
				e.printStackTrace();
			}
		};
		
		return row;
	}

	public int deleteRentFile(HashMap<String, String> filePath) {
		return rentDAO.deleteRentFile(filePath);
	}

	// 카테고리 - 펜션
	public List<RentDTO> filterPension(String category) {
		return rentDAO.filterPension(category);
	}

	// 카테고리 - 풀빌라
	public List<RentDTO> filterPoolVilla(String category) {
		
		return rentDAO.filterPoolVilla(category);
	}
	
	public int selectGuestCount(int idx) {
	    return rentDAO.selectGuestCount(idx);
	}
	
	public List<ReservationDTO> selectReservationDate(int rent) {
	    return reservationDAO.selectReservationDate(rent);
	}

	// 검색어 
	public List<RentDTO> search(String search) {
		return rentDAO.find(search);
	}

	public int deleteRent(int idx) {
		return rentDAO.deleteRent(idx);
	}

	public void restMode(int idx) {
		rentDAO.restMode(idx);
	}

	public void operateMode(int idx) {
		rentDAO.operateMode(idx);
	}

	public RentExplainDTO rentDetailOne(int idx) {
		return rentDAO.rentDetailOne(idx);
	}
}
