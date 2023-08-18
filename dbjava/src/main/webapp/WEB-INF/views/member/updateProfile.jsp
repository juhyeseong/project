<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<div class="update-profile">
<form method="POST" enctype="multipart/form-data">
	<fieldset>
		<legend>프로필 사진 수정</legend>
		<img class="profileImg" src="${login.profile }">
		
		<label for="file-input" class="file-icon">
			<img src="http://192.168.64.200/camera.jpeg" alt="File Icon">
		</label>
		<p><input type="file" name="upload" id="file-input"  style="display:none;"></p>
		
		<p><input type="submit" value="프로필 변경"></p>
	</fieldset>
</form>
</div>
</body>
</html>