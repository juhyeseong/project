<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@include file="../header.jsp"%>
	<div class="roomExplain">
	   <div class="roomImgBox">
	      <div class="roomBig">
	         <img src="${dto.filePathList[0] }">
	      </div>
	      <div class="roomSmall">
	         <c:forEach var="filePath" items="${dto.filePathList }">
	            <img src="${filePath }">
	         </c:forEach>
	      </div>
	   </div>
	
	   <div class="reservationInfo">
		   <form>
		      <div class="reserveInfo">
		         <div class="reserveSpace">
		            <div class="roomText">
		               <p class="roomTitle">${dto.title }</p>
		               <p class="roomAddress">${dto.address }${dto.detailAddress }</p>
		               <p class="roomPrice"></p>
		            </div>
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
		            <div class="priceSpace hidden">
		               <div class="reserveCal">
		                  <span class="roomPrice"></span> X <span class="nightValue">박</span>
		               </div>
		               <div class="reserveTotal" id="totalPrice">원</div>
		            </div>
		            <input type="hidden" name="totalPrice"> 
		            <input type="hidden" name="member" value="${login.idx }"> 
		            <input type="hidden" name="rent" value="${dto.idx }">
		         </div>
		            <c:if test="${not empty login && count > 0}">   
		               <span class="roomReport">숙소 신고하기</span>
		            </c:if>
		      </div>
		   </form>
	   </div>
	</div>
	
	<div class="roomBtn">
	   <ul class="tab">
	      <li class="selected" style="color: rgb(248, 33, 92);">숙소정보</li>
	      <li>리뷰</li>
	   </ul>
	   <div class="box">
	      <div class="menu1 selected">
	         <textarea class="roomContent" readonly>${dto.content }</textarea>
	      </div>
	      <div class="menu2">
	      
	         <c:set var="totalPoints" value="0" />
	         <c:set var="totalReviews" value="0" />
	
	         <c:forEach var="dto" items="${reviewList}">
	            <c:set var="totalPoints" value="${totalPoints + dto.point}" />
	            <c:set var="totalReviews" value="${totalReviews + 1}" />
	         </c:forEach>
	
	         <c:if test="${totalReviews > 0}">
	            <p>
	               평균 별점: <span id="averageRating"></span> / 5.0
	            </p>
	         </c:if>
	         <c:if test="${not empty login}">
	            <form method="POST" enctype="multipart/form-data">
	               <div class="rating">
	                  <span class="star">&#9733;</span> <span class="star">&#9733;</span>
	                  <span class="star">&#9733;</span> <span class="star">&#9733;</span>
	                  <span class="star">&#9733;</span> <input type="hidden" name="point"
	                     id="starRating" value="5">
	                  <!-- 별점을 저장할 숨겨진 입력 필드 추가 -->
	               </div>
	               <p>
	                  <textarea class="reviewWrite" name="content" required></textarea>
	                  <label for="file-input" class="file-icon2"> <img
	                     src="http://192.168.64.200/camera.png" alt="File Icon">
	                  </label> <input type="file" name="upload" multiple id="file-input"
	                     style="display: none;">
	               </p>
	               <p class = "reviewSubmit">
	                  <input type="submit" value="리뷰 작성">
	               </p>
	            </form>
	         </c:if>
	         <c:if test="${not empty reviewList }">
	            <div class="review">
	               <c:forEach var="dto" items="${reviewList}">
	                  <c:if test="${dto.reportStatus == 0 }">
		                  <div class="reviewItem">
		                     <div class="reviewProfileBox">
		                        <img src="${dto.profile }">
		                     </div>
		                     <div class="reviewContentBox">
			                     <div class="reviewProfileInfo">
			                        <p>${dto.userNick }</p>
			                        <p class="starPoint">${dto.point }</p>
			                        <textarea readonly>${dto.content }</textarea>
			                     </div>
			                     <div class="reviewImgsBox">
			                        <div class="carousel-container">
			                           <div class="carousel reviewImgBox">
										<c:if test="${not empty dto.filePathList }">
											<c:forEach var="filePath" items="${dto.filePathList}">
												<img class="reviewImgs" src="${filePath}" />
											</c:forEach>
										<c:if test="${dto.filePathList.size() >= 2}">
											<button class="prevButton"><</button>
											<button class="nextButton">></button>
										</c:if>
										</c:if>
			                           </div>
			                        </div>
			                     </div>
								<c:if test="${login != null && login.idx != dto.member}">
									<span class="reviewReport" data-review-idx="${dto.idx}">신고하기</span>
								</c:if>
								<c:if test="${login.idx == dto.member }">
								<a href="${cpath}/review/delete/${dto.idx}" class="deleteButton" onclick="deleteReview(${dto.idx}); return false;">ⓧ</a>
								</c:if>
		                     </div>
		                  </div>
	                  </c:if>
	                  <c:if test="${dto.reportStatus == 1 }">
	                  	<div class="reviewItem">
	                  		<div class="reviewItem blur">
		                     <div class="reviewProfileBox">
		                        <img src="${dto.profile }">
		                     </div>
		                     <div class="reviewContentBox">
			                     <div class="reviewProfileInfo">
			                        <p>${dto.userNick }</p>
			                        <p class="starPoint">${dto.point }</p>
			                        <textarea readonly>${dto.content }</textarea>
			                     </div>
			                     <div class="reviewImgsBox">
			                        <div class="carousel-container">
			                           <div class="carousel reviewImgBox">
										<c:if test="${not empty dto.filePathList }">
											<c:forEach var="filePath" items="${dto.filePathList}">
												<img class="reviewImgs" src="${filePath}" />
											</c:forEach>
										<c:if test="${dto.filePathList.size() >= 2}">
											<button class="prevButton"><</button>
											<button class="nextButton">></button>
										</c:if>
										</c:if>
			                           </div>
			                        </div>
			                     </div>
								<c:if test="${login != null && login.idx != dto.member}">
									<span class="reviewReport" data-review-idx="${dto.idx}">신고하기</span>
								</c:if>
								<c:if test="${login.idx == dto.member }">
								<a href="${cpath}/review/delete/${dto.idx}" class="deleteButton" onclick="deleteReview(${dto.idx}); return false;">ⓧ</a>
								</c:if>
		                     </div>
		                  </div>
							<div class="overlay">
								<div class="overlayBlur">
									<c:if test="${login.idx == dto.member }">
										<a href="${cpath}/review/delete/${dto.idx}" class="deleteButton" onclick="deleteReview(${dto.idx}); return false;">ⓧ</a>
									</c:if>
									<span>이 댓글은 관리자에 의해 블락처리 되었습니다.</span>
								</div>
							</div>
	                  	</div>
	                  </c:if>
	               </c:forEach>
	               <div class="reviewSpace"><hr></div>
	            </div>
	         </c:if>
	      </div>
	   </div>
	</div>
	
	<!-- 숙소 신고 모달 창 -->
	<div class="reportModal" id="reportModal">
	    <div class="reportModal-content modalSize">
	        <span class="close" id="closeModal">&times;</span>
	        <h2>이 숙소를 신고하는 이유를 알려주세요</h2>
	        <p class="modalP">이 내용은 호스트가 볼 수 없습니다</p>
	        <div class="reportBox">
	           <form method="post" id="reportForm" action="${cpath }/admin/userReport">
	            <input type="hidden" name="rent" value="${dto.idx }">
	            <input type="hidden" name="member" value="${login.idx }">
	            <div class="reportRow">
	                  <label for="reportOne">부정확하거나 틀린 정보가 있어요</label>
	                  <input type="radio" id="reportOne" name="reportType" value="부정확하거나 틀린 정보가 있어요" checked>
	            </div>
	            <div class="reportRow">
	                  <label for="reportTwo">실제 숙소가 아닙니다</label>
	                  <input type="radio" id="reportTwo" name="reportType" value="실제 숙소가 아닙니다">
	            </div>
	            <div class="reportRow">
	                  <label for="reportThree">사기입니다</label>
	                  <input type="radio" id="reportThree" name="reportType" value="사기입니다">
	            </div>
	            <div class="reportRow">
	                  <label for="reportFour">불쾌합니다</label>
	                  <input type="radio" id="reportFour" name="reportType" value="불쾌합니다">
	            </div>
	            <div class="reportRow">
	                  <label for="reportFive">기타</label>
	                  <input type="radio" id="reportFive" name="reportType" value="기타">
	            </div>
	            <div class="reportContent">
	                  <textarea name="content" required></textarea>
	            </div>
	               <button class="reportBtn" type="submit">신고하기</button>
	          </form>
	        </div>
	    </div>
	</div>
	<!-- 댓글 신고 모달 창 -->
	<div class="reportModal" id="reviewReportModal">
	    <div class="reportModal-content modalSize">
	        <span class="close" id="reviewCloseModal">&times;</span>
	        <h2>이 댓글을 신고하는 이유를 알려주세요</h2>
	        <p class="modalP">이 내용은 호스트가 볼 수 없습니다</p>
	        <div class="reportBox">
	           <form method="post" id="reviewReportForm" action="${cpath }/admin/reviewReport">
	            <input type="hidden" name="review">
	            <input type="hidden" name="member" value="${login.idx }">
	            <div class="reportRow">
	                  <label for="reportOne">욕설 또는 혐오 발언</label>
	                  <input type="radio" id="reportOne" name="reportType" value="욕설 또는 혐오 발언" checked>
	            </div>
	            <div class="reportRow">
	                  <label for="reportTwo">스팸 또는 광고</label>
	                  <input type="radio" id="reportTwo" name="reportType" value="스팸 또는 광고">
	            </div>
	            <div class="reportRow">
	                  <label for="reportThree">개인정보 유출</label>
	                  <input type="radio" id="reportThree" name="reportType" value="개인정보 유출">
	            </div>
	            <div class="reportRow">
	                  <label for="reportFour">위협 또는 폭력적</label>
	                  <input type="radio" id="reportFour" name="reportType" value="위협 또는 폭력적">
	            </div>
	            <div class="reportRow">
	                  <label for="reportFive">기타</label>
	                  <input type="radio" id="reportFive" name="reportType" value="기타">
	            </div>
	            <div class="reportContent">
	                  <textarea name="content" required></textarea>
	            </div>
	            	<input type="hidden" name="rentIdx" value="${dto.idx }" />
	               <button class="reportBtn" type="submit">신고하기</button>
	          </form>
	        </div>
	    </div>
	</div>

	<!-- JQuery 관련 -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<!-- iamport.payment.js -->
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
	<link rel="stylesheet"
	   href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script>
		const cpath = '${cpath }'
		const login = '${login}'
		const rentIdx = '${dto.idx }'
	</script>

	<script>
		const roomPriceList = document.querySelectorAll('.roomPrice')
		const price = ${dto.price }
		const formatPrice = new Intl.NumberFormat().format(price)
		let index = 0
		const minus = document.querySelector('.minusBtn')
		const plus = document.querySelector('.plusBtn')
		
		roomPriceList.forEach(roomPrice => {
		   if(index == 0) {
		      roomPrice.innerText = '₩ ' + formatPrice + ' / 박'
		   }
		   else {
		      roomPrice.innerText = '₩ ' + formatPrice
		   }
		   index++
		})
		
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
		const submitBtn = document.querySelector('.reserveBtn > input[type="submit"]')
		const title = '${dto.title }'
		const userName = '${login.userName }'
		const userPhone = '${login.phoneNum }'
		const userIdx = '${login.idx }'
		var IMP = window.IMP
		IMP.init("imp06272263")
	   
		function payHandler(event) {
			event.preventDefault()
			
			const rent = document.querySelector('input[name="rent"]').value
			const member = document.querySelector('input[name="member"]').value
			const sDateString = document.querySelector('input[name="sDateString"]').value
			const eDateString = document.querySelector('input[name="eDateString"]').value
			const guestCount = document.querySelector('.guestCountValue').innerText
			const totalPrice = document.querySelector('input[name="totalPrice"]')
			
			if(member == '') {
				let url = '/room/' + rentIdx
				url = encodeURIComponent(url)
			    location.href = cpath + '/member/login?url=' + url
			    return
			}
			if(sDateString == '' || eDateString == '') {
			    alert('체크인 또는 체크아웃 날짜를 선택해주세요 ~~')
			    return
			}
			if(guestCount == '') {
			    alert('인원 수를 정해주세요 ~')
			    return
			}
			 
			function dateFormat() {
				const date = new Date()
				const year = date.getFullYear()
				const month = String(date.getMonth() + 1).padStart(2, '0')
				const day = String(date.getDate()).padStart(2, '0')
				const hours = String(date.getHours()).padStart(2, '0')
				const minutes = String(date.getMinutes()).padStart(2, '0')
				const seconds = String(date.getSeconds()).padStart(2, '0')
			
			 	return year + month + day + hours + minutes + seconds
			 }
			 
			const date = dateFormat()
			const random = Math.floor(Math.random() * (1000000 - 1)) + 1
			const merchant_uid = date + '_' + random
		    
			IMP.request_pay({
				pg: "kakaopay",
				merchant_uid: merchant_uid,
				name: title,
				amount: totalPrice.value,
				buyer_name: userName,
				buyer_tel: userPhone
			}, function (resp) {
			 	if(resp.success) {
					const url = cpath + '/insertReservation'
					const opt = {
						method: 'POST',
						headers: {                  
						   'Content-Type': 'application/json; charset=utf-8'
						},
						body: JSON.stringify({   
							rent: rent,
							member: member,
							sDateString: sDateString,
							eDateString: eDateString,
							guestCount: guestCount,
							totalPrice: totalPrice.value,
							merchant_uid: merchant_uid
						})
					}
				 		  
					fetch(url, opt)
					.then(resp => resp.text())
					.then(text => {
						if(text != 0 && text != null) {
							alert('예약이 완료되었습니다 ~~')
							location.href = cpath + '/reservation/reservationList/' + userIdx
						}
						else {
							alert('예약에 실패하셨습니다 ~~')
						}
					})
				}
			 	else {
					alert(resp.error_msg)
				}
			})
		}
	
		submitBtn.onclick = payHandler
	</script>


	<!-- roomSmall 을 눌렀을 때 roomBig에 사진 크게 뜨게 하기 -->
	<script>
		const roomBigImg = document.querySelector('.roomBig > img')
		const roomSmallImgs = document.querySelectorAll('.roomSmall > img')
		
		function inputImgHandler(event) {
		   const src = event.target.src
		   
		   roomBigImg.src = src
		}
		
		roomSmallImgs.forEach(roomSmallImg => roomSmallImg.onclick = inputImgHandler)
	</script>


