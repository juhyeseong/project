<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../manageHeader.jsp" %>
	<div class="hostReservation">
      <div class="hostRentTop">
         <h1>예약관리</h1>
         <a href="${cpath }/reservation/hostReservation"><button>예약 생성</button></a>
      </div>
      <div class="hostRentBottom">
         <div class="rentList">
            <div class="rentListHead">
               <div class="title">숙소 이름</div>
               <div class="date">예약 기간</div>
               <div class="name">예약자명</div>
               <div class="guestCount">인원수</div>
               <div class="phoneNum">예약자 전화번호</div>
            </div>
            <div class="rentListBody">
            <c:forEach var="reservation" items="${reservationList }">
               <div class="rentListRow">
                  <div class="title">${reservation.title }</div>
                  <div class="date">${reservation.startDate } ~ ${reservation.endDate }</div>
                  <div class="name">${reservation.userName }</div>
                  <div class="guestCount">${reservation.guestCount }</div>
                  <div class="phoneNum">${reservation.phoneNum }</div>
               </div>
            </c:forEach>
            </div>
         </div>
      </div>
   </div>
</body>
</html>