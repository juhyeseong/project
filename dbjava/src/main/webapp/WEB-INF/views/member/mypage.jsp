<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
	<div class="mypageSpace">
		<div class="list-info">
			<h2>${one.userNick }님의 정보</h2>
			<div class="listSpace">
				<div class="list">
					<table>
						<tr>
							<td colspan="2">
								<img class="profileImg" src="${one.profile }">
							</td>
						</tr>
						<tr>
							<td>아이디</td>
							<td>${one.userId }</td>
						</tr>
						<tr>
							<td>비밀번호</td>
							<td>********</td>
						</tr>
						<tr>
							<td>닉네임</td>
							<td>${one.userNick }</td>
						</tr>
						<tr>
							<td>이메일</td>
							<td>${one.email }</td>
						</tr>
						<tr>
							<td>생년월일</td>
							<td>${one.birth }</td>
						</tr>
						<tr>
							<td>이름</td>
							<td>${one.userName }</td>
						</tr>
						<tr>
							<td>전화번호</td>
							<td>${one.phoneNum }</td>
						</tr>
						<tr>
							<td>성별</td>
							<td>${one.gender }</td>
						</tr>
					</table>
				</div>
				<div class="mypageWrap">
					<a href="${cpath }/member/update/${one.idx}"><div class="mypage">회원정보 수정</div></a>
					<a href="${cpath }/member/updateProfile/${one.idx}"><div class="mypage">프로필사진 수정</div></a>
					<a href="${cpath }/reservation/reservationList/${one.idx}"><div class="mypage">예약내역 확인하기</div></a>
					<a href="${cpath }/member/myReview/${one.idx}"><div class="mypage">내가 쓴 리뷰 보기</div></a>
					<a href="${cpath }/wishList/myWishList/${one.idx}"><div class="mypage">내가 찜한 숙소 보기</div></a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>