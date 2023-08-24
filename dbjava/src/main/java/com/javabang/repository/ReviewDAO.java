package com.javabang.repository;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.javabang.model.ReviewDTO;

@Repository
public interface ReviewDAO {

	List<ReviewDTO> review(int idx);

}
