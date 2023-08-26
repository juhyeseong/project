package com.javabang.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javabang.model.ReviewDTO;
import com.javabang.repository.ReviewDAO;

@Service
public class ReviewService {
	@Autowired ReviewDAO reviewDao;

	public List<ReviewDTO> review(int idx) {
	
		return reviewDao.review(idx);
	}

	public int insertReview(int rentIdx, int memberIdx, ReviewDTO review) {
		
		HashMap<String, String> map = new HashMap<String, String>();
		
		  // rentIdx와 memberIdx를 HashMap에 추가
		map.put("rentIdx", String.valueOf(rentIdx));
		map.put("memberIdx", String.valueOf(memberIdx));
		// review 내용을 HashMap에 추가
		map.put("content", review.getContent());
		map.put("point", String.valueOf(review.getPoint()));
		
		return reviewDao.insertReview(map);
	}

}
