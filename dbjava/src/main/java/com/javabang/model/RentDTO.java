package com.javabang.model;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class RentDTO {
   private int idx, member;
   private String category, roomType, address, detailAddress, information, title, content, contactNum;
   private int roomCount, guestCount, bedCount, bathCount, price, discount, state, wishCount;
   
   private List<String> filePathList;
   private String filePath;
   private List<MultipartFile> files;
   
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
   public String getCategory() {
      return category;
   }
   public void setCategory(String category) {
      this.category = category;
   }
   public String getRoomType() {
      return roomType;
   }
   public void setRoomType(String roomType) {
      this.roomType = roomType;
   }
   public String getAddress() {
      return address;
   }
   public void setAddress(String address) {
      this.address = address;
   }
   public String getDetailAddress() {
      return detailAddress;
   }
   public void setDetailAddress(String detailAddress) {
      this.detailAddress = detailAddress;
   }
   public String getInformation() {
      return information;
   }
   public void setInformation(String information) {
      this.information = information;
   }
   public String getTitle() {
      return title;
   }
   public void setTitle(String title) {
      this.title = title;
   }
   public String getContent() {
      return content;
   }
   public void setContent(String content) {
      this.content = content;
   }
   public int getRoomCount() {
      return roomCount;
   }
   public void setRoomCount(int roomCount) {
      this.roomCount = roomCount;
   }
   public int getGuestCount() {
      return guestCount;
   }
   public void setGuestCount(int guestCount) {
      this.guestCount = guestCount;
   }
   public int getBedCount() {
      return bedCount;
   }
   public void setBedCount(int bedCount) {
      this.bedCount = bedCount;
   }
   public int getBathCount() {
      return bathCount;
   }
   public void setBathCount(int bathCount) {
      this.bathCount = bathCount;
   }
   public int getPrice() {
      return price;
   }
   public void setPrice(int price) {
      this.price = price;
   }
   public int getDiscount() {
      return discount;
   }
   public void setDiscount(int discount) {
      this.discount = discount;
   }
   public int getState() {
      return state;
   }
   public void setState(int state) {
      this.state = state;
   }
   public List<String> getFilePathList() {
      return filePathList;
   }
   public void setFilePathList(List<String> filePathList) {
      this.filePathList = filePathList;
   }
   public String getFilePath() {
      return filePath;
   }
   public void setFilePath(String filePath) {
      this.filePath = filePath;
   }
   public List<MultipartFile> getFiles() {
      return files;
   }
   public void setFiles(List<MultipartFile> files) {
      this.files = files;
   }
   public String getContactNum() {
      return contactNum;
   }
   public void setContactNum(String contactNum) {
      this.contactNum = contactNum;
   }
	public int getWishCount() {
		return wishCount;
	}
	public void setWishCount(int wishCount) {
		this.wishCount = wishCount;
	}
}