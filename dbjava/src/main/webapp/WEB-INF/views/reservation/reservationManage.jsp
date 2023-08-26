<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../manageHeader.jsp" %>
	<div class="main">
		<div class="hostReservation">
			<div class="hostRentTop">
				<h1>예약관리</h1>
			</div>
			<div class="hostRentBottom">
				<div class="rentList">
					<div class="rentListHead">
						<div class="title">숙소 이름</div>
						<div class="price">일박 당 각격</div>
						<div class="category">카테고리</div>
						<div class="roomType">방 타입</div>
						<div class="address">주소</div>
						<div class="discount">할인</div>
					</div>
					<div class="rentListBody">
					<c:forEach var="rent" items="${rentList }">
						<div class="rentListRow">
							<div class="title">${rent.title }</div>
							<div class="price">${rent.price }원</div>
							<div class="category">${rent.category }</div>
							<div class="roomType">${rent.roomType }</div>
							<div class="address">${rent.address } ${rent.detailAddress }</div>
							<div class="discount">${rent.discount }%</div>
						</div>
					</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>