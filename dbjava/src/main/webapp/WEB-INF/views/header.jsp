<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="cpath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자바방</title>
<style>
.title > a > img{
	height: 130px;
	width: 140px;
}
/*header */
.header{
	width: 1400px;
}

body {
	margin: 0px;

}
a{
	all: unset;
	cursor: pointer;
}
p{
    text-align:center;
}
.main {
	width: 100%;
	height: 80vh;
	
	display: flex;
	justify-content: center;
	align-items: center;
	
	overflow-y: scroll;
}

/* header style */
header {
    height: 100px;

	background-color: white;
    font-family: "굴림";
    font-weight: bold;
    
    display: flex;
    justify-content: center;
    align-items: center;
    
    border-bottom: 1px solid gray;
}
header button {
	all: unset;
	padding: 12px 15px;
	
	background-color: #f8215c;
	color: white;
	
	border-radius: 10px;
	font-size: 12px;
	font-weight: bold;
}
header > div {
	width: 1300px;
	
    display: flex;
    justify-content: space-between;
	align-items: center;
}
header img {
	width: 43px;
	height: 43px;
	
	border-radius: 50%;
}

.btn3 > button{
    all: unset;
    cursor: pointer;
    
    border: none;
    width: 500px;
    padding: 0; 
    
    text-align: right;
    font: inherit;
    background: none;
}
.search {
    width: 40px;
}
.host {
    list-style: none;
	padding: 0px;
    display: flex;
    align-items: center;
}
.host > li{    
	margin-left: 30px;

}

/*home css*/
.homeMain {
	width: 95%;
	height:100px;
	margin-left: auto;
	margin-right: auto;
}

.categories {
	display: flex;
	justify-content: space-around;
	align-items: center;
	padding: 20px 0px;
	border-bottom: 1px dashed; 
}

.categoryImg {
	width: 30px;
	height: 30px;
} 

.categorieImgBox {
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
}
.categorieImgBox > .filter {
	background-color : white;
	border : 2px solid black;
	border-radius : 10px;
	height:50px;
	width:60px;
	font-size:15px;
}
.roomBox{
	display: flex;
	flex-wrap: wrap;
}
.room{
	display: flex;
	flex-direction: column;
	margin:10px 40px;
	width:250px;
}
.roomImg{
	width:250px;
	height:250px;
	
}
/*room.jsp */
.menu2 > p{
      font-size: 25px;
}
.roomExplain{
	width:80%;
	margin-left:auto;
	margin-right:auto;
	display:flex;
}
.roomImgBox{
	flex: 1;
}
.roomBig > img{
	width:500px;
	height:350px;
}
.roomSmall{
	display:flex;
	justify-content:space-around;
	width:500px;
	
}
.roomSmall > img {
	cursor: pointer;

	width:120px;
	height:86px;
	margin:5px 10px;
}
.roomText{
	width:360px;
	margin-left:auto;
	margin-right:auto;
}
.roomTitle{
	font-weight: bold;
	font-size: 30px;
}
.roomTitle, .roomAddress,
.roomPrice, .roomDetailAddress
{
	text-align: left;
}
.roomPrice {
	font-size: 24px;
	font-weight: bold;
}
.roomBtn{
	margin:30px 150px;
}

.roomBtn > button{
 	background-color: #C2D6F0;
 	margin-right:20px;
 	border: none;
 	border-radius:5px;
 	width:150px;
    height:40px;
}
 .ellipsis {
      white-space: nowrap;     /* 텍스트를 한 줄에 표시 */
      overflow: hidden;        /* 너무 긴 텍스트는 숨김 처리 */
      text-overflow: ellipsis; /* 너무 긴 텍스트일 경우 ...으로 대체 */
      width: 250px;            /* 원하는 너비로 설정 */
      display: inline-block;   /* 인라인 블록 요소로 표시 (원하는 텍스트 너비만큼만 차지하도록) */
    }

#root {
	border: 2px solid black;
	width: 500px;
}

ul.tab {
	display: flex;
	list-style: none;
	padding-left: 0;
	margin: 0;
	height: 50px;
}

ul.tab>li {
	text-align: center;
	padding: 10px;
	cursor: pointer;
}

ul.tab {
	font-size: 24px;
	font-weight: bold;
}

div.box {
	position: relative;
	width: 100%;
	height: 300px;
}

div.box>div {
	position: absolute;
	width: 100%;
	height: 100%;
	top: 0;
	left: 20px;
	box-sizing: border-box;
	padding: 20px;
	font-size: 30px;
}

ul.tab>li.selected {
	border-bottom: 0;
}

div.box>div {
	display: none;
}

div.box>div.selected {
	display: block;
}


