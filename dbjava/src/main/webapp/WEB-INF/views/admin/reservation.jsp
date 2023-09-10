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
							<a href="${cpath }/admin/reservation"><li class="reservationManagementList" style="background-color: #AFAB99;">예약 현황</li></a>
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
			<h2 class="adminTitle">예약 현황</h2>
			<div class="reservationBox">
				<div id="searchFilter">
					<form method="post">
					        <input type="text" name="search" id="searchBar" placeholder="예약자 ID로 검색">
		
				    		<button class="searchBtn">검색</button>
					</form>
					<a href="${cpath }/admin/reservation"><button class="resetBtn">초기화</button></a>
	    		</div>	
			    <table class="reservationTable">
			        <thead>
			            <tr>
			                <th>예약 번호</th>
			                <th>예약자 ID</th>
			                <th>예약자 성함</th>
			                <th>예약룸</th>
			                <th>방 타입</th>
			                <th>체크인 날짜</th>
			                <th>체크아웃 날짜</th>
			                <th>가격</th>
			            </tr>
			        </thead>
			        <tbody>
			            <c:forEach var="dto" items="${list }">
				            <tr>
				            	<th>${dto.idx }</th>
				            	<th>${dto.userId }</th>
				            	<th>${dto.userName }</th>
				            	<th><a href="${cpath }/room/${dto.rent}">${dto.title }</a></th>
				            	<th>${dto.roomType }</th>
				            	<th>${dto.startDate }</th>
				            	<th>${dto.endDate }</th>
				            	<th style="text-align: right;"><fmt:formatNumber value="${dto.totalPrice}" groupingUsed="true" /> 원</th>
				            <tr>
			            </c:forEach>
			        </tbody>
			    </table>
			</div>
		</div>
	</main>
</body>
</html>