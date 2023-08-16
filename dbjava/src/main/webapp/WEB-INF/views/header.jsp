<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자바방</title>
<style>
body {
	margin: 0px;
}
a {
	all: unset;
	cursor: pointer;
}
p {
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
	width: 1000px;
	
    display: flex;
    justify-content: space-between;
	align-items: center;
}

.btn3 > button {
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
ul > li {    
	margin-left: 30px;
}

/* home style */
.main {
	width: 1000px;
	margin: auto;
}

.btn1 >  button {
    margin-top:50px;
    margin-right:100px;
    border: none;
    background: none;
    padding: 0; 
    font: inherit;
    cursor: pointer;
    outline: inherit;
}
.btn2 > button {
    margin-top:50px;
    margin-left:100px;
    border: none;
    background: none;
    padding: 0; 
    font: inherit;
    cursor: pointer;
    outline: inherit;
}
.category {
    margin-left:200px;
    margin-top:30px;
}
.arrow {
    width:30px;
}
.categories {
    display:flex;
   
}
.category {
   margin-left:20px;
   margin-top:30px;
   /* opacity: 0.7; */
}

.categoryImg {
	width: 30px;
}
.type {
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
.login {
    text-align: center;
}
.login fieldset {
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
.kakao {
    width:500px;
    height: 50px;
    line-height: 50px;
    border: none;
    padding: 0; 
    font: inherit;
    cursor: pointer;
    outline: inherit;
}
.naver {
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
.email {
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
.login input[type="submit"] {
    background-color: #C2D6F0;
    border : none;
    width:500px;
    height:50px;
}
.login p{
    word-spacing: 20px;
}
/*join css*/
fieldset {
    width:600px;
    margin:0 auto;
    margin-top:100px;
}
legend {
    font-size:30px;
}
.join {
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
.fav {
	position:relative;
	
}
.fav-btn {
    position: absolute;
    top: 10px; /* 버튼을 이미지 위로 위치시키려면 적절한 값으로 조정 */
    right: 10px; /* 버튼을 이미지 오른쪽에 위치시키려면 적절한 값으로 조정 */
    border: none;
    background: none;
    color: white;
    padding: 5px 10px;
    cursor: pointer;
   
}  
.fav-btn > img {
	width:20px;
    height:20px;
}
</style>
</head>
<body>
	<header>
        <div>
        	<h1><a href="${cpath }">자바방</a></h1>
	        <div class="btn3">
	        	<button><img src="http://192.168.64.200/search.jpeg" class="search"></button>
	        </div>
	        
	        <ul>
	            <li><a href="${cpath }/rent/hosting">숙소를 올려방 !!</a></li>
	            <li><a href="${cpath }/member/${empty login ? 'login' : 'logout'}"><button>${empty login ? '로그인' : '로그아웃'}</button></a></li>
	           
	        </ul>
	        <c:if test="${not empty login }">
	       		${login.userNick } 님 환영합니다 !@@
	       	</c:if>
        </div>
    </header>
</body>
</html>