/*login css*/
.login{
    text-align: center;

}
.login fieldset{
    width:600px;
    margin: 30px auto;
}
legend{
    font-size: 30px;
}
.login input {
    border-radius: 10px;
    width:500px;
    height:50px;
}
.login legend {
    margin-bottom: 40px;
}
/*소셜 로그인 버튼  css*/
.socialbox{
	display:flex;
}



.kakao{
    width:250px;
    height: 50px;
    color:#381E20;
  
    border: none;
    padding: 0; 
    margin-right:20px;
    font: inherit;
    cursor: pointer;
    outline: inherit;
    
    display: flex;
	justify-content:center;
	align-items: center;
	margin-left:50px;
	border-radius: 5px;
	
	background-color: #FBE31F;
	font-weight:bold;
	font-size:15px;
}
.kakao > img{
	width:37px;
	height:33px;
	border-radius:50%;
    margin-right:10px;
}
.login input[type="submit"]{
    background-color: #f8215c;
    border : none;
    width:500px;
    height:50px;
    color : white;
}
.login p{
    word-spacing: 20px;
}

/*join css*/
fieldset{
    width:600px;
    margin:0 auto;
    margin-top:100px;
}
legend{
    font-size:30px;
}
.join{
    text-align: center;
}
.join input[type="submit"] {
    background-color: #f8215c;
    border : none;
    width:500px;
    height:50px;
    color:white;
}
.join input {
    border-radius: 10px;
    width:500px;
    height:50px;
}
.join select {
    width: 500px;
    height: 50px;
    text-align: center;
}
.join > .phoneNum > input{
	border-radius: 10px;
 
}
/*찜하기 css*/
.fav{
	position:relative;
	
}
.fav-btn{
    position: absolute;
    top: 10px; /* 버튼을 이미지 위로 위치시키려면 적절한 값으로 조정 */
    right: 10px; /* 버튼을 이미지 오른쪽에 위치시키려면 적절한 값으로 조정 */
    border: none;
    background: none;
    color: white;
    padding: 5px 10px;
    cursor: pointer;
   
}
.fav-btn > img{
	width:20px;
    height:20px;
}
/* 비밀번호 재설정 css */
fieldset{
    width:600px;
    margin:0 auto;
    margin-top:100px;
}
legend{
    font-size:30px;
}
.resetPassword input {
    border-radius: 10px;
    width:500px;
    height:50px;
}
.resetPassword{
    text-align: center;
}
.resetPassword input[type="submit"] {
    background-color: #f8215c;
    border : none;
    width:500px;
    height:50px;
    color:white;
}
/*정보수정 css*/
fieldset{
    width:600px;
    margin:0 auto;
    margin-top:100px;
}
legend{
    font-size:30px;
}
.update input{
 	border-radius: 10px;
    width:500px;
    height:50px;
}
.update{
    text-align: center;
}
.update input[type="submit"] {
    background-color: #f8215c;
    color:white;
    border : none;
    width:500px;
    height:50px;
}

.update > fieldset > p {
	word-spacing:10px;
}
/* 마이페이지 정보수정 버튼 */
.mypage{
	width:450px;
	height:50px;
	line-height:40px;
	text-align: center;
	margin-left:490px;
	/* margin-left:auto; */
	/* margin-right:auto; */
	margin-top:30px;
	background-color: grey;
	border-radius:10px;
	color:white;
}
/* 회원정보 확인 css */
.list{
	margin-top:100px;
}
.list > h2{
	margin-left:100px;
}
.list > table{
	margin-left:100px;
	float : left;
}
.list-info{
	margin-left:450px;
}
.hidden{
	display: none;
}
.info{
	word-spacing:50px;
}
.profileImg {
    width:250px;
	height:250px; 

	border-radius: 70%;
}

/*프로필 사진 변경 버튼*/
.update-profile input[type="submit"]{
    background-color: #f8215c;
    border : none;
    width:450px;
    height:50px;
    border-radius:10px;
    color:white;
} 
.update-profile input[type="button"]{
    background-color: #f8215c;
    border : none;
    width:500px;
    height:50px;
} 
.file-icon {
  display: inline-block;
  cursor: pointer;
}
.file-icon img {
  width: 60px;
  height: 60px;
  margin-right:200px;
}

