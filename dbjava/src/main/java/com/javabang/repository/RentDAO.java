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
	
	public List<RentDTO> selectHost(int member);

	public List<String> selectFilePath(int idx);
	
	public int updateRentTitle(RentDTO dto);
	
	public int updateRentContent(RentDTO dto);

	public int updateRentPrice(RentDTO dto);

	public int updateRentCountMinus(RentDTO dto);

	public int updateRentCountPlus(RentDTO dto);

	public int updateRentFile(HashMap<String, Object> map);

	public int deleteRentFile(HashMap<String, String> filePath);
}
