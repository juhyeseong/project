package com.javabang.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javabang.repository.ReportDAO;

@Service
public class ReportService {
	
	@Autowired private ReportDAO reportDAO;

	public int usedCount(int rentIdx, int memberIdx) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		
		map.put("rentIdx", rentIdx);
		map.put("memberIdx", memberIdx);
		return reportDAO.usedCount(map);
	}
	
	

}