/* Manage style */
.manageHeader {
	display: flex;
	justify-content: center;
	align-items: center;
	
	height: 100px;
	
	font-size: 25px;
	font-weight: bold;
}
.manageHeader a {
	margin: 0px 200px;
}
.hostManage {
	width: 1800px;
	margin: auto;
	padding: 20px 0px;
}
.hostRentTop {
	display: flex;
	justify-content: space-between;
	align-items: center;
	
	border-bottom: 1px solid black;
	
	padding: 0px 10px;
}
.hostRentTop button {
	all: unset;
	cursor: pointer;
	
	padding: 15px 30px;
	
	background-color: #f8215c;
	color: white;
	font-size: 18px;
	font-weight: bold;
	
	border-radius: 10px;
}
.hostRentBottom .rentList {
	margin: 10px auto;	
	
	text-align: center;
	font-size: 16px;
	font-weight: bold;
}
.rentListHead {
	border-bottom: 1px solid gray;
	
	padding: 20px;
	
	display: flex;
	justify-content: space-around;
}
.rentListRow {
	border-bottom: 1px solid gray;
	
	padding: 20px;
	
	display: flex;
	justify-content: space-around;
}
.rentListRow:hover {
	background-color: #e4e4e4;
}
.rentList .category,
.rentList .roomType,
.rentList .discount,
.rentList .rentUpdate,
.rentList .rentState,
.rentList .reservation {
   flex: 1;
}
.rentUpdate a,
.reservation a {
   all: unset;
   cursor: pointer;
   
   padding: 10px 15px;
   
   background-color: black;
   color: white;
   
   border-radius: 10px;
   
   font-weight: bold;
}
.rentList .price,
.rentList .title {
	flex: 2;
}
.rentList .address {
	flex: 3;
}
.hostReservation {
   width: 1800px;
   margin: auto;
   padding: 20px 0px;
}
.rentList .date {
   flex: 4;
}
.rentList .name,
.rentList .guestCount {
   flex: 1;
}
.rentList .phoneNum {
   flex: 2;
}

/* rentModify style */
.rentModify {
	width: 1300px;
	
	margin: auto;
}
.rentUpdateTop {
	display: flex;
	justify-content: flex-end;
	
	margin-top: 50px;
}
.rentUpdateTop button {
	all: unset;
	cursor: pointer;
	
	margin: 20px;
	padding: 12px 15px;
	
	border-radius: 10px;
	color: white;
	background-color: #f8215c;
	
	font-size: 17px;
	font-weight: bold;
}
.rentUpdateTop > .running {
	background-color: black;
}
.picture {
	margin: 50px 0px;
	
	font-size: 25px;
	font-weight: bold;
}
.picture img {
	max-width: 255px;
	max-height: 255px;
}
.pictureTop {
	display: flex;
	justify-content: space-between;
	align-items: center;
	
	margin: 20px 0px;
}
.pictureTop a {
	all: unset;
	cursor: pointer;
	
	font-size: 19px;
}
.pictureTop a:hover {
	text-decoration: underline;
}
.pictureValue {
	display: flex;
	align-items: center;
}
.pictureValue > div {
	width: 255px;
	height: 255px;
	
	border: 1px dashed black;
	
	display: flex;
	justify-content: center;
	align-items: center;
}
.imgInfo {
	margin-top: 0px;
	margin-bottom: 20px;
	
	color: gray;
}
.rentBasicInfo {
	margin: 50px 0px;
}
.basicInfo {
	height: 100px;
	border-bottom: 1px solid gray;
}
.basicInfoTop {
	display: flex;
	justify-content: space-between;
	
	font-size: 20px;
	font-weight: bold;
	
	margin-bottom: 10px;
}
.basicInfoTop button {
	all: unset;
	cursor: pointer;
}
.basicInfoBottom {
	font-size: 20px;
}
.basicInfoBottom textarea {
	width: 700px;
	border: 0px;
	
	font-size: 20px;
	font-weight: bold;
	
	resize: none;
}
.basicModify textarea {
	width: 700px;
	height: 450px;
	
	font-size: 20px;
	font-weight: bold;
	
	resize: none;
}
.basicModify {
	height: 100px;
	border-bottom: 1px solid gray;
	
	padding-bottom: 10px;
}
.contentModify {
	height: 510px;
}
.basicModifyTop {
	display: flex;
	justify-content: space-between;

	font-size: 20px;
	font-weight: bold;
	
	margin-bottom: 10px;
}
.basicModify input {
	width: 700px;
	height: 50px;
	
	font-size: 20px;
	margin-bottom: 10px;
}
.basicModify button {
	background-color: black;
	color: white;
	
	padding: 12px 17px;
	margin-left: 20px;
	
	border-radius: 10px;
	
	font-size: 16px;
}
.contentSubmit {
	margin-bottom: 10px;
}
.basicModifyTop button {
	all: unset;
	cursor: pointer;
}
.basicCount {
	border-bottom: 1px solid black;
	
	margin: 30px 0px;
}
.basicCount h3 {
	margin: 0px;
}
.basicCountSpace {
	height: 81px;

	display: flex;
	justify-content: space-between;
}
.basicCountLeft {
	flex: 1;
	
	display: flex;
	align-items: center;
	
	font-size: 17px;
	font-weight: bold;
}
.basicCountRight {
	flex: 1;
	
	display: flex;
	justify-content: flex-end;
	align-items: center;
	
	font-size: 16px;
	font-weight: bold;
}
.basicCount button {
	all: unset;
	cursor: pointer;
	
	width: 35px;
	height: 35px;
	margin: 0px 20px;
	
	border: 1px solid black;
	border-radius: 50%;
	
	display: flex;
	justify-content: center;
	align-items: center;
}
.preFileUpload {
	display: flex;
	justify-content: flex-end;
	
	padding: 10px;
}
.preFileUpload button {
	cursor: pointer;

	background-color: black;
	color: white;
	
	padding: 12px 17px;
	margin-left: 20px;
	
	border-radius: 10px;
	
	font-size: 16px;
}

