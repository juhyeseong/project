package com.javabang.model;

import java.sql.Date;

public class ReservationDTO {
	private int idx, member, rent, guestCount, state, totalPrice;
	private String sDateString, eDateString;
	private Date startDate, endDate;
	
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
}
