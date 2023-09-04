<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
	<div class="homeMain">
		<div class="roomBox">
			<c:forEach var="dto" items="${list }">
					<div class="room">
						<a href="${cpath }/rent/room/${dto.idx}">
							<img src="${dto.filePath }" class="roomImg">
						</a>
						<div class="roomItemInfo">
							<div>
								<span class="ellipsis">${dto.title}</span>
								<span class="roomPrice"><fmt:formatNumber value="${dto.price }" groupingUsed="true" />원</span> 
							    <span class="roomInfo">${dto.information }</span> 
							</div>
							<div>
								<c:if test="${dto.wishCount == 0 }">
									<img class="wish" src="http://192.168.64.200/blankHeart.png">
								</c:if>
								<c:if test="${dto.wishCount != 0 }">
									<img class="wish" src="http://192.168.64.200/heart.png">
								</c:if>
							</div>
						</div>
					</div>
			</c:forEach>
		</div>		
	</div>
</body>
</html>