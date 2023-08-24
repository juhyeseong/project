package com.javabang.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javabang.model.ReviewDTO;
import com.javabang.repository.ReviewDAO;

@Service
public class ReviewService {
	@Autowired ReviewDAO rdao;

	public List<ReviewDTO> review(int idx) {
	
		return rdao.review(idx);
	}

}