/* hosting style */
.container {
	width: 100%;
	height: 78vh;
	
	display: flex;
	flex-wrap: wrap;
	justify-content: center;
	align-items: center;
	
	position: relative;
	
	overflow-y: scroll;
}
.blackBtn {
	all: unset;
	cursor: pointer;
	
	border-radius: 5px;
	padding: 15px 30px;
	margin-right: 30px;
	
	color: white;
	background-color: black;
	font-size: 17px;
}
.btnSpace {
	border-top: 1px solid black;
	padding-right: 50px;
	padding-top: 10px;
	padding-bottom: 10px;

	width: 100%;
	height: 80px;
	
	display: flex;
	justify-content: flex-end;
	align-items: center;
	
	background-color: white;
	
	position: fixed;
	bottom: 0;
}
#start {
	width: 1500px;
	margin: auto;
}
#host {
	display: flex;
	height: 440px;
	
	margin: auto;
}
.hostLeft {
	flex: 1;
	
	display: flex;
	justify-content: center;
	align-items: center;
}
.hostLeft h1 {
	margin-left: 20px;
	
	font-size: 50px;
}
.hostRight {
	flex: 1;
	
	display: flex;
	flex-direction: column;
	justify-content: center;
}
.hostInfo {
	flex: 1;
	
	display: flex;
	align-items: center;
}
.infoWrite {
	width: 60%;
}
.infoImg {
	width: 40%;
}
.infoImg img {
	width: 140px;
}
.infoWrite {
	display: flex;
	flex-direction: column;
	justify-content: center;
}
.hostInfo h2 {
	margin: 8px 0px;
}
.hostInfo span {
	font-size: 17px;
}
#nextHost {
	all: unset;
	cursor: pointer;
	
	border-radius: 5px;
	padding: 15px 30px;
	margin-right: 30px;
	
	color: white;
	background-color: #f8215c;
	font-size: 17px;
}

/* category style */
#selectCategory {
	margin: auto;
	padding-top: 20px;
	
	box-sizing: border-box;
}
#selectCategory h1 {
	text-align: center;
	
	margin-top: 0px;
	margin-bottom: 21.440px;
}
.categoryItems {
	width: 900px;
	margin: auto;
	
	display: flex;
	flex-wrap: wrap;
}
.categoryItem {
	all: unset;
	cursor:pointer;
	
	width: 275px;
	padding: 20px 0px;
	margin: 10px;
	
	font-size: 20px;
	font-weight: bold;
	
	border: 1px solid gray;
	border-radius: 10px;
}
.categoryItem:hover {
	border: 2px solid black;
}
.categoryItem div {
	display: flex;
	justify-content: center;
}
.categoryItem img {
	width: 100px;
}

/* roomType style */
#selectRoomType {
	width: 800px;
	margin: auto;
}
.roomTypeWrap {
	display: flex;
	flex-direction: column;
	justify-content: center;
}
.roomTypeItem {
	all: unset;
	cursor: pointer;
	
	width: 800px;
	height: 100px;
	
	margin-bottom: 20px;
	padding-left: 30px;
	
	border: 1px solid gray;
	border-radius: 10px;
	
	display: flex;
	justify-content: space-between;
}
.roomInfo {
	display: flex;
	flex-direction: column;
	justify-content: center;
}
.roomTypeItem:hover {
	border: 2px solid black;
}
.roomTypeItem h3 {
	margin: 0px;
}
.roomTypeItem img {
	height: 70px;
	margin: 15px 30px;
}

/* rentCount */
#rentCount {
	width: 800px;
	margin: auto;
}
.rentCountWrap {
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
}
.rentCountWrap h1 {
	width: 832px;
	
	margin-bottom: 10px;
}

.rentCountWrap > span {
	width: 830px;
	padding-left: 5px;
	margin-bottom: 20px;
	
	font-size: 17px;
	color: #717171;
}
.rentCountItem {
	width: 800px;
	height: 100px;
	margin-bottom: 20px;
	padding-left: 50px;
	
	border: 1px solid gray;
	border-radius: 10px;
	
	display: flex;
	
	font-size: 18px;
	font-weight: bold;
}
.roomCountName {
	width: 75%;
	
	display: flex;
	align-items: center;
	
}
.roomCountNumber {
	width: 25%;
	
	display: flex;
	align-items: center;
}

