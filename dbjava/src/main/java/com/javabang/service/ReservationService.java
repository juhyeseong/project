package com.javabang.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javabang.model.RentDTO;
import com.javabang.model.ReservationDTO;
import com.javabang.repository.ReservationDAO;

@Service
public class ReservationService {
	
	@Autowired private ReservationDAO reservationDAO;
	
	public int insertReservation(ReservationDTO dto) {
		int row = 0;
		String sDateString = dto.getsDateString().replaceAll(". ", "-");
		String eDateString = dto.geteDateString().replaceAll(". ", "-");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		try {
			Date startUtilDate = sdf.parse(sDateString);
			Date endUtilDate = sdf.parse(eDateString);
			java.sql.Date startSqlDate = new java.sql.Date(startUtilDate.getTime());
			java.sql.Date endSqlDate = new java.sql.Date(endUtilDate.getTime());
			
			dto.setStartDate(startSqlDate);
			dto.setEndDate(endSqlDate);
			row += reservationDAO.insertReservation(dto);
		} catch (ParseException e) {
			e.printStackTrace();
		}
	
		return row;
	}
	
	public List<ReservationDTO> selectReservation(int rent) {
	      List<ReservationDTO> list = reservationDAO.selectReservation(rent);
	      
	      for(ReservationDTO dto : list) {
	    	  String title = dto.getTitle();
	    	  
	    	  if(title.length() > 20) {
	    		  dto.setTitle(title.substring(0, 20)+"...");
	    	  }
	      }
	      
	      return list;
	}

	public List<ReservationDTO> selectReservationDate(int rent) {
	      return reservationDAO.selectReservationDate(rent);
	}

	public RentDTO selectOneRent(int idx) {
		return reservationDAO.selectOneRent(idx);
	}
	
	public List<ReservationDTO> selectReservationList(int member) {
		return reservationDAO.selectReservationList(member);
	}

	public int deleteReservation(int reservationIdx) {
		return reservationDAO.deleteReservation(reservationIdx);
	}
}
