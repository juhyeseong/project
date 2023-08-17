<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<div class="resetPassword">
<form method="POST">
<fieldset>
	<legend> 비밀번호 재설정</legend>
	<p><input type="text" name="userId" placeholder="아이디 입력"></p>
	<p><input type="email" name="email" placeholder="이메일 입력"> </p> 
	<p><input type="submit" value="보내기"></p>
</fieldset>
</form>
</div>

</body>
</html>