<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>


<form method="POST">
<div class="update">
	<fieldset>
		<legend>회원정보 수정</legend>
		<p><input type="text" name="userNick" placeholder="닉네임 수정"></p>
		<p><input type="text" name="phoneNum" placeholder="전화번호 수정"></p>
		<p><input type="email" name="email" placeholder="이메일 수정"></p>
		<p><input type="submit" value="정보수정"></p>
		
		<a href="${cpath }/member/resetPassword">비밀번호재설정</a>
		
	</fieldset>
</div>
</form>
</body>
</html>