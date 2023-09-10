<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../manageHeader.jsp" %>
<script>
   
</script>

<style>

</style>
   <div class="hostReserve">
      <form method="POST">
           <fieldset>
           	   <legend>숙소 예약</legend>
           	   <input type="hidden" name="rent" value="${rent.idx }" ><br>
	           <input type="hidden" name="member" value="${login.idx }" readonly><br>
	           
	           <div class="reserveDate-container">
	               <div class="reserveDate">
	                 <label>체크인</label>
	                 <input type="text" name="sDateString" id="sDateString" placeholder="날짜 선택" autocomplete="off">
	                 <label>체크아웃</label>
	                 <input type="text" name="eDateString" id="eDateString" placeholder="날짜 선택" autocomplete="off">
	               </div>
	           </div>
	           <div class="reserveGuest">
	              <div>게스트 수</div> 
	              <div class="reserveGuestCount">
	                <input class="minusBtn" type="button" value="➖">
	                <span class="guestCountValue">1</span>
	                <input type="hidden" name="guestCount" value="1">
	                <input class="plusBtn" type="button" value="➕">
	              </div>
	           </div>
	           <div class="reserveBtn">
	              <input type="submit" value="예약하기">
	           </div>
	           <div class="priceSpace hidden">
	              <div class="reserveCal">
	                 <span class="roomPrice">
	                 	₩ <fmt:formatNumber value="${rent.price }" groupingUsed="true"/>
	                 </span>
	                  X 
	                 <span class="nightValue"></span>
	              </div>
	              <div class="reserveTotal" id="totalPrice">원</div>
	           </div>
	           <input type="hidden" name="totalPrice"> 
	           <input type="hidden" name="member" value="${login.idx }"> 
	           <input type="hidden" name="rent" value="${rent.idx }">
           </fieldset>
       </form>
    </div>

<!-- JQuery 관련 -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet"
   href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script src="${cpath }/resources/script/room.js"></script>
<script>
   const cpath = '${cpath }'
   const roomPriceList = document.querySelectorAll('.roomPrice')
   const minus = document.querySelector('.minusBtn')
   const plus = document.querySelector('.plusBtn')
   const roomPrice = document.querySelector('.roomPrice')
   const price = ${rent.price }

   minus.onclick = minusBtnHandler
   plus.onclick = plusBtnHandler
   
   $.datepicker.setDefaults({
      dateFormat: 'yy. mm. dd',
      monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
      monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
      dayNames: ['일', '월', '화', '수', '목', '금', '토'],
      dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
      dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
      showMonthAfterYear: true,
      yearSuffix: '년'
   });

   const reservationList = ${reservationList }
   $(document).ready(function() {
       // 시작 날짜 입력란에 달력을 연결합니다.
       $("#sDateString").datepicker({
          minDate: 0,  
          beforeShowDay:  function(date) {
              const selectedDate = $("#eDateString").datepicker("getDate");
              const rent = document.querySelector('input[name="rent"]').value;
              const url = cpath + '/reservation/selectReservation/' + rent;
            
            if (date >= selectedDate && selectedDate != null) {
               return [false, "unselectable"];
            }
            for (const reservation of reservationList) {
                const startDate = new Date(reservation.startDate)
                const endDate = new Date(reservation.endDate)
                
                if(startDate <= date && date < endDate) {
                   return [false, "unselectable"]
                }
             }

              return [true, ""];
            },
            onSelect: function() {
               const sDateString = $("#sDateString").val()
               const eDateString = $("#eDateString").val()
               
               totalPriceHandler(sDateString, eDateString)
            }
      });
       
       // 종료 날짜 입력란에 달력을 연결합니다.
       $("#eDateString").datepicker({
           minDate: 0,
           beforeShowDay: function(date) {
              const selectedDate = $("#sDateString").datepicker("getDate");
              
              if(date <= selectedDate) {
                 return [false, "unselectable"];
              }

              for (const reservation of reservationList) {
                const startDate = new Date(reservation.startDate)
                const endDate = new Date(reservation.endDate)
                
                
                if(startDate < date && date < endDate) {
                   return [false, "unselectable"]
                }
                if(selectedDate < date && endDate > selectedDate && endDate <= date) {
                   return [false, "unselectable"]
                }
             }
              
              return [true, ""]
           },
           onSelect: function() {
              const sDateString = $("#sDateString").val()
              const eDateString = $("#eDateString").val()
              
              totalPriceHandler(sDateString, eDateString)
           }
       });
   });
</script>
</body>
</html>