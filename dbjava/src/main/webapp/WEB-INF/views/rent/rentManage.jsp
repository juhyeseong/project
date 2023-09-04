<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../manageHeader.jsp" %>
	 <div class="hostManage">
      <div class="hostRent">
         <div class="hostRentTop">
            <h1>등록한 숙소들</h1>
            <a href="${cpath }/rent/hosting"><button>숙소 생성</button></a>
         </div>
         <div class="hostRentBottom">
            <div class="rentList">
               <div class="rentListHead">
                  <div class="title">숙소 이름</div>
                  <div class="price">숙소 가격</div>
                  <div class="category">카테고리</div>
                  <div class="roomType">방 타입</div>
                  <div class="address">주소</div>
                  <div class="discount">할인</div>
                  <div class="reservation">예약</div>
                  <div class="rentUpdate">수정</div>
                  <div class="rentState">상태</div>
               </div>
               <div class="rentListBody">
               <c:forEach var="rent" items="${rentList }">
                  <div class="rentListRow">
                     <div class="title">${rent.title }</div>
                     <div class="price"><fmt:formatNumber value="${rent.price }" groupingUsed="true"/>원</div>
                     <div class="category">${rent.category }</div>
                     <div class="roomType">${rent.roomType }</div>
                     <div class="address">${rent.address } ${rent.detailAddress }</div>
                     <div class="discount">${rent.discount }%</div>
                     <div class="reservation"><a href="${cpath }/reservation/reservationManage/${rent.idx }">예약 관리</a></div>
                     <div class="rentUpdate"><a href="${cpath }/rent/modify/${rent.idx }">업데이트</a></div>
                     <div class="rentState">
                        <c:if test="${rent.state == 0 }">등록 중</c:if>
                        <c:if test="${rent.state == 1 }">운영 중</c:if>
                        <c:if test="${rent.state == 2 }">휴식모드</c:if>
                     </div>
                  </div>
               </c:forEach>
               </div>
            </div>
         </div>
      </div>
   </div>
</body>
</html>