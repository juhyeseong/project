package com.javabang.repository;

import java.util.HashMap;

import org.springframework.stereotype.Repository;

import com.javabang.model.ReportDTO;
import com.javabang.model.ReservationDTO;
import com.javabang.model.ReviewDTO;
import com.javabang.model.ReviewReportDTO;

@Repository
public interface ReportDAO {

	int usedCount(HashMap<String, Integer> map);

	ReportDTO selectOneReport(int idx);

	ReviewReportDTO selectOneReviewReport(int idx);

	int updateBlock(int reviewIdx);

}
