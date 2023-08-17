<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<form method="POST" enctype="multipart/formdata">
	<fieldset>
		<legend>프로필 사진 수정</legend>
		<p><input type="file" name="upload"></p>
		<p><input type="submit" value="프로필 변경"></p>
	</fieldset>
</form>

</body>
</html>