<!-- 탭 메뉴 -->
	<script>
		// nodeList
		const tabList = document.querySelectorAll('ul.tab > li')
		const boxList = document.querySelectorAll('div.box > div')
		
		tabList.forEach((element, index) => {
		    element.onclick = function() {
		
		        // 모든 탭의 selected 클래스를 제거한다
		        tabList.forEach(e => e.classList.remove('selected'))
		        boxList.forEach(e => e.classList.remove('selected'))
		
		        // 클릭된 항목은 selected 클래스를 추가한다
		        tabList[index].classList.add('selected')
		        boxList[index].classList.add('selected')
		    }
		})
	     
		tabList.forEach((element, index) => {
			element.onclick = function() {
			
			    // 모든 탭의 selected 클래스를 제거한다
			    tabList.forEach(e => e.classList.remove('selected'))
			    boxList.forEach(e => e.classList.remove('selected'))
			
			    // 클릭된 항목은 selected 클래스를 추가하고 색상을 변경한다
			    tabList[index].classList.add('selected')
			    boxList[index].classList.add('selected')
			
			    // 추가: 선택된 탭의 글자 색상을 변경한다
			    tabList[index].style.color = "#f8215c" // 선택한 탭 색상
			
			    // 나머지 탭의 글자 색상을 원래 색상으로 변경한다
			    tabList.forEach((e, i) => {
			        if (i !== index) {
			            e.style.color = "" // 원래 색상
			        }
			    })
			}
		})
   </script>
	<!-- 별점 스크립트 -->
	<script>
	   //HTML에서 별점 아이콘들을 선택합니다.
	   const stars = document.querySelectorAll('.star')
	   
	   // 별점을 클릭할 때마다 이벤트를 처리합니다.
	   stars.forEach((star, index) => {
	       star.addEventListener('click', () => {
	           // 클릭한 별 이후의 별들을 모두 활성화(색 변경)합니다.
	           for (let i = 0; i <= index; i++) {
	               stars[i].classList.add('active')
	           }
	           // 클릭한 별 이후의 별들을 비활성화(색 초기화)합니다.
	           for (let i = index + 1; i < stars.length; i++) {
	               stars[i].classList.remove('active')
	           }
	           
	           // 선택한 별점 값을 가진 숨겨진 입력 필드 업데이트
	           const starRatingInput = document.getElementById('starRating')
	           starRatingInput.value = index + 1
	       })
	   })
	</script>
	<script>
		function printStars() {
		    const starPointElements = document.querySelectorAll('.starPoint')
		    
		    starPointElements.forEach(starPointElement => {
		        const numStars = parseInt(starPointElement.textContent)
		        if (!isNaN(numStars) && numStars > 0) {
		            // 별점을 표시하는 문자열을 초기화
		            let starRatingString = ''
		            for (let i = 0; i < numStars; i++) {
		                starRatingString += "⭐"
		            }
		            // 텍스트로 설정
		            starPointElement.textContent = starRatingString
		        } else {
		            alert('올바른 숫자를 입력하세요.')
		        }
		    })
		}
		window.addEventListener('load', printStars)
	</script>


	<!-- 리뷰 이미지 캐러셀 -->
	<script>
	  const reviewCarousels = document.querySelectorAll('.carousel') // 모든 리뷰 캐러셀을 선택합니다.

	    // 캐러셀을 초기화하고 현재 페이지를 추적하는 변수를 추가합니다.
	    reviewCarousels.forEach((carousel, index) => {
	        let currentPage = 0;

	        // 페이지를 업데이트하고 보이지 않는 항목을 숨깁니다.
	        function updatePage() {
	            const itemsPerPage = 1 // 한 번에 보여줄 항목 수를 설정합니다.
	            const reviewItems = carousel.querySelectorAll('.reviewImgs'); // 변경: 클래스 이름이 올바른지 확인하세요.

	            reviewItems.forEach((item, itemIndex) => {
	                if (itemIndex >= currentPage * itemsPerPage && itemIndex < (currentPage + 1) * itemsPerPage) {
	                    item.style.display = 'block';
	                }
	                else {
	                    item.style.display = 'none';
	                }
	            });
	        }

	        // 이전 페이지로 이동하는 함수
	        function prevPage() {
	            if (currentPage > 0) {
	                currentPage--;
	                updatePage();
	            }
	        }

	        // 다음 페이지로 이동하는 함수
	        function nextPage() {
	            const itemsPerPage = 1; // 한 번에 보여줄 항목 수를 설정합니다.
	            const reviewItems = carousel.querySelectorAll('.reviewImgs'); // 변경: 클래스 이름이 올바른지 확인하세요.
	            const totalPages = Math.ceil(reviewItems.length / itemsPerPage);

	            if (currentPage < totalPages - 1) {
	                currentPage++;
	                updatePage();
	            }
	        }

	        // 변경: 이전 버튼과 다음 버튼에 이벤트 리스너를 추가합니다.
	        const prevButton = carousel.querySelector('.prevButton'); // 캐러셀 내의 이전 버튼을 선택합니다.
	        const nextButton = carousel.querySelector('.nextButton'); // 캐러셀 내의 다음 버튼을 선택합니다.

	        if (prevButton) {
	            prevButton.onclick = prevPage; // 이전 버튼의 클릭 이벤트에 함수를 연결합니다.
	        }
	        if (nextButton) {
	            nextButton.onclick = nextPage; // 다음 버튼의 클릭 이벤트에 함수를 연결합니다.
	        }

	        // 초기 페이지를 업데이트합니다.
	        updatePage();
	    });
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
		})
	
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
				
				const price = ${dto.price }
				const totalPrice = document.querySelector('#totalPrice')
				const totalPriceValue = document.querySelector('input[name="totalPrice"]')
				totalPriceValue.value = price * nights
				totalPrice.innerText = new Intl.NumberFormat().format(price * nights) + '원'
				
				const priceSpace = document.querySelector('.priceSpace')
				priceSpace.classList.remove('hidden')
			}
		}
	
		const reservationList = ${reservationList }
		$(document).ready(function() {
		    // 시작 날짜 입력란에 달력을 연결합니다.
		    $("#sDateString").datepicker({
		       minDate: 0,  
		       beforeShowDay:  function(date) {
		           const selectedDate = $("#eDateString").datepicker("getDate")
		           const rent = document.querySelector('input[name="rent"]').value
		           const url = cpath + '/reservation/selectReservation/' + rent
		         
		         if (date >= selectedDate && selectedDate != null) {
		            return [false, "unselectable"]
		         }
		         for (const reservation of reservationList) {
		             const startDate = new Date(reservation.startDate)
		             const endDate = new Date(reservation.endDate)
		             
		             if(startDate <= date && date < endDate) {
		                return [false, "unselectable"]
		             }
		          }
		
		           return [true, ""]
		         },
		         onSelect: function() {
		            const sDateString = document.querySelector('input[name="sDateString"]').value
		            const eDateString = document.querySelector('input[name="eDateString"]').value
		            
		            totalPriceHandler(sDateString, eDateString)
		         }
		   })
		    
		    // 종료 날짜 입력란에 달력을 연결합니다.
		    $("#eDateString").datepicker({
		        minDate: 0,
		        beforeShowDay: function(date) {
		           const selectedDate = $("#sDateString").datepicker("getDate")
		           
		           if(date <= selectedDate) {
		              return [false, "unselectable"]
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
		           const sDateString = document.querySelector('input[name="sDateString"]').value
		           const eDateString = document.querySelector('input[name="eDateString"]').value
		           
		           totalPriceHandler(sDateString, eDateString)
		        }
		    })
		})
	</script>

	<!--평균 별점 스크립트 -->
	<script>
		const totalPoints = '${totalPoints}'
		const totalReviews = '${totalReviews}'
		const averageRating = totalPoints / totalReviews
		const averageRatingDocument = document.getElementById('averageRating')
		 
		if(averageRatingDocument != null) {
		   averageRatingDocument.innerText = averageRating.toFixed(1)
		}
	</script>

	<!-- delete 코드 수행시 리로드하는 스크립트 -->
	<script>
	function deleteReview(reviewId) {
	    if (confirm("이 리뷰를 삭제하시겠습니까?")) {
	       fetch(`${cpath}/review/delete/` + reviewId, {
	            method: 'DELETE'
	        })
	        .then(response => response.text())
	        .then(data => {
	            alert('리뷰 삭제 성공')
	            location.reload()
	        })
	        .catch(error => {
	            alert('리뷰 삭제 실패')
	        })
	    }
	}
	</script>
	<!-- 숙소 신고 모달창 -->
	<script>
		const roomReportButton = document.querySelector('.roomReport')
		const reportModal = document.getElementById('reportModal')
		const closeModal = document.getElementById('closeModal')
		
		if (roomReportButton && reportModal && closeModal) {
			roomReportButton.addEventListener('click', () => {
			    reportModal.style.display = 'block'
			})
		}
		
		closeModal.addEventListener('click', () => {
		    reportModal.style.display = 'none'
		})
		
		window.addEventListener('click', (event) => {
		    if (event.target === reportModal) {
		        reportModal.style.display = 'none'
		    }
		})
	</script>

	<!-- 댓글 신고 모달창 -->
	<script>
		const reviewReportButtons = document.querySelectorAll('.reviewReport')
		const reviewReportModal = document.getElementById('reviewReportModal')
		const reviewCloseModal = document.getElementById('reviewCloseModal')
		
		// 리뷰 신고 모달창을 열기 위한 함수를 정의합니다.
		function openReviewReportModal(reviewIdx) {
		    reviewReportModal.style.display = 'block'
		    const hiddenInput = document.querySelector('input[name="review"]')
		    hiddenInput.value = reviewIdx
		}
		
		// 각 리뷰 신고 버튼에 이벤트 리스너를 추가합니다.
		reviewReportButtons.forEach((button) => {
		    button.addEventListener('click', (event) => {
		        event.preventDefault() // 버튼의 기본 동작을 막습니다.
		        const reviewIdx = button.getAttribute('data-review-idx') // 데이터 속성에서 리뷰 인덱스를 가져옵니다.
		        openReviewReportModal(reviewIdx) // 모달창을 열기 위한 함수를 호출합니다.
		    })
		})
		
		// 모달창을 닫는 코드입니다.
		reviewCloseModal.addEventListener('click', () => {
		    reviewReportModal.style.display = 'none'
		})
		
		window.addEventListener('click', (event) => {
		    if (event.target === reviewReportModal) {
		        reviewReportModal.style.display = 'none'
		    }
		})
	</script>

</body>
</html>