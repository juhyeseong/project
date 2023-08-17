<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

/* header style */
header {
    height: 100px;

	background-color: #79DDD1;
    font-family: "굴림";
    font-weight: bold;
    
    display: flex;
    justify-content: center;
    align-items: center;
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
ul {
    list-style: none;
    
	padding: 0px;
    
    display: flex;
}
ul > li{    
	margin-left: 30px;
}

/* home style */
.main {
	width: 1000px;
	margin: auto;
}

.btn1 >  button{
    margin-top:50px;
    margin-right:100px;
    border: none;
    background: none;
    padding: 0; 
    font: inherit;
    cursor: pointer;
    outline: inherit;
}
.btn2 > button{
    margin-top:50px;
    margin-left:100px;
    border: none;
    background: none;
    padding: 0; 
    font: inherit;
    cursor: pointer;
    outline: inherit;
}
.category{
    margin-left:200px;
    margin-top:30px;
}
.arrow{
    width:30px;
}
.categories{
    display:flex;
   
}
.category{
   margin-left:20px;
   margin-top:30px;
   /* opacity: 0.7; */
}

.categoryImg {
	width: 30px;
}
.type{
	margin-right:20px;
	display: flex;
    flex-flow: wrap;
    width : 1000px;
    overflow :hidden;
}
.room {
	
	width : 240px;
    height : 240px;
    margin : 5px;
    border-radius:10px;
    position : relative;
    overflow: hidden;
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
.kakao{
    width:500px;
    height: 50px;
    line-height: 50px;
    border: none;
    padding: 0; 
    font: inherit;
    cursor: pointer;
    outline: inherit;
}
.naver{
    width:500px;
    height: 50px;
    line-height: 50px;
    border: none;
    padding: 0; 
    font: inherit;
    cursor: pointer;
    outline: inherit;
    margin-top:10px;
}
.email{
	width:500px;
    height: 50px;
    line-height: 50px;
    border: none;
    padding: 0; 
    font: inherit;
    cursor: pointer;
    outline: inherit;
    margin-top:10px;
}
.login input[type="submit"]{
    background-color: #C2D6F0;
    border : none;
    width:500px;
    height:50px;
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
    background-color: #C2D6F0;
    border : none;
    width:500px;
    height:50px;
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
    background-color: #C2D6F0;
    border : none;
    width:500px;
    height:50px;
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
    background-color: #C2D6F0;
    border : none;
    width:500px;
    height:50px;
}
/* 마이페이지 정보수정 버튼 */
.mypage{
	width:700px;
	height:40px;
	line-height:40px;
	text-align: center;
	margin-left:auto;
	margin-right:auto;
	margin-top:30px;
	border:3px solid #C2D6F0;
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
}
.list > table > thead > tr{
	background-color:#C2D6F0; 
}
.hidden{
	display: none;
}
.info{
	word-spacing:50px;
}
.profileImg {
	border-radius: 50%;
}

/* host style */
.hidden {
	display: none;
}
.blackBtn {
	all: unset;
	cursor: pointer;
	
	border-radius: 5px;
	padding: 13px;
	margin: 0px 10px;
	
	color: white;
	background-color: black;
	font-size: 17px;
}
#host {
	display: flex;
	height: 720px;
}
.hostLeft {
	flex: 1;
	
	display: flex;
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
.btnSpace {
	display: flex;
	justify-content: flex-end;
}
#nextHost {
	all: unset;
	cursor: pointer;
	
	border-radius: 5px;
	padding: 13px;
	
	color: white;
	background-color: hotpink;
	font-size: 17px;
}

/* category style */
#selectCategory h1 {
	text-align: center;
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
.selected {
	border: 2px solid black;
}

/* roomType style */
#selectRoomType {
	width: 700px;
	margin: auto;
}
.roomTypeItem {
	all: unset;
	cursor: pointer;
	
	width: 700px;
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
</style>
</head>
<body>
	<header>
        <div>
        	 <!-- <h1><a href="${cpath }">자바방</a></h1> -->
        	<div class="title"><a href="${cpath }"><img src="http://192.168.64.200/javaBang.jpeg"></a></div>
	        <div class="btn3">
	        	<button><img src="http://192.168.64.200/search.jpeg" class="search"></button>
	        </div>
	        
	        <ul>
	        	<c:if test="${not empty login }">
	           		<li><a href="${cpath }/rent/hosting">숙소를 올려방~</a></li>
	            </c:if>
	            <li><a href="${cpath }/member/${empty login ? 'login' : 'logout'}"><button>${empty login ? '로그인' : '로그아웃'}</button></a></li>
	           
	        </ul>
	        <c:if test="${not empty login }">
	       		<img src="${login.profile }"><h4>${login.userNick } 님 환영합니다 !</h4> <a href="${cpath }/member/mypage/${login.idx}"><button>마이페이지</button></a>
	       	</c:if>
        </div>
    </header>
</body>
</html>