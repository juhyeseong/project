<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
	<div class="findId">
		<fieldset>
			<legend>아이디 찾기</legend>
			<form method="POST">
				<p><input type="text" name="userName" placeholder="이름을 입력해주세요"></p>
				<p><input type="text" name="phoneNum" placeholder="전화번호를 입력해주세요 (ex. 010-xxxx-xxxx)"></p>
				<p><input type="submit" value="아이디 찾기" ></p>
			</form>
		</fieldset>
	</div>
</body>
</html>