<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>


	<main class="adminMain">
		<div class="adminLeft">
			<div class="adminStatus">
				<div class="addminProfileBox">
					<img class="addminProfile" src="${login.profile }">
				</div>
				<div>
					<p>${login.userNick }
				</div>
				<ul class="adminList">
					<li>
						숙박예약 관리
						<ul class="reservationManagement">
							<a href="${cpath }/admin/reservation"><li class="reservationManagementList">예약 현황</li></a>
							<a href="${cpath }/admin/registration"><li class="reservationManagementList">숙소 등록 관리</li></a>
							<a href="${cpath }/admin/reporting"><li class="reservationManagementList">숙소 신고 현황</li></a>
						</ul>	
					</li>
					<li>
						댓글 관리
						<ul class="reviewManagement">
							<a href="${cpath }/admin/reviewReporting"><li class="reviewManagementList">댓글 신고 현황</li></a>
						</ul>
					</li>
				</ul>
			</div>
		</div>
		<div class="adminRight">
			<h2 class="adminTitle">관리자 페이지</h2>
		</div>
	</main>
</body>
</html>