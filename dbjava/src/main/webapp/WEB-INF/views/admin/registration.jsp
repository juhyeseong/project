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
							<li class="reservationManagementList" style="background-color: #f1f1f1;"><a href="${cpath }/admin/registration">숙소 등록 관리</a></li>
							<li class="reservationManagementList"><a href="${cpath }/admin/payment">결제 내역</a></li>
						</ul>	
					</li>
				</ul>
			</div>
		</div>
		<div class="adminRight">
			<h2 class="adminTitle">숙소 등록 관리</h2>
			
			<div class="registrationTableBox">
				<table class="registrationTable" border="1" style="width: 100%; margin-top: 20px;">
				    <thead>
				      <tr>
				        <th>숙소 ID</th>
				        <th>숙소 이름</th>
				        <th>위치</th>
				        <th>가격</th>
				        <th>상태</th>
				        <th>액션</th>
				      </tr>
				    </thead>
				    <tbody>
				    	<c:forEach var="dto" items="${list }">
					      <tr>
					        <td>${dto.idx }</td>
					        <td><a href="${cpath }/rent/room/${dto.idx}">${dto.title }</a></td>
					        <td>
					        	${dto.address }
					        	${dto.detailAddress }
					        </td>
					        <td style="text-align: right;"><fmt:formatNumber value="${dto.price}" groupingUsed="true" /> 원</td>
					        <td>
					        	<c:choose>
					        		<c:when test="${dto.state == 0}">
					        			<span>대기</span>
					        		</c:when>
					        		<c:when test="${dto.state == 1}">
					        			<span>수락 </span>
					        		</c:when>
					        		<c:when test="${dto.state == 2}">
					        			<span>휴업</span>
					        		</c:when>
					        	</c:choose>
					        	
					        </td>
					        <td>
					          <a href="${cpath }/admin/permit/${dto.idx}"><button class="registrationPermitBtn">수락</button></a>
					          <a href="${cpath }/admin/cencel/${dto.idx}"><button class="registrationCencelBtn">취소</button></a>
					        </td>
					      </tr>
				    	</c:forEach>
				      <!-- More rows can be added here -->
				    </tbody>
				  </table>
			  </div>
			  <div class="paging">
				<c:if test="${paging.prev }">
					<a href="${cpath }/admin/registration?page=${paging.begin - paging.perPage}">[이전]</a>
				</c:if>
					
				<c:forEach var="i" begin="${paging.begin }" end="${paging.end }">
					<a href="${cpath }/admin/registration?page=${i}">[${i }]</a>
				</c:forEach>
					
				<c:if test="${paging.next }">
					<a href="${cpath }/admin/registration?page=${paging.end + 1}">[다음]</a>
				</c:if>
			  </div>
		</div>
	</main>
</body>
</html>