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

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.javabang.model.CancelPayDTO;
import com.javabang.model.MemberDTO;
import com.javabang.model.RentDTO;
import com.javabang.model.ReportDTO;
import com.javabang.model.ReservationDTO;
import com.javabang.model.ReviewReportDTO;
import com.javabang.model.WishListDTO;
import com.javabang.service.MemberService;
import com.javabang.service.RentService;
import com.javabang.service.ReportService;
import com.javabang.service.ReservationService;
import com.javabang.service.ReviewService;
import com.javabang.service.WishListService;


@RestController
public class AjaxController {
	@Autowired private MemberService memberService;
	@Autowired private RentService rentService;
	@Autowired private ReviewService reviewService; 
	@Autowired private ReportService reportService;
	@Autowired private ReservationService reservationService;
	@Autowired private WishListService wishListService;
	
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
        	
            reviewService.deleteReview(reviewId, tmp.getIdx());
            return ResponseEntity.ok("Review deleted successfully.");
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Failed to delete review.");
        }
    }
    
    @PostMapping("/insertReservation")
    public int insertReservation(@RequestBody ReservationDTO dto) {
      System.out.println(dto.getMerchant_uid());
      int row = reservationService.insertReservation(dto);
      
      return row;
    }
    
    @GetMapping("/getToken")
    public String getToken() {
    	try {
			URL address = new URL("https://api.iamport.kr/users/getToken");
			HttpURLConnection conn = (HttpURLConnection)address.openConnection();
			
			conn.setRequestMethod("POST");
			conn.setRequestProperty("Content-type", "application/json;charset=utf-8");
			conn.setDoOutput(true);
			
			JSONObject parameter = new JSONObject();
			parameter.put("imp_key", "8530611174254580");
			parameter.put("imp_secret", "hTbpc9aZp7XTjcf0UjzBHbHaDo1BrDrv7oL3xSxofuOp8ZUSnTftZYz94JYCfCjfFKyiRT9muytuIXGD");
			OutputStream os = conn.getOutputStream();
			DataOutputStream outputData = new DataOutputStream(os);
			
			outputData.writeBytes(parameter.toString());
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
			
			String ref = bReader.readLine();
			
			return ref;
    	} catch (IOException e) {
			e.printStackTrace();
		}
    	
    	return "";
    }
    
    @PostMapping("/cancelPay")
    public int cancelPay(@RequestBody CancelPayDTO dto) {
		int row = 0;
		
    	try {
			URL address = new URL("https://api.iamport.kr/payments/cancel");
			HttpURLConnection conn = (HttpURLConnection)address.openConnection();
			
			conn.setRequestMethod("POST");
			conn.setRequestProperty("Content-Type", "application/json;charset=utf-8");
			conn.setRequestProperty("Authorization", dto.getAccess_token());
			conn.setDoOutput(true);

			JSONObject parameter = new JSONObject();
			parameter.put("merchant_uid", dto.getMerchant_uid());
			parameter.put("amount", dto.getCancel_request_amount());
			OutputStream os = conn.getOutputStream();
			DataOutputStream outputData = new DataOutputStream(os);
			
			outputData.writeBytes(parameter.toString());
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
			String ref = bReader.readLine();
			ObjectMapper mapper = new ObjectMapper();
			JsonNode element = mapper.readTree(ref);
			int code = Integer.parseInt(element.get("code").toString());
			
			if(code == 0) {
				row += reservationService.deleteReservation(dto.getReservationIdx());
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return row;
    }
    
    @GetMapping("/reservation/selectGuestCount/{idx}")
    public int selectGuestCount(@PathVariable("idx") int idx) {
       int guestCount = rentService.selectGuestCount(idx);
       
        return guestCount;
    }
    
    // report의 개별 정보를 불러오는 메서드
    @GetMapping("/admin/reportOne/{idx}")
    public ReportDTO reportOne(@PathVariable("idx") int idx) {
    	ReportDTO dto = reportService.selectOneReport(idx);
    	
    	return dto;
    }
    
    // reviewReport의 개별 정보를 불러오는 메서드
    @GetMapping("/admin/reviewReportOne/{idx}")
    public ReviewReportDTO reviewReportOne(@PathVariable("idx") int idx) {
    	ReviewReportDTO dto = reportService.selectOneReviewReport(idx);
    	
    	return dto;
    }
    
    @PostMapping("/wishList/createWishList")
	public void createWishList(@RequestBody WishListDTO dto) {
		wishListService.createWishList(dto);
	}
	
	@PostMapping("/wishList/deleteWishList")
	public void deleteWishList(@RequestBody WishListDTO dto) {
		wishListService.deleteWishList(dto);
	}
	
	@GetMapping("/rent/restMode/{idx}")
	public void restMode(@PathVariable("idx") int idx) {
		rentService.restMode(idx);
	}
	
	@GetMapping("/rent/operateMode/{idx}")
	public void operateMode(@PathVariable("idx") int idx) {
		rentService.operateMode(idx);
	}
	
	// review를 블락하기 위한 메서드
	@PostMapping("/admin/blockReview/{idx}")
	public int blockReview(@PathVariable("idx") int idx) {
		int row = reportService.updateBlock(idx);
		
		return row;
	}
	// review 블락을 해제하기 위한 메서드
	@PostMapping("/admin/reverseBlock/{idx}")
	public int reverseBlock(@PathVariable("idx") int idx) {
		int row = reportService.reverseBlock(idx);
		
		return row;
	}
}
