package com.javabang.controller;
import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.javabang.model.MemberDTO;
import com.javabang.model.RentDTO;
import com.javabang.model.ReportDTO;
import com.javabang.model.ReservationDTO;
import com.javabang.model.ReviewReportDTO;
import com.javabang.service.MemberService;
import com.javabang.service.RentService;
import com.javabang.service.ReportService;
import com.javabang.service.ReviewService;


@RestController
public class AjaxController {
	@Autowired private MemberService memberService;
	@Autowired private RentService rentService;
	@Autowired private ReviewService reviewService; 
	@Autowired private ReportService reportService;


	@GetMapping("/getmail/{email}")
	public HashMap<String, Object> getEmail(@RequestBody MemberDTO dto){
		String email = memberService.getEmail(dto);
		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("email", email);
		result.put("status", email != null);
		return result;
	}
	@GetMapping("/dupCheck/{userId}/")
	public int dupCheck(@PathVariable("userId") String userId) {
		int row = memberService.dupCheck(userId);
		return row;
	}
	@GetMapping("/dupCheck2/{userNick}")
	public int dupCheck2(@PathVariable("userNick") String userNick) {
		int row = memberService.dupCheck2(userNick);
		return row;
	}
	
	@GetMapping("/sendAuthNumber/{email}/")
	public HashMap<String, Object> sendAuthNumber(@PathVariable("email") String email, HttpSession session) throws IOException {
		System.out.println("email : " + email);
		int row = memberService.sendAuthNumber(email);
		if(row != 0) {
			session.setAttribute("authNumber", row);
			session.setMaxInactiveInterval(180);
		}
		HashMap<String, Object> result = new HashMap<>();
		result.put("success", row > 0 ? 1 : 0);
		result.put("message", row > 0 ? "인증번호가 발송 되었습니다 !" : "인증번호 발송에 실패했습니다 !");
		return result;
	}
	
	@GetMapping("/checkAuthNumber/{authNumber}")
	public int checkAuthNumber(@PathVariable("authNumber") int authNumber, HttpSession session) {
		int sessionNumber = (int)session.getAttribute("authNumber");
		session.setMaxInactiveInterval(1800);
		return authNumber == sessionNumber ? 1 : 0;
	}

	@PostMapping("/rent/createRent")
	public HashMap<String, String> createRent(RentDTO dto) {
		HashMap<String, String> map = new HashMap<String, String>();
		int row = 0;
		String msg = null;
		String url = null;
		
		row = rentService.rentInsert(dto);
		msg = row != 0 ? "숙소 등록이 완료되었습니다 ~~ 관리자가 등록 수락할때까지 기다려주세요!! " : "숙소 등록에 실패하였습니다 ~~";
		url = row != 0 ? "/rent/rentManage" : "/rent/hosting";

		map.put("msg", msg);
		map.put("url", url);
		
		return map;
	} 
	
	@PostMapping("/rent/rentTitleUpdate")
	public int rentTitleUpdate(@RequestBody RentDTO dto) {
		int row = rentService.updateRentTitle(dto);
		
		return row;
	}
	
	@PostMapping("/rent/rentContentUpdate")
	public int rentContentUpdate(@RequestBody RentDTO dto) {
		int row = rentService.updateRentContent(dto);
		
		return row;
	}
	
	@PostMapping("/rent/rentPriceUpdate")
	public int rentPriceUpdate(@RequestBody RentDTO dto) {
		int row = rentService.updateRentPrice(dto);
		
		return row;
	}
	
	@PostMapping("/rent/rentCountUpdateMinus")
	public int rentCountUpdateMinus(@RequestBody RentDTO dto) {
		int row = rentService.updateRentCountMinus(dto);
		
		return row;
	}
	
	@PostMapping("/rent/rentCountUpdatePlus")
	public int rentCountUpdatePlus(@RequestBody RentDTO dto) {
		int row = rentService.updateRentCountPlus(dto);
		
		return row;
	}
	
	@PostMapping("/rent/rentFileInsert")
	public int rentFileInsert(RentDTO dto) {
		System.out.println(dto.getFiles().get(0).getOriginalFilename());
		System.out.println(dto.getIdx());
		int row = rentService.insertRentFile(dto);
		
		return row;
	}
	
