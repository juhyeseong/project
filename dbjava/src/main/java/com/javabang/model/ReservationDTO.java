package com.javabang.model;

import java.sql.Date;

public class ReservationDTO {
   private int idx, member, rent, guestCount, state, totalPrice;
   private String sDateString, eDateString, userName, phoneNum, title, merchant_uid;
   private Date startDate, endDate;
   
   /* admin의 reservation에서 들고 오기위한 필드 */
   private String roomType;
   private String userId;
   
   public int getIdx() {
      return idx;
   }
   public void setIdx(int idx) {
      this.idx = idx;
   }
   public int getMember() {
      return member;
   }
   public void setMember(int member) {
      this.member = member;
   }
   public int getRent() {
      return rent;
   }
   public void setRent(int rent) {
      this.rent = rent;
   }
   public int getGuestCount() {
      return guestCount;
   }
   public void setGuestCount(int guestCount) {
      this.guestCount = guestCount;
   }
   public int getState() {
      return state;
   }
   public void setState(int state) {
      this.state = state;
   }
   public int getTotalPrice() {
      return totalPrice;
   }
   public void setTotalPrice(int totalPrice) {
      this.totalPrice = totalPrice;
   }
   public String getsDateString() {
      return sDateString;
   }
   public void setsDateString(String sDateString) {
      this.sDateString = sDateString;
   }
   public String geteDateString() {
      return eDateString;
   }
   public void seteDateString(String eDateString) {
      this.eDateString = eDateString;
   }
   public Date getStartDate() {
      return startDate;
   }
   public void setStartDate(Date startDate) {
      this.startDate = startDate;
   }
   public Date getEndDate() {
      return endDate;
   }
   public void setEndDate(Date endDate) {
      this.endDate = endDate;
   }
   public String getUserName() {
      return userName;
   }
   public void setUserName(String userName) {
      this.userName = userName;
   }
   public String getPhoneNum() {
      return phoneNum;
   }
   public void setPhoneNum(String phoneNum) {
      this.phoneNum = phoneNum;
   }
   public String getTitle() {
      return title;
   }
   public void setTitle(String title) {
      this.title = title;
   }
	public String getRoomType() {
		return roomType;
	}
	public void setRoomType(String roomType) {
		this.roomType = roomType;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getMerchant_uid() {
		return merchant_uid;
	}
	public void setMerchant_uid(String merchant_uid) {
		this.merchant_uid = merchant_uid;
	}
}
