<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<style>

	.adminMain {
		border-radius: 12px;
		width: 1400px;
		height: 800px;
		margin: 20px auto;
		display: flex;
		box-shadow: 0 4px 8px rgba(0,0,0,0.1);
	}

	.adminLeft {
		border-right: 2px solid #ddd;
		flex: 1;
		background-color: #f9f9f9;
	}

	.adminRight {
		flex: 4;
		padding: 20px;
	}

	.adminStatus {
		border-bottom: 1px solid #ddd;
		padding: 20px;
		background-color: #fff;
		box-shadow: 0 2px 4px rgba(0,0,0,0.05);
		height: 760px;
	}

	.addminProfile {
		width: 100px;
		height: 100px;
		border-radius: 50%;
		object-fit: cover;
	}

	.addminProfileBox {
		padding: 20px;
		display: flex;
		justify-content: center;
		align-items: center;
	}

	.adminList{
		margin-top: 20px;
		background-color: #f9f9f9;
		padding: 10px;
		height: 500px;
	}

	.adminList li {
		padding: 10px;
	
	}

	.reservationManagement{
		display: flex;
		flex-direction: column;
		background-color: #fff;
		border-radius: 6px;
		box-shadow: 0 2px 4px rgba(0,0,0,0.05);
	}

	.reservationManagementList {
		padding: 10px;
		border-bottom: 1px solid #ddd;
		width: 120px;
		cursor: pointer;
	}

	.reservationManagementList:hover {
		background-color: #f1f1f1;
	}
	.adminTitle {
		width:100%;
		display: flex;
		justify-content: center;
		align-items: center;
	}
</style>

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
							<li class="reservationManagementList">예약 현황</li>
							<li class="reservationManagementList"><a href="${cpath }/admin/registration">숙소 등록 관리</a></li>
							<li class="reservationManagementList">결제 내역</li>
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