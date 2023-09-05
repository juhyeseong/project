package com.javabang.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javabang.model.ReportDTO;
import com.javabang.model.ReservationDTO;
import com.javabang.model.ReviewDTO;
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
		
		ReportDTO dto = reportDAO.selectOneReport(idx);
		
		if (dto.getTitle().length() >= 40) {
			String titleSh = dto.getTitle().substring(0, 40);
			titleSh += "...";
			System.out.println("titleSh : " + titleSh);
			dto.setTitle(titleSh);
		}
		
		return dto;
	}

	public ReviewReportDTO selectOneReviewReport(int idx) {
		return reportDAO.selectOneReviewReport(idx);
	}

	public int updateBlock(int reviewIdx) {
		return reportDAO.updateBlock(reviewIdx);
	}
	
	

}
