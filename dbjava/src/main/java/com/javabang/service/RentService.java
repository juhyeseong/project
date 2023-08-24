package com.javabang.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javabang.model.RentDTO;
import com.javabang.repository.RentDAO;

@Service
public class RentService {
	@Autowired private RentDAO rdao;

	public int rentInsert(RentDTO dto) {
		int row = 0;
		
		row += rdao.rentInsert(dto);
		
		return row;
	}

}
