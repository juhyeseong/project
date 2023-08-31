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
							<li class="reportingManagement" style="background-color: #AFAB99;"><a href="${cpath }/admin/reporting">숙소 신고 현황</a></li>
						</ul>	
					</li>
					<li>
						댓글 관리
						<ul class="replyManagement">
							<li>댓글 신고 현황</li>
						</ul>
					</li>
				</ul>
			</div>
		</div>
		<div class="adminRight">
			<h2 class="adminTitle">숙소 신고 현황</h2>
			
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
			                <th>신고 내용</th>
			            </tr>
			        </thead>
			        <tbody>
			            <c:forEach var="dto" items="${list }">
				            <tr>
				            	<th>${dto.idx }</th>
				            	<th>${dto.userId }</th>
				            	<th>${dto.userName }</th>
				            	<th><a href="${cpath }/rent/room/${dto.rent}">${dto.title }</a></th>
				            	<th>${dto.content }</th>
				            <tr>
			            </c:forEach>
			        </tbody>
			    </table>
			</div>
		</div>
	</main>
</body>
</html>