package com.javabang.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javabang.model.PagingDTO;
import com.javabang.model.RentDTO;
import com.javabang.model.ReservationDTO;
import com.javabang.repository.AdminDAO;

@Service
public class AdminService {

	@Autowired private AdminDAO adminDAO;

	public List<RentDTO> selectAllRoom(PagingDTO paging) {
		return adminDAO.selectAllRoom(paging);
	}
	
	public void permitAccomodation(int idx) {
		adminDAO.permitAccomodation(idx);
	}

	public void cencelAccomodation(int idx) {
		adminDAO.cencelAccomodation(idx);
	}

	public int selectCount() {
		return adminDAO.selectCount();
	}

	public List<ReservationDTO> selectAllReservation() {
		return adminDAO.selectAllReservation();
	}

	public List<ReservationDTO> selectAllReservation(String search) {
		return adminDAO.selectAllReservationSearch(search);
	}
}
