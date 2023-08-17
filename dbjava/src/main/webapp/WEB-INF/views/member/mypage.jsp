<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<div class="mypage"><a href="${cpath }/member/update/${one.idx}">회원정보 수정</a></div>

<div class="list">
<h2>${one.userNick }님의 정보</h2>

		<table border="1px solid black;" cellspacing=0>
			<thead>
				<tr>
					<th>번호</th>
					<th>아이디</th>
					<th>비밀번호</th>
					<th>닉네임</th>
					<th>이메일</th>
					<th>생년월일</th>
					<th>이름</th>
					<th>전화번호</th>
					<th>성별</th>
				</tr>
			</thead>
		    <tbody>
		    	<tr>
		    		<td>${one.idx }</td>
		    		<td>${one.userId }</td>
		    		<td>*********</td>
		    		<td>${one.userNick }</td>
		    		<td>${one.email }</td>
		    		<td>${one.birth }</td>
		    		<td>${one.userName }</td>
		    		<td>${one.phoneNum }</td>
		    		<td>${one.gender }</td>
		    	</tr>
		    </tbody>
		</table>
</div>


</body>
</html>