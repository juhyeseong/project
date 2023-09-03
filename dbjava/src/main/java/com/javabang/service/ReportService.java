package com.javabang.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javabang.model.ReportDTO;
import com.javabang.model.ReservationDTO;
import com.javabang.model.ReviewReportDTO;
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

	public ReportDTO selectOneReport(int idx) {
		return reportDAO.selectOneReport(idx);
	}

	public ReviewReportDTO selectOneReviewReport(int idx) {
		return reportDAO.selectOneReviewReport(idx);
	}
	
	

}
