package com.javabang.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javabang.model.PagingDTO;
import com.javabang.model.RentDTO;
import com.javabang.model.ReportDTO;
import com.javabang.model.ReservationDTO;
import com.javabang.model.ReviewReportDTO;
import com.javabang.repository.AdminDAO;

@Service
public class AdminService {
	@Autowired private AdminDAO adminDAO;

	public List<RentDTO> selectAllRoom(PagingDTO paging) {
		List<RentDTO> list = adminDAO.selectAllRoom(paging);

		for(RentDTO dto : list) {
			if(dto.getTitle().length() >= 10) {
				String titleSh = dto.getTitle().substring(0, 10);
				titleSh += "...";
			
				dto.setTitle(titleSh);
			}
			if(dto.getDetailAddress().length() >= 13) {
				String addressSh = dto.getDetailAddress().substring(0,13);
				addressSh += "...";
				
				dto.setDetailAddress(addressSh);
			}
		}
		return list;
	}
	
	public void permitAccomodation(int idx) {
		adminDAO.permitAccomodation(idx);
	}

	public void cencelAccomodation(int idx) {
		adminDAO.cencelAccomodation(idx);
	}

	public int selectCount() {
		return adminDAO.selectCount();
	}

	public List<ReservationDTO> selectAllReservation() {
		List<ReservationDTO> list = adminDAO.selectAllReservation();
		
		for(ReservationDTO dto : list) {
			if(dto.getTitle().length() >= 10) {
				String titleSh = dto.getTitle().substring(0, 10);
				titleSh += "...";

				dto.setTitle(titleSh);
			}
		}
		return list;
	}

	public List<ReservationDTO> selectAllReservation(String search) {
		List<ReservationDTO> list = adminDAO.selectAllReservationSearch(search);
		
		for(ReservationDTO dto : list) {
			if(dto.getTitle().length() >= 10) {
				String titleSh = dto.getTitle().substring(0, 10);
				titleSh += "...";

				dto.setTitle(titleSh);
			}
		}
		return list;
	}

	public int insertReport(ReportDTO dto) {
		return adminDAO.insertReport(dto);
	}

	public List<ReportDTO> selectAllReport() {
		List<ReportDTO> list = adminDAO.selectAllReport();
		
		for(ReportDTO dto : list) {
			if(dto.getTitle().length() >= 20) {
				String titleSh = dto.getTitle().substring(0, 20);
				titleSh += "...";

				dto.setTitle(titleSh);
			}
		}
		return list;
	}

	public List<ReportDTO> selectAllReport(String search) {
		List<ReportDTO> list = adminDAO.selectAllReportSearch(search);
		
		for(ReportDTO dto : list) {
			if(dto.getTitle().length() >= 20) {
				String titleSh = dto.getTitle().substring(0, 20);
				titleSh += "...";

				dto.setTitle(titleSh);
			}
		}
		return list;
	}

	public int insertReviewReport(ReviewReportDTO dto) {
		return adminDAO.insertReviewReport(dto);
	}

	public List<ReviewReportDTO> selectAllReviewReport() {
		return adminDAO.selectAllReviewReport();
	}

	public List<ReviewReportDTO> selectAllReviewReport(String search) {
		return adminDAO.selectAllReviewReportSearch(search);
	}
}