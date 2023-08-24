<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../header.jsp"%>

<div class="roomExplain">
	<div class="roomImgBox">
		<div class="roomBig">
			<img src="http://192.168.64.200/펜션.jpeg">
		</div>
		<div class="roomSmall">
			<img src="http://192.168.64.200/펜션.jpeg"> <img
				src="http://192.168.64.200/펜션.jpeg"> <img
				src="http://192.168.64.200/펜션.jpeg"> <img
				src="http://192.168.64.200/펜션.jpeg">
		</div>

	</div>

	<div class="roomText">
		<p class="roomTitle">${dto.title }</p>
		<p class="roomAddress">${dto.address }</p>
		<p class="roomPrice">${dto.price }\</p>
		<p class="roomDetailAddress">${dto.detailAddress }</p>
	</div>

</div>
<div class="roomBtn">
	<button class="tab_room">객실 안내 / 예약</button>
	<button class="tab_roomInfo">숙소 정보</button>
	<button class="tab_review">리뷰</button>
</div>

<c:if test="${not empty reviewList }">
	<div class="review">
		<c:forEach var="dto" items="${reviewList}">
			<img src="${dto.profile }">
			${dto.userNick }
			${dto.point }
			${dto.content }
		</c:forEach>
	</div>
</c:if>

<!-- 리뷰 -->
<script>
	
</script>

</body>
</html>