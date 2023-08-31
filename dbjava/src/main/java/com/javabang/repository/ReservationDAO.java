package com.javabang.repository;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.javabang.model.ReservationDTO;

@Repository
public interface ReservationDAO {

	int insertReservation(ReservationDTO dto);
	
	List<ReservationDTO> selectReservation(int rent);
	
	List<ReservationDTO> selectReservationDate(int rent);

}
