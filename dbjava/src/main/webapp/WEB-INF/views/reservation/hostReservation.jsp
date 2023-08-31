<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../manageHeader.jsp" %>
<script>
   const cpath = '${cpath }'
</script>

<style>

</style>

   <h1>예약 생성</h1>
   <div class="hostReserve">
      <form method="POST">
           <input type="hidden" name="rent" value="${rent.idx }" ><br>
     
           <label for="member">예약자 :</label>
           <input type="text" name="member" value="${login.idx }" readonly><br>
           
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
                        <input class="plusBtn" type="button" value="➕">
                      </div>
                  </div>
               <div class="reserveBtn">
                  <input type="submit" value="예약하기">
               </div>
               <div class="reservePrice hidden">
                  <div class="reserveCal">
                     <span class="roomPrice"></span> X <span class="nightValue">박</span>
                  </div>
                  <div class="reserveTotal" id="totalPrice">원</div>
               </div>
               <input type="hidden" name="totalPrice"> 
               <input type="hidden" name="member" value="${login.idx }"> 
               <input type="hidden" name="rent" value="${rent.idx }">
       </form>
    </div>

<!-- JQuery 관련 -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet"
   href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script>
   const roomPriceList = document.querySelectorAll('.roomPrice')
   const minus = document.querySelector('.minusBtn')
   const plus = document.querySelector('.plusBtn')
   const roomPrice = document.querySelector('.roomPrice')
   const price = ${rent.price }
   const formatPrice = new Intl.NumberFormat().format(price)
   roomPrice.innerText = '₩ ' + formatPrice


   function minusBtnHandler(event) {
      const guestCount = event.target.parentNode.children[1]
      const guestCountValue = +guestCount.innerText
   
      if(guestCountValue - 1 > 0) {
         guestCount.innerText = guestCountValue - 1
      }
   }

   function plusBtnHandler(event) {
      const rent = document.querySelector('input[name="rent"]')
      const guestCount = event.target.parentNode.children[1]
      const guestCountValue = +guestCount.innerText
      const url = cpath + '/reservation/selectGuestCount/' + rent.value
   
      fetch(url)
      .then(resp => resp.text())
      .then(text => {
         if(guestCountValue + 1 <= text) {
            guestCount.innerText = guestCountValue + 1
         }
      })
   }

   minus.onclick = minusBtnHandler
   plus.onclick = plusBtnHandler
</script>

<script>
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

   function totalPriceHandler(sDateString, eDateString) {
      if(sDateString != '' && eDateString != '') {
         sDateString = sDateString.replaceAll('. ', '-')
         eDateString = eDateString.replaceAll('. ', '-')
         const startDate = new Date(sDateString)
         const endDate = new Date(eDateString)
         const timeDifference = endDate - startDate
         const daysDifference = Math.floor(timeDifference / (1000 * 60 * 60 * 24))
         const nights = daysDifference
         const nightValue = document.querySelector('.nightValue')
         nightValue.innerText = nights + '박'
         
         const price = ${rent.price }
         const totalPrice = document.querySelector('#totalPrice')
         const totalPriceValue = document.querySelector('input[name="totalPrice"]')
         totalPriceValue.value = price * nights
         totalPrice.innerText = new Intl.NumberFormat().format(price * nights) + '원'
         
         const reservePrice = document.querySelector('.hidden')
         reservePrice.classList.remove('hidden')
      }
   }

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