.roomCountNumber button {
	all: unset;
	cursor: pointer;
	
	width: 35px;
	height: 35px;
	margin: 0px 20px;
	
	border: 1px solid black;
	border-radius: 50%;
	
	display: flex;
	justify-content: center;
	align-items: center;
}
.roomCountNumber > button > span {
	font-size: 15px;
	padding: 5px;
}

/* information style */
#rentInformation {
	margin: auto;
}
.rentInformationWrap {
	width: 700px;
	margin: auto;
	padding-top: 20px;
}
.rentInformationScroll {
	margin: auto;
	
	flex-wrap: wrap;
}
.rentInformationWrap h1 {
	width: 830px;
	margin-top: 0px;
	margin-bottom: 30px;
}
.rentInformationItems {
	display: flex;
	flex-wrap: wrap;
	align-items: center;
}
.rentInformationItem {
	all: unset;
	cursor:pointer;
	
	width: 200px;
	height: 100px;
	padding: 20px 0px;
	margin: 10px;
	
	font-size: 17px;
	font-weight: bold;
	
	border: 1px solid gray;
	border-radius: 10px;
}
.rentInformationItem:hover {
	border: 2px solid black;
}
.rentInformationItem div {
	display: flex;
	justify-content: center;
}
.rentInformationItem img {
	width: 60px;
}

/* rentImg style */
.rentImg {
	margin: auto;
}
.rentImgAdd {
	padding-top: 20px;
	box-sizing: border-box;
	
	display: flex;
	flex-direction: column;
	align-items: center;
}
.rentImgWrap {
	margin: auto;
	display: flex;
}
.rentImgAdd h1 {
	margin-top: 0px;
	margin-bottom: 10px;
}
.mainImgSpace {
	width: 700px;
	height: 480px;
	padding-top: 10px;
	margin-right: 5px;
	
	border: 1px dashed black;
	
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	
	position: relative;
}
.mainInputSpace {
	width: 699px;
	height: 479px;
	
	display: flex;
	justify-content: center;
	align-items: center;
	
	position: relative;
}
.addMainImg {
	max-width: 699px;
	max-height: 479px;
	width: auto;
	height: auto;
	
	display: flex;
	justify-content: center;
	align-items: center;
}
.inputInfo {
	width: 350px;
	height: 450px;
	margin: auto;
	
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
}
.inputInfo img {
	width: 100px;
	height: 100px;
}
.subImgWrap {
	margin-left: 5px;
	width: 670px;
	
	display: flex;
	flex-wrap: wrap;
	justify-content: space-between;
}
.subImgSpace {
	width: 310px;
	height: 230px;
	margin: 10px;

	border: 1px dashed black;
	
	display: flex;
	justify-content: center;
	align-items: center;
	
	position: relative;
}
.fileImg {
	position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    opacity: 0;
    cursor: pointer;
}
.subImgSpace img {
	max-width: 309px;
	max-height: 229px;
	
	width: auto;
	height: auto;
}
.subInfo img {
	width: 100px;
	height: 100px;
}
.imgDelete {
	position: absolute;
	
	left: 90%;
	top: 2%;
}

/* rentContent */
#rentContent {
	width: 1000px;
	height: 760px;
	margin: auto;
}
.rentContentSpace {
	height: 760px;
	
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
}
#rentContent input {
	width: 700px;
	height: 50px;
	
	border-radius: 10px;
	
	font-size: 20px;
	font-weight: bold;
}
#rentContent textarea {
	width: 700px;
	height: 450px;
	
	border-radius: 10px;
	
	font-size: 20px;
	font-weight: bold;
	
	resize: none;
}

/* location style */
#rentLocation {
	width: 1600px;
}
.rentLocationScroll {
	margin: auto;
	
	display: flex;
	flex-wrap: wrap;
}
.rentLocationWrap {
	width: 1550px;
	display: flex;
	justify-content: space-between;
}
.rentLocationLeft {
	width: 1000px;
	float: left;
}
.rentLocationRight {
	width: 500px;
	
	display: flex;
	flex-direction: column;
	justify-content: center;
}
.rentLocationWrap h1 {
	margin-bottom: 2px;
}
.rentLocationWrap h4 {
	width: 600px;
	margin: 10px 0px;
	font-size: 17px;
	color: #717171;
}
.locationSpace {
	display: flex;
}
.locationSpace div {
	flex: 1;
	
	display: flex;
	align-items: center;
}
.searchLocationSpace {
	margin-top: 10px;
	
	justify-content: flex-end;
}
.searchLocationSpace input {
	width: 300px;
	height: 35px;
	
	border-radius: 10px;
}
.searchLocationSpace button {
	all: unset;
	
	padding: 8px 15px;
	margin-left: 10px;
	
	background-color: black;
	color: white;
	border-radius: 10px;
}
#map {
	width: 1000px;
	height: 500px;
}

