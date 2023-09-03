<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
	<div class="hostReservation">
      <div class="hostRentTop">
         <h1>예약관리</h1>
      </div>
      <div class="hostRentBottom">
         <div class="rentList">
            <div class="rentListHead">
               <div class="title">숙소 이름</div>
               <div class="date">예약 기간</div>
               <div class="guestCount">인원수</div>
               <div class="totalPrice">총 결제 금액</div>
               <div class="phoneNum">숙소 전화번호</div>
               <div class="cancel">예약 취소</div>
            </div>
            <div class="rentListBody">
            <c:forEach var="reservation" items="${list }">
               <div class="rentListRow">
                  <div class="title">${reservation.title }</div>
                  <div class="date">${reservation.startDate } ~ ${reservation.endDate }</div>
                  <div class="guestCount">${reservation.guestCount }</div>
                  <div class="totalPrice">${reservation.totalPrice }</div>
                  <input type="hidden" value="${reservation.totalPrice }">
                  <div class="phoneNum">${reservation.phoneNum }</div>
                  <div class="cancel"><button>예약 취소</button></div>
                  <input type="hidden" value="${reservation.idx }">
                  <input type="hidden" value="${reservation.merchant_uid }">
               </div>
            </c:forEach>
            </div>
         </div>
      </div>
   </div>
   
	<!-- jQuery -->
	<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
	<!-- iamport.payment.js -->
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
    <script>
		const cancelBtnList = document.querySelectorAll('.cancel > button')
		const totalPriceList = document.querySelectorAll('.rentListRow > .totalPrice')
		const cpath = '${cpath }'
		
		totalPriceList.forEach(totalPrice => {
			const formatPrice = new Intl.NumberFormat().format(totalPrice.innerText)
	         
	        totalPrice.innerText = formatPrice + '원'
		})
		
		function cancelPay(access_token, reservationIdx, merchant_uid, totalPrice) {
			const url = cpath + '/cancelPay'
			const opt = {
    	            method: 'POST',
    	            headers: {                  
    	               'Content-Type': 'application/json; charset=utf-8'
    	            },
    	            body: JSON.stringify({   
    	               merchant_uid: merchant_uid,
    	               cancel_request_amount: totalPrice,
    	               access_token: access_token,
    	               reservationIdx: reservationIdx
    	            })
    	         }
			fetch(url, opt)
			.then(resp => resp.text())
			.then(text => {
				if(text != 0 && text != null) {
					alert('환불 및 예약이 취소되었습니다 ~~')
					location.reload()
				}
				else {
					alert('환불 실패하였습니다 ~\n계속 실패할 경우 관리자에게 문의주세요 ~~')
				}
			})
		}

		async function payCancelHandler(event) {
			if(confirm('정말 예약을 취소하시겠습니까 ?')) {
				const url = cpath + '/getToken'
				const json = await fetch(url).then(resp => resp.json())
				const access_token = json.response.access_token
				const totalPrice = event.target.parentNode.parentNode.children[4].value
				const reservationIdx = event.target.parentNode.parentNode.children[7].value
				const merchant_uid = event.target.parentNode.parentNode.children[8].value
				
				if(access_token != null) {
					cancelPay(access_token, reservationIdx, merchant_uid, totalPrice)
				}
			}
		}
		
		cancelBtnList.forEach(cancelBtn => cancelBtn.onclick = payCancelHandler)
	</script>
</body>
</html>