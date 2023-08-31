package com.javabang.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
			System.out.println(dto.getStartDate());
			System.out.println();
			System.out.println(dto.getEndDate());
			row += reservationDAO.insertReservation(dto);
		} catch (ParseException e) {
			e.printStackTrace();
		}
	
		return row;
	}
	
	public List<ReservationDTO> selectReservation(int rent) {
	      return reservationDAO.selectReservation(rent);
	}

	public List<ReservationDTO> selectReservationDate(int rent) {
	      return reservationDAO.selectReservationDate(rent);
	}
}
