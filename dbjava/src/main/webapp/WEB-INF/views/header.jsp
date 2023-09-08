<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="cpath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자바방</title>
<link type="text/css" rel="stylesheet" href="${cpath }/resources/css/style.css">
</head>
<body>
	<header>
        <div class="header">
        	<div class="headerLogoBox">
				<div class="title"><a href="${cpath }"><img src="http://192.168.64.200/javaBang.png"></a></div>
        	</div>
			<div class="headerSearchBox">
				<form method="GET"  action="${cpath }/search"> 
					<div class="btn3 hidden">
						<input type="search" name="search" id="searchInput">
						<input type="submit" id ="inputButton" value="">
						<input class="hiddenInput" type="button" value="❌">
					</div>
					<div class="showInput"><input type="button"  id="showInputButton"></div>
				</form>
			</div>
			<div class="headerElseBox">
	
	        	<c:if test="${not empty login }">
	           		<a href="${cpath }/rent/rentManage/${login.idx }">호스트페이지</a>
	            </c:if>
					<c:if test="${empty login }">
						<a href="${cpath }/member/login"><button>로그인</button></a>
					</c:if>
		        	<c:if test="${not empty login }">
		       		<img src="${login.profile }"><h4>${login.userNick }님 환영합니다 !</h4> 
	            	<a href="${cpath }/member/logout"><button>로그아웃</button></a>
		       		<a href="${cpath }/member/mypage/${login.idx}">
		       			<button class="myPageBtn">마이페이지</button>
		       		</a>
		       	</c:if>
		       	<c:if test="${login.userId == 'admin'}">
		       		<a href="${cpath }/admin/adminPage/${login.idx}"><button>관리자 페이지</button></a>
		       	</c:if>
			</div>
        </div>
    </header>
    
    
    <!-- 스크롤하면 헤더 색상 변경하기 -->
    <script>
    	const showInputBtn = document.getElementById('showInputButton')
    	const hiddenInputBtn = document.querySelector('.hiddenInput')
        // JavaScript 코드로 스크롤 이벤트를 감지
        window.addEventListener("scroll", function() {
            const header = document.querySelector(".header")

            // 스크롤 위치가 헤더의 높이 이상이면 배경색을 변경
            if (window.scrollY > header.offsetHeight) {
                header.style.backgroundColor = '#eee' // 원하는 배경색으로 변경
            } else {
                header.style.backgroundColor = '#fff' // 초기 배경색으로 복원
            }
        });
    	
    	function showInputHandler(event) {
    		const target = event.target
    		const showInput = target.parentNode
    		const btn3 = showInput.parentNode.children[0]
    		
    		btn3.classList.remove('hidden')
    		showInput.classList.add('hidden')
    	}
    	
    	function hiddenInputHandler(event) {
    		const target = event.target
    		const btn3 = target.parentNode
    		const showInput = btn3.parentNode.children[1]
    		
    		btn3.classList.add('hidden')
    		showInput.classList.remove('hidden')
    	}
    	
    	showInputBtn.onclick = showInputHandler
    	hiddenInputBtn.onclick = hiddenInputHandler
    </script>
</body>
</html>