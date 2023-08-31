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
							<li class="reservationManagementList"><a href="${cpath }/admin/reservation">예약 현황</a></li>
							<li class="reservationManagementList"><a href="${cpath }/admin/registration">숙소 등록 관리</a></li>
							<li class="reservationManagementList"><a href="${cpath }/admin/payment">결제 내역</a></li>
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