.locationValue select {
	width: 508px;
	height: 54px;
	
	font-size: 20px;
	font-weight: bold;
}
.locationValue input {
	width: 500px;
	height: 50px;
	
	font-size: 20px;
	font-weight: bold;
}

/* selecteds */
.categorySelected {
	border: 2px solid black;
}
.roomTypeSelected {
	border: 2px solid black;
}
.rentInformationSelected {
	border: 2px solid black;
}
.hidden{
	display: none;
}
/*아이디 찾기 css*/

.findId input {
    border-radius: 10px;
    width:500px;
    height:50px;
}
.goToLogin,
.findId input[type="submit"] {
    background-color: #f8215c;
    border : none;
    width:500px;
    height:50px;
    border-radius:10px;
    color:white;
}
.goToLoginLink{
	display: flex;
	justify-content: center;
	align-items: center;
	margin: 10px 0px;
}
.goToLoginContent {
	font-size: 20px;
	display: flex;
	justify-content: center;
	align-items: center;
	margin:20px 0px;
}
/*이모지 클릭시 비밀번호 보이기*/
.passwordBox {
	position: relative;
}
#toggleButton {
	position: absolute;
	right: 55px;
	top: 15px;
}
/*rent => room => review css*/
.review {
	width: 100%;
	margin-left: auto;
	margin-right: auto;
}

.reviewItem {
	border: 1px solid;
	display: flex;
}

.reviewProfileBox>img {
	width: 200px;
	height: 200px;
	border-radius: 50%;
}

.reviewWrite {
	width: 80%;
	height: 80px; margin-left : auto;
	margin-right: auto;
	margin-left: auto;
}
.rating{
	margin-left:100px;
}

.star {
	font-size: 24px;
	color: #ccc;
	cursor: pointer;

}

.star.active {
	color: #ffcc00;
}
.review {
    width: 100%;
    margin: 20px 0;
    margin-bottom: 30px;
}

.reviewItem {
    border: 1px solid #ddd;
    display: flex;
    margin: 10px 0;
    padding: 10px;
    position: relative;
}

.reviewProfileBox > img {
    width: 80px;
    height: 80px;
    border-radius: 50%;
    margin-right: 10px;
}

.reviewProfileInfo {
    flex: 1;
}

.reviewProfileInfo > p:nth-child(1) {
    font-size: 18px;
    font-weight: bold;
    margin: 0;
}

.reviewProfileInfo > p.starPoint {
    font-size: 16px;
    margin: 5px 0;
}

.reviewProfileInfo > p:nth-child(3) {
    font-size: 14px;
    margin: 5px 0;
}
.file-icon2 {
  display: inline-block;
  cursor: pointer;
}
.file-icon2 img {
  width: 60px;
  height: 60px;
}
.reviewSubmit input[type="submit"] {
	background-color: #f8215c;
	color : white;
	border-radius:10px;
	border:none;
	width:100px;
	height:30px;
}

	/* Report Box 전체에 대한 스타일 */