	@PostMapping("/rent/rentDeleteFile")
	public int rentDeleteFile(@RequestBody HashMap<String, String> filePath) {
		int row = rentService.deleteRentFile(filePath);
		
		return row;
	}
	// 리뷰 삭제 
    @DeleteMapping("review/delete/{reviewId}")
    @ResponseBody
    public ResponseEntity<String> deleteReview(@PathVariable("reviewId")int reviewId, HttpSession session) {
        try {
        	MemberDTO tmp = (MemberDTO) session.getAttribute("login");
        	
            // Call a service method to delete the review by its ID
            reviewService.deleteReview(reviewId, tmp.getIdx());
            return ResponseEntity.ok("Review deleted successfully.");
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Failed to delete review.");
        }
    }
    
    @PostMapping("/kakaopay")
	   public String kakaopay(@RequestBody ReservationDTO dto, HttpSession session) {
	      String error = "";
	      try {
	         System.out.println("kakaopay메서드실행"); 
	         URL address = new URL("https://kapi.kakao.com/v1/payment/ready");
	         HttpURLConnection conn = (HttpURLConnection)address.openConnection();
	         
	         conn.setRequestMethod("POST");
	         conn.setRequestProperty("Authorization", "KakaoAK ddcff91bf064995801a4097e87111b4a");
	         conn.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
	         conn.setDoOutput(true);
	         
	         String parameter = "cid=TC0ONETIME&partner_order_id=partner_order_id&partner_user_id=partner_user_id&item_name=예약&quantity=1&total_amount=1000&tax_free_amount=0&approval_url=http://localhost:8080/dbjava/reservation/insertReservation&fail_url=http://localhost:8080/dbjava/reservation/kakaopayFailed&cancel_url=http://localhost:8080/dbjava/rent/room/" + dto.getRent();
	         OutputStream os = conn.getOutputStream();
	         DataOutputStream outputData = new DataOutputStream(os);
	         
	         outputData.writeBytes(parameter);
	         outputData.close();
	                  
	         int result = conn.getResponseCode();
	         InputStream is;
	         if(result == 200) {
	            is = conn.getInputStream();
	         }
	         else {
	            is = conn.getErrorStream();
	         }
	         InputStreamReader reader = new InputStreamReader(is);
	         BufferedReader bReader = new BufferedReader(reader);

	         String ret = bReader.readLine();
	         System.out.println(ret);
	         
	         session.setAttribute("rent", dto.getRent());
	         session.setAttribute("member", dto.getMember());
	         session.setAttribute("sDateString", dto.getsDateString());
	         session.setAttribute("eDateString", dto.geteDateString());
	         session.setAttribute("guestCount", dto.getGuestCount());
	         session.setAttribute("totalPrice", dto.getTotalPrice());
	         
	         return ret;
	      } catch (IOException e) {
	         e.printStackTrace();
	         error = e.toString();
	      }
	      
	      return error;
	   }
    
    @GetMapping("/reservation/selectGuestCount/{idx}")
    public int selectGuestCount(@PathVariable("idx") int idx) {
       System.out.println("idx : " + idx);
       int guestCount = rentService.selectGuestCount(idx);
       
        return guestCount;
    }
    
    // report의 개별 정보를 불러오는 메서드
    @GetMapping("/admin/reportOne/{idx}")
    public ReportDTO reportOne(@PathVariable("idx") int idx) {
    	ReportDTO dto = reportService.selectOneReport(idx);
    	System.out.println("dto.idx : " + dto.getIdx());
    	System.out.println("dto.reportType : " + dto.getReportType());
    	System.out.println("dto.content : " + dto.getContent());
    	return dto;
    }
    // reviewReport의 개별 정보를 불러오는 메서드
    @GetMapping("/admin/reviewReportOne/{idx}")
    public ReviewReportDTO reviewReportOne(@PathVariable("idx") int idx) {
    	ReviewReportDTO dto = reportService.selectOneReviewReport(idx);
    	System.out.println("dto.idx : " + dto.getIdx());
    	System.out.println("dto.reportType : " + dto.getReportType());
    	System.out.println("dto.content : " + dto.getContent());
    	return dto;
    }
}
