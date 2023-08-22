<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

	<fieldset>
		<legend>프로필 사진 수정</legend>
			<div class="update-profile">
			<form method="POST" enctype="multipart/form-data">
			<img class="profileImg" src="${login.profile }">
		
			<label for="file-input" class="file-icon">
				<img src="http://192.168.64.200/camera.jpeg" alt="File Icon">
			</label>
			<p><input type="file" name="upload" id="file-input"  style="display:none;" required></p>
		
			<p><input type="submit" value="프로필 변경" ></p>
		
		</form>
		<div class="update-profile">
			<form method="POST" enctype="multipart/form-data" action="${cpath }/member/updateBasicProfile/${login.idx}">
	

			<p><input type="submit"  value="기본이미지로 변경"></p>
	
		</form>
		</div>
		</div> 
	</fieldset>



	



</body>
</html>