.reportBox {
  width: 400px;
  height: 300px;
  margin: auto;
  border: 1px solid #ccc;
  border-radius: 10px;
  padding: 20px;
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

/* 각각의 row에 대한 스타일 */
.reportRow {
  display: flex;
  align-items: center;
  justify-content: space-between;
  margin-bottom: 15px;
}

/* 라벨에 대한 스타일 */
.reportRow label {
  font-size: 16px;
}

/* 라디오 버튼에 대한 스타일 */
.reportRow input[type="radio"] {
  width: 20px;
  height: 20px;
}

/* 신고하기 버튼에 대한 스타일 */
button {
  width: 100%;
  padding: 10px;
  background-color: #f8215c;
  color: white;
  border: none;
  border-radius: 5px;
  cursor: pointer;
  font-size: 18px;
}





/* Style the "리뷰 작성" button */
.reviewWrite{
 	resize: none;
 }
 
.reviewWrite input[type="submit"] {
    background-color: #007BFF;
    color: #fff;
    padding: 10px 20px;
    border: none;
    cursor: pointer;
    font-size: 16px;
    margin-top: 10px;
    border-radius: 5px;
}

.rating .star {
    font-size: 24px;
    color: #ccc;
    cursor: pointer;
    margin-right: 5px;
}

.rating .star.active {
    color: #ffcc00;
}

/* reservation style */
.reserveInfo {
	flex: 1;
	display: flex;
	flex-direction: column;
	align-items: flex-end;	
}
.reserveSpace {
	width: 600px;
	height: 100%;
}
  .reserveDate-container {
    display: flex;
    justify-content: center;
    align-items: center;
    padding: 10px;
}

  .reserveDate {
    border: 1px solid #717171;
    padding: 10px;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
}

  .reserveDate input[type="text"] {
    border: none;
    outline: none;
    font-size: 14px;
    padding: 10px;
    width: 160px;
}
.reserveGuest {
   display: flex;
   align-items: center;
   justify-content: center;
   width: 500px;
   padding-left: 60px;
   
   height: 80px;
}
.reserveGuest div {
   flex: 1;
   
   margin-left: 10px;
   
   font-size: 20px;
   font-weight: bold;
}
.reserveGuestCount {
   display: flex;
   justify-content: flex-end;
}
.reserveGuestCount input[type="button"] {
   all: unset;
   cursor: pointer;
   
   width: 35px;
   height: 35px;
   margin: 0px 20px;
   
   border: 1px solid black;
   border-radius: 50%;
   
   display: flex;
   justify-content: center;
   align-items: center;
}	
.reserveBtn {
	padding-left: 50px;
}
.reserveBtn input[type="submit"]{
	all: unset;
	cursor: pointer;
	
	width: 500px;
	
	border-radius: 5px;
	padding: 15px 30px;
	margin-right: 30px;
	
	color: white;
	background-color: #f8215c;
	font-size: 17px;
	
	text-align: center;
}
.reserveCal {
	margin: 10px 30px;
}
.reserveTotal {
	margin: 10px 30px;
}
.roomReport {
	cursor: pointer;
}
/* hostReservation*/
.hostReserve {
   display: flex;
   flex-direction; column;
   justify-content: center;
   align-items: center;
   
   margin: 0px auto;
}
/* review style */
.carousel {
	display: flex; /* 이미지를 가로로 배열합니다. */
	overflow: hidden;
}

.reviewImgs {
	width: 300px; /* 이미지 크기를 조절합니다. */
	height: 300px;
}

.reviewProfileInfo {
	display: flex;
	flex-direction: column;
	align-items: flex-start;
	position: relative;
}
.reviewSpace {
	display:block;
    margin-top: 30px;
}

.reviewWriteBox {
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
}

.reviewWriteBtn {
	all: unset;
	padding: 12px 15px;
	background-color: #f8215c;
	color: white;
	border-radius: 10px;
	font-size: 12px;
	font-weight: bold;
}

.prevButton, .nextButton {
	all: unset; position : absolute;
	display: flex;
	justify-content: center;
	align-items: center;
	width: 40px;
	height: 40px;
	background-color: #f8215c;
	color: white;
	border-radius: 50%;
	position: absolute;
}

.prevButton {
	top: 200px;
	left: -50px;
}

.nextButton {
	top: 200px;
	right: 300px;
}
.deleteButton {
	position: absolute;
	top: 0;
	right: 0;
}
/* admin page 공통 */

.adminMain {
	border-radius: 12px;
	width: 1400px;
	height: 800px;
	margin: 20px auto;
	display: flex;
	box-shadow: 0 4px 8px rgba(0,0,0,0.1);
}

.adminLeft {
	border-right: 2px solid #ddd;
	flex: 1;
	background-color: #f9f9f9;
}

.adminRight {
	flex: 4;
	padding: 20px;
}

.adminStatus {
	border-bottom: 1px solid #ddd;
	padding: 20px;
	background-color: #fff;
	box-shadow: 0 2px 4px rgba(0,0,0,0.05);
	height: 760px;
}

.addminProfile {
	width: 100px;
	height: 100px;
	border-radius: 50%;
	object-fit: cover;
}

.addminProfileBox {
	padding: 20px;
	display: flex;
	justify-content: center;
	align-items: center;
}

.adminList{
	margin-top: 20px;
	background-color: #f9f9f9;
	padding: 10px;
	height: 500px;
}

.adminList li {
	padding: 10px;

}

.reservationManagement{
	display: flex;
	flex-direction: column;
	background-color: #fff;
	border-radius: 6px;
	box-shadow: 0 2px 4px rgba(0,0,0,0.05);
}

.reservationManagementList {
	padding: 10px;
	border-bottom: 1px solid #ddd;
	width: 120px;
	cursor: pointer;
}

.reservationManagementList:hover {
	background-color: #f1f1f1;
}
.adminTitle {
	width:100%;
	display: flex;
	justify-content: center;
	align-items: center;
}
/* admin -> reservation*/

.adminTitle {
    font-size: 24px;
    margin-bottom: 20px;
}

#searchFilter {
    margin-bottom: 20px;
    display: flex;
    align-items: center;
}

