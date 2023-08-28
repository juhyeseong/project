package com.javabang.repository;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.javabang.model.ReviewDTO;


@Repository
public interface ReviewDAO {

	List<ReviewDTO> reviewSelectAll(int idx);

	int insertReview(ReviewDTO review);

	int fileInsert(HashMap<String, Object> map);

	List<String> reviewFileSelectAll(int review);

	List<ReviewDTO> selectReview(HashMap<String, String> map);

	int selectIdx();




}
