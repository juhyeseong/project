package com.javabang.model;

public class CancelPayDTO {
	private int cancel_request_amount, reservationIdx;
	private String merchant_uid, access_token;
	
	public int getCancel_request_amount() {
		return cancel_request_amount;
	}
	public void setCancel_request_amount(int cancel_request_amount) {
		this.cancel_request_amount = cancel_request_amount;
	}
	public String getMerchant_uid() {
		return merchant_uid;
	}
	public void setMerchant_uid(String merchant_uid) {
		this.merchant_uid = merchant_uid;
	}
	public String getAccess_token() {
		return access_token;
	}
	public void setAccess_token(String access_token) {
		this.access_token = access_token;
	}
	public int getReservationIdx() {
		return reservationIdx;
	}
	public void setReservationIdx(int reservationIdx) {
		this.reservationIdx = reservationIdx;
	}
}
