<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<div class="update-profile">
<form method="POST" enctype="multipart/form-data">
	<fieldset>
		<legend>프로필 사진 수정</legend>
		<img class="profileImg" src="${login.profile }">
		


		<p><input type="submit"  value="기본이미지로 변경"></p>
	</fieldset>
</form>
</div>

</body>
</html>