<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<fieldset>
		<legend>프로필 사진 수정</legend>
		<div class="update-profile">
			<form method="POST" enctype="multipart/form-data">
				<div class="profileSpace">
					<div><img class="profileImg" src="${login.profile }"></div>
					<div>
						<label
							for="file-input" class="file-icon">
							<img src="http://192.168.64.200/camera.png" alt="File Icon">
							<input type="file" name="upload" id="file-input"
								style="display: none;" required>
						</label>
					</div>
				</div>
				<p>
					<input type="submit" value="프로필 변경">
				</p>
			</form>
			<div class="update-profile">
				<form method="POST"
					action="${cpath }/member/updateBasicProfile/${login.idx}">
					<p>
						<input type="submit" value="기본이미지로 변경">
					</p>
				</form>
			</div>
		</div>
	</fieldset>
	<script src="${cpath }/resources/script/member/updateProfile.js"></script>
	<script>
		const file = document.querySelector('input[type="file"]')
		
		file.onchange = inputProfileHandler
	</script>
</body>
</html>