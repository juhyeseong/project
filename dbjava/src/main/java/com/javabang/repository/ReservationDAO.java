package com.javabang.repository;

import org.springframework.stereotype.Repository;

import com.javabang.model.ReservationDTO;

@Repository
public interface ReservationDAO {

	int insertReservation(ReservationDTO dto);
	
}
