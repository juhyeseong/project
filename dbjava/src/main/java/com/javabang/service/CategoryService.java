package com.javabang.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javabang.model.RentDTO;
import com.javabang.repository.CategoryDAO;

@Service
public class CategoryService {
	@Autowired CategoryDAO categoryDAO;

	public List<RentDTO> filterHotel(String category) {
		
		return categoryDAO.filterHotel(category);
	}
	
}
