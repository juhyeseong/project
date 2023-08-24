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
/*로그인 버튼 + 마이페이지 버튼*/
.login-btn{
	background-color: #C2D6F0;
	border:none;
	height:23px;
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

.update > fieldset > p {
	word-spacing:10px;
}
/* 마이페이지 정보수정 버튼 */
.mypage{
	width:550px;
	height:40px;
	line-height:40px;
	text-align: center;
	margin-left:450px;
	/* margin-left:auto; */
	/* margin-right:auto; */
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
	float : left;
}
.list-info{
	margin-left:250px;
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
/*기본 이미지로 변경 버튼*/
.updateBasicProfile > a{
    width:300px;
	height:40px;
	line-height:40px;
	text-align: center;
	border:3px solid #C2D6F0;
	bottom:200px;
}

/*프로필 사진 변경 버튼*/
.update-profile input[type="submit"]{
    background-color: #C2D6F0;
    border : none;
    width:500px;
    height:50px;
} 
.update-profile input[type="button"]{
    background-color: #C2D6F0;
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


/* host style */
.container {
	width: 100%;
	position: relative;
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
	height: 80px;
	
	display: flex;
	justify-content: flex-end;
	align-items: center;
}
#start {
	width: 1500px;
	margin: auto;
}
#host {
	display: flex;
	height: 760px;
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
.main hr {
	width: 1000px;
	margin: 30px 0px;
}
#nextHost {
	all: unset;
	cursor: pointer;
	
	border-radius: 5px;
	padding: 15px 30px;
	margin-right: 30px;
	
	color: white;
	background-color: hotpink;
	font-size: 17px;
}

/* category style */
#selectCategory {
	height: 760px;
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
	height: 760px;
	
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
	height: 760px;
	
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
.rentInformationWrap {
	width: 700px;
	height: 760px;
	margin: auto;
	padding-top: 20px;
}
.rentInformationScroll {
	width: 1500px;
	max-height: 760px;
	margin: auto;
	
	flex-wrap: wrap;
	overflow-y: scroll;
	
	scrollbar-width: none;
}
::-webkit-scrollbar {
	width: 0.1em;
	background-color: transparent;
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
	height: 760px;
}
.rentImgAdd {
	width: 1500px;
	margin: auto;
	height: 760px;
	padding-top: 20px;
	box-sizing: border-box;
	
	display: flex;
	flex-direction: column;
	align-items: center;
}
.rentImgWrap {
	width: 702px;
	margin: auto;
}
.rentImgScroll {
	width: 1500px;
	display: flex;
	flex-wrap: wrap;
	overflow-y: scroll;
}
.rentImgAdd h1 {
	margin-top: 0px;
	margin-bottom: 10px;
}
.mainImgSpace {
	width: 700px;
	height: 450px;

	border: 1px dashed black;
	
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	
	position: relative;
}
.mainInputSpace {
	width: 699px;
	height: 450px;

	border: 1px dashed black;
	
	display: flex;
	justify-content: center;
	align-items: center;
	
	position: relative;
}
.addMainImg {
	max-width: 699px;
	max-height: 449px;
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
	width: 700px;
	
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
	width: 500px;
	height: 50px;
	
	border-radius: 10px;
	
	font-size: 20px;
	font-weight: bold;
}
#rentContent textarea {
	width: 500px;
	height: 400px;
	
	border-radius: 10px;
	
	font-size: 20px;
	font-weight: bold;
	
	resize: none;
}

/* location style */
.rentLocationScroll {
	width: 1700px;
	height: 740px;
	margin: auto;
	
	display: flex;
	flex-wrap: wrap;
	
	overflow-y: scroll;
}
.rentLocationWrap {
	width: 1000px;
	height: 740px;
	margin: auto;
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
	width: 100%;
	height: 400px;
}

.locationValue select {
	width: 500px;
	height: 50px;
	
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
    background-color: #C2D6F0;
    border : none;
    width:500px;
    height:50px;
    border-radius:10px;
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
	            <li><a href="${cpath }/member/${empty login ? 'login' : 'logout'}"><button class="login-btn">${empty login ? '로그인' : '로그아웃'}</button></a></li>
	           
	        </ul>
	        <c:if test="${not empty login }">
	       		<img src="${login.profile }"><h4>${login.userNick }님 환영합니다 !</h4> <a href="${cpath }/member/mypage/${login.idx}"><button class="login-btn">마이페이지</button></a>
	       	</c:if>
        </div>
    </header>
</body>
</html>