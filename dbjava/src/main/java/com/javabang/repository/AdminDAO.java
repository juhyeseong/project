package com.javabang.repository;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.javabang.model.PagingDTO;
import com.javabang.model.RentDTO;
import com.javabang.model.ReportDTO;
import com.javabang.model.ReservationDTO;
import com.javabang.model.ReviewReportDTO;

@Repository
public interface AdminDAO {

	List<RentDTO> selectAllRoom(PagingDTO paging);

	void permitAccomodation(int idx);

	void cencelAccomodation(int idx);

	int selectCount();

	List<ReservationDTO> selectAllReservation();

	List<ReservationDTO> selectAllReservationSearch(String search);

	int insertReport(ReportDTO dto);

	List<ReportDTO> selectAllReport();

	List<ReportDTO> selectAllReportSearch(String search);

	int insertReviewReport(ReviewReportDTO dto);

	List<ReviewReportDTO> selectAllReviewReport();

	List<ReviewReportDTO> selectAllReviewReportSearch(String search);
}