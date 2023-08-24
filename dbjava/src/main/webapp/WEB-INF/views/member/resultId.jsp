<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<fieldset>
	<legend>
		<c:if test="${not empty tmp }">
			아이디 찾기 성공
		</c:if>
		<c:if test="${empty tmp}">
			아이디 찾기 실패
		</c:if>
	</legend>
	<div class="goToLoginContent">
		<c:if test="${not empty tmp }">
			당신의 아이디는 [${tmp.userId }] 입니다.
		</c:if>
		<c:if test="${empty tmp}">
			이름 또는 전화번호를 다시 입력해주세요
		</c:if>
	</div>
	<c:if test="${not empty tmp }">
		<a class="goToLoginLink" href="${cpath }/member/login"><button
				class="goToLogin">로그인 하러 가기</button></a>
	</c:if>
	<c:if test="${empty tmp }">
		<a class="goToLoginLink" href="${cpath }/member/findId"><button
				class="goToLogin">뒤로 가기</button></a>
		<a class="goToLoginLink" href="${cpath }"><button
				class="goToLogin">홈으로 가기</button></a>
	</c:if>
</fieldset>
</body>
</html>