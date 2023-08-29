package com.javabang.repository;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.javabang.model.RentDTO;

@Repository
public interface CategoryDAO {

	// 카테고리 눌렀을 때 호텔만 뜨게 하기
	List<RentDTO> filterHotel(String category);

}
