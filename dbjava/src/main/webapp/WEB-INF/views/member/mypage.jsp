<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>


<div class="list-info">
<div class="list">
<h2>${one.userNick }님의 정보</h2>

	<table>
		<tr>
			<td colspan="2"><!-- <img class="profileImg" src="http://192.168.64.200/basicProfile.jpeg" /> -->
				<img class="profileImg" src="${one.profile }">
			</td>
		</tr>
		<tr>
			<th>아이디</th>
			<td>${one.userId }</td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td>********</td>
		</tr>
		<tr>
			<th>닉네임</th>
			<td>${one.userNick }</td>
		</tr>
		<tr>
			<th>이메일</th>
			<td>${one.email }</td>
		</tr>
		<tr>
			<th>생년월일</th>
			<td>${one.birth }</td>
		</tr>
		<tr>
			<th>이름</th>
			<td>${one.userName }</td>
		</tr>
		<tr>
			<th>전화번호</th>
			<td>${one.phoneNum }</td>
		</tr>
		<tr>
			<th>성별</th>
			<td>${one.gender }</td>
		</tr>
	</table>
	

</div>

<div class="mypage"><a href="${cpath }/member/update/${one.idx}">회원정보 수정</a></div>
<div class="mypage"><a href="${cpath }/member/updateProfile/${one.idx}">프로필사진 수정</a></div>
<div class="mypage"><a href="${cpath }/member/reservation/${one.idx}">예약내역 확인하기</a></div>

</div>

</body>
</html>