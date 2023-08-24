package com.javabang.repository;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.javabang.model.RentDTO;

@Repository
public interface RentDAO {
	public int rentInsert(RentDTO dto);

	public List<RentDTO> selectAll();

	public RentDTO selectOne(int idx);
}
