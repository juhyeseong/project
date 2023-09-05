package com.javabang.model;

public class ReviewReportDTO {
	
	private int idx, member, review;
	private String content, reportType;
	
	/* selectAllReviewReport를 하기위한 필드 */
	private String userName, userId, reviewContent, reviewWriterId, reviewWriterName;
	
	/* selectOneReviewReport를 하기위한 필드 */
	private int reviewIdx;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getReviewContent() {
		return reviewContent;
	}
	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}
	public String getReviewWriterId() {
		return reviewWriterId;
	}
	public void setReviewWriterId(String reviewWriterId) {
		this.reviewWriterId = reviewWriterId;
	}
	public String getReviewWriterName() {
		return reviewWriterName;
	}
	public void setReviewWriterName(String reviewWriterName) {
		this.reviewWriterName = reviewWriterName;
	}
	public int getMember() {
		return member;
	}
	public void setMember(int member) {
		this.member = member;
	}
	public int getReview() {
		return review;
	}
	public void setReview(int review) {
		this.review = review;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getReportType() {
		return reportType;
	}
	public void setReportType(String reportType) {
		this.reportType = reportType;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getReviewIdx() {
		return reviewIdx;
	}
	public void setReviewIdx(int reviewIdx) {
		this.reviewIdx = reviewIdx;
	}
	
	

}