#searchBar {
    padding: 10px;
}

#dateFilter, #statusFilter {
    padding: 10px;
}

.reservationTable {
    width: 100%;
    border-collapse: collapse;
}

.reservationTable > thead th {
    padding: 10px;
    border-bottom: 2px solid #ccc;
}

.reservationTable > tbody tr {
    border-bottom: 1px solid #ccc;
}

.reservationTable > tbody td {
    padding: 10px;
}
.searchBtn, 
.resetBtn {
	all: unset;
	padding: 12px 15px;
	
	background-color: #f8215c;
	color: white;
	
	border-radius: 10px;
	font-size: 12px;
	font-weight: bold;
	margin-left: 10px;
}
.reservationBox {
	height: 625px;
	padding: 10px;
	border: 1px solid rgba(0,0,0,0.2); 
	overflow: auto; 
}

/* admin -> registration */
 /* Style the table */
.registrationTable {
  width: 100%;
  border-collapse: collapse;
  margin-top: 20px;
}
/* Table header */
.registrationTable > thead th {
  background-color: #f1f1f1;
  padding: 10px;
  text-align: left;
  border-bottom: 2px solid #ddd;
}
/* Table rows */
.registrationTable > tbody tr:nth-child(even) {
  background-color: #f4f4f4;
}
.registrationTable > tbody td {
  padding: 8px;
  text-align: left;
  border-bottom: 1px solid #ddd;
}
/* Action buttons */
.registrationBtn {
  padding: 5px 10px;
  margin: 2px;
  cursor: pointer;
}

   /* Paging Container */
.paging {
  text-align: center;
  margin-top: 20px;
  margin-bottom: 20px;
}

/* Paging Links */
.paging a {
  margin: 0 5px;  /* Margin between links */
  text-decoration: none;  /* Remove underline */
  color: #333;  /* Text color */
  transition: background-color 0.3s ease-in-out;  /* Transition for hover effect */
}

/* Hover effect for paging links */
.paging a:hover {
  background-color: #f1f1f1;
  color: #333;
}

/* Active Page (if you can dynamically set a class for the active page) */
.paging a.active {
  background-color: #4CAF50;
  color: white;
  border: 1px solid #4CAF50;
}
.registrationPermitBtn,
.registrationCencelBtn {
   all: unset;
   cursor: pointer;
   padding: 1px 10px;
   background-color: black;
   color: white;
   border-radius: 10px;
   font-weight: bold;
}
	
/*home.jsp 에 필터기능 모달*/
/* 모달 스타일 */
.modal {
  display: none; /* 초기에는 숨김 상태로 설정 */
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background-color: rgba(0, 0, 0, 0.5); /* 배경에 반투명한 레이어 추가 */
  z-index: 1; /* 다른 요소 위에 표시 */
}

/* 모달 내용 스타일 */
.modal-content {
  background-color: #fff;
  margin: 15% auto;
  padding: 20px;
  border: 1px solid #888;
  width: 50%;
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
}
.modal-content > h2 {
	text-align: center;
}
/* 모달 닫기 버튼 스타일 */
.close {
  color: #aaa;
  float: right;
  font-size: 28px;
  font-weight: bold;
}

.close:hover,
.close:focus {
  color: black;
  text-decoration: none;
  cursor: pointer;
}


/*home.jsp ->모달창 -> 숙소보러가기 버튼*/
.seeFilter{
	background-color: #f8215c;
	border-radius:10px;
    border : none;
    width:120px;
    height:30px;
    color:white;
}

</style>
</head>
<body>
	<header>
        <div class="header">
        	 <!-- <h1><a href="${cpath }">자바방</a></h1> -->
        	<div class="title"><a href="${cpath }"><img src="http://192.168.64.200/javaBang.png"></a></div>
	        <div class="btn3">
	        	<button><img src="http://192.168.64.200/search.png" class="search"></button>
	        </div>
	        
	        <ul class="host">
	        	<c:if test="${not empty login }">
	           		<li><a href="${cpath }/rent/rentManage/${login.idx }">호스트페이지</a></li>
	            </c:if>
	            <li><a href="${cpath }/member/${empty login ? 'login' : 'logout'}"><button>${empty login ? '로그인' : '로그아웃'}</button></a></li>
	           
	        </ul>
	        
	        <c:if test="${not empty login }">
	       		<img src="${login.profile }"><h4>${login.userNick }님 환영합니다 !</h4> <a href="${cpath }/member/mypage/${login.idx}"><button>마이페이지</button></a>
	       	</c:if>
	       	<c:if test="${login.userId == 'admin'}">
	       		<a href="${cpath }/admin/adminPage/${login.idx}"><button>관리자 페이지</button></a>
	       	</c:if>
        </div>
    </header>
</body>
</html>