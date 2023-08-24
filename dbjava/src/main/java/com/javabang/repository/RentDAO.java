package com.javabang.repository;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.javabang.model.RentDTO;

@Repository
public interface RentDAO {
	public int rentInsert(RentDTO dto);
	
	public int getRentIdx();

	public int fileInsert(HashMap<String, Object> map);

	public List<RentDTO> selectAll();

	public RentDTO selectOne(int idx);
}
