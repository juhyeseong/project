package com.javabang.repository;

import org.springframework.stereotype.Repository;

import com.javabang.model.RentDTO;

@Repository
public interface RentDAO {
	public int rentInsert(RentDTO dto);
}
