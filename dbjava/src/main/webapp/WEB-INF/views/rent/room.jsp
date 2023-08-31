<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../header.jsp"%>


<script>
	const cpath = '${cpath }'
</script>


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
				<div class="reservePeople">
					<input type="number" name="guestCount" placeholder="인원 수를 입력 해주세요">
				</div>
				<div class="reserveBtn">
					<input type="submit" value="예약하기">
				</div>
				<div class="reserveCal">
					<span class="roomPrice"></span> X <span class="nightValue">박</span>
				</div>
				<div class="reserveTotal" id="totalPrice">원</div>
				<input type="hidden" name="totalPrice"> 
				<input type="hidden" name="member" value="${login.idx }"> 
				<input type="hidden" name="rent" value="${dto.idx }">
			</div>
		</div>
	</form>
</div>

<div class="roomBtn">
	<ul class="tab">
		<li class="selected">숙소정보</li>
		<li>리뷰</li>
	</ul>
	<div class="box">
		<div class="menu1 selected">
			<pre>${dto.content }</pre>
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
					평균 별점: <span id="averageRating"></span> / 5
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
						</label> <input type="file" name="upload" required multiple id="file-input"
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
						<div class="reviewItem">
							<div class="reviewProfileBox">
								<img src="${dto.profile }">
							</div>
							<div class="reviewProfileInfo">
								<p>${dto.userNick }</p>
								<p class="starPoint">${dto.point }</p>
								<p>${dto.content }</p>

								<div class="carousel-container">
									<div class="carousel">
										<c:forEach var="filePath" items="${dto.filePathList}">
											<img class="reviewImgs" src="${filePath}" />
										</c:forEach>
									</div>
									<button class="prevButton"><</button>
									<button class="nextButton">></button>
									<c:if test="${login.idx == dto.member }">
										<a href="${cpath}/review/delete/${dto.idx}" class="deleteButton" onclick="deleteReview(${dto.idx}); return false;">ⓧ</a>
									</c:if>
								</div>
							</div>
						</div>
					</c:forEach>
					<div class="reviewSpace"><hr></div>
				</div>
			</c:if>
		</div>
	</div>
</div>



<!-- JQuery 관련 -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script>
      const roomPriceList = document.querySelectorAll('.roomPrice')
      const price = ${dto.price }
      const formatPrice = new Intl.NumberFormat().format(price)
      let index = 0
      
      roomPriceList.forEach(roomPrice => {
         if(index == 0) {
            roomPrice.innerText = '₩ ' + formatPrice + ' / 박'
         }
         else {
        	 roomPrice.innerText = '₩ ' + formatPrice
         }
         index++
      })
</script>

<script>
   const submitBtn = document.querySelector('.reserveBtn > input[type="submit"]')   
   const totalPrice = document.querySelector('input[name="totalPrice"]')
   
   function payHandler(event) {
      event.preventDefault()
      
      const rent = document.querySelector('input[name="rent"]').value
      const member = document.querySelector('input[name="member"]').value
      const sDateString = document.querySelector('input[name="sDateString"]').value
      const eDateString = document.querySelector('input[name="eDateString"]').value
      const guestCount = document.querySelector('input[name="guestCount"]').value
      
      if(member == '') {
          alert('로그인 후 이용해주세요 ~ ')
          location.href = cpath + '/member/login'
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

      const url = cpath + '/kakaopay'
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
               totalPrice: totalPrice.value
            })
         }
      
      fetch(url, opt)
      .then(resp => resp.json())
      .then(json => {
         console.log('json 실행')
         const url = json.next_redirect_pc_url
         console.log(json.next_redirect_pc_url)
         location.href = url
      })
      .catch(error => {
         console.log(error)
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
	</script>

<script>
	tabList.forEach((element, index) => {
	    element.onclick = function() {
	
	        // 모든 탭의 selected 클래스를 제거한다
	        tabList.forEach(e => e.classList.remove('selected'))
	        boxList.forEach(e => e.classList.remove('selected'))
	
	        // 클릭된 항목은 selected 클래스를 추가하고 색상을 변경한다
	        tabList[index].classList.add('selected')
	        boxList[index].classList.add('selected')
	
	        // 추가: 선택된 탭의 글자 색상을 변경한다
	        tabList[index].style.color = "red"; // 선택한 탭 색상
	 
	        // 나머지 탭의 글자 색상을 원래 색상으로 변경한다
	        tabList.forEach((e, i) => {
	            if (i !== index) {
	                e.style.color = ""; // 원래 색상
	            }
	        });
	    }
	})
	</script>
<!-- 별점 스크립트 -->
<script>
	//HTML에서 별점 아이콘들을 선택합니다.
	const stars = document.querySelectorAll('.star');
	
	// 별점을 클릭할 때마다 이벤트를 처리합니다.
	stars.forEach((star, index) => {
	    star.addEventListener('click', () => {
	        // 클릭한 별 이후의 별들을 모두 활성화(색 변경)합니다.
	        for (let i = 0; i <= index; i++) {
	            stars[i].classList.add('active');
	        }
	        // 클릭한 별 이후의 별들을 비활성화(색 초기화)합니다.
	        for (let i = index + 1; i < stars.length; i++) {
	            stars[i].classList.remove('active');
	        }
	        
	        // 선택한 별점 값을 가진 숨겨진 입력 필드 업데이트
	        const starRatingInput = document.getElementById('starRating');
	        starRatingInput.value = index + 1;
	    });
	});
	</script>
<script>
	function printStars() {
	    const starPointElements = document.querySelectorAll('.starPoint');
	    
	    starPointElements.forEach(starPointElement => {
	        const numStars = parseInt(starPointElement.textContent);
	        if (!isNaN(numStars) && numStars > 0) {
	            // 별점을 표시하는 문자열을 초기화
	            let starRatingString = '';
	            for (let i = 0; i < numStars; i++) {
	                starRatingString += "⭐";
	            }
	            // 텍스트로 설정
	            starPointElement.textContent = starRatingString;
	        } else {
	            alert('올바른 숫자를 입력하세요.');
	        }
	    });
	}
	window.addEventListener('load', printStars);
	</script>


<!-- 리뷰 이미지 캐러셀 -->
<script>
  const reviewCarousels = document.querySelectorAll('.carousel'); // 모든 리뷰 캐러셀을 선택합니다.
  const prevButtons = document.querySelectorAll('.prevButton'); // 모든 이전 버튼을 선택합니다.
  const nextButtons = document.querySelectorAll('.nextButton'); // 모든 다음 버튼을 선택합니다.

  // 캐러셀을 초기화하고 현재 페이지를 추적하는 변수를 추가합니다.
  reviewCarousels.forEach((carousel, index) => {
    let currentPage = 0;

    // 페이지를 업데이트하고 보이지 않는 항목을 숨깁니다.
    function updatePage() {
      const itemsPerPage = 3; // 한 번에 보여줄 항목 수를 설정합니다.
      const reviewItems = carousel.querySelectorAll('.reviewImgs');

      reviewItems.forEach((item, itemIndex) => {
        if (itemIndex >= currentPage * itemsPerPage && itemIndex < (currentPage + 1) * itemsPerPage) {
          item.style.display = 'block';
        } else {
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
      const itemsPerPage = 3; // 한 번에 보여줄 항목 수를 설정합니다.
      const reviewItems = carousel.querySelectorAll('.reviewImgs');
      const totalPages = Math.ceil(reviewItems.length / itemsPerPage);

      if (currentPage < totalPages - 1) {
        currentPage++;
        updatePage();
      }
    }

    // 이전 버튼과 다음 버튼에 이벤트 리스너를 추가합니다.
    prevButtons[index].addEventListener('click', prevPage);
    nextButtons[index].addEventListener('click', nextPage);

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
        
        const price = ${dto.price }
        const totalPrice = document.querySelector('#totalPrice')
        const totalPriceValue = document.querySelector('input[name="totalPrice"]')
        totalPriceValue.value = price * nights
        totalPrice.innerText = new Intl.NumberFormat().format(price * nights) + '원'
   }
}

$(document).ready(function() {
    // 시작 날짜 입력란에 달력을 연결합니다.
    $("#sDateString").datepicker({
	    minDate: 0,  
	    onSelect: function(selectedDate) {
	        const startDate = $("#sDateString").datepicker("getDate");
	        const endDate = $("#eDateString").datepicker("getDate");
	
	        // 선택된 시작 날짜가 종료 날짜보다 크거나 같을 경우, 종료 날짜 이전날로 설정
	        if (endDate && startDate >= endDate) {
	            const prevDay = new Date(endDate);
	            prevDay.setDate(endDate.getDate() - 1);
	            $("#sDateString").datepicker("setDate", prevDay);
	        }
	
	        const sDateString = $("#sDateString").val();
	        const eDateString = $("#eDateString").val();
	
	        totalPriceHandler(sDateString, eDateString);
	    }
	});
    
    // 종료 날짜 입력란에 달력을 연결합니다.
    $("#eDateString").datepicker({
        minDate: 0, 
        beforeShow: function(input, inst) {
            // 시작 날짜 이후의 날짜만 선택 가능하도록 설정
            const minDate = $("#sDateString").datepicker("getDate");
            if (minDate) {
                $(this).datepicker("option", "minDate", minDate);
            }
        },
        onSelect: function(selectedDate) {
            const startDate = $("#sDateString").datepicker("getDate");
            const endDate = $("#eDateString").datepicker("getDate");
            if (startDate && endDate <= startDate) {
                // 선택된 종료 날짜가 시작 날짜보다 작거나 같을 경우, 시작 날짜 다음날로 설정
                const nextDay = new Date(startDate);
                nextDay.setDate(startDate.getDate() + 1);
                $("#eDateString").datepicker("setDate", nextDay);
            }
            const sDateString = $("#sDateString").val();
            const eDateString = $("#eDateString").val();
            
            totalPriceHandler(sDateString, eDateString);
        }
    });
});
</script>
<!--평균 별점 스크립트 -->
<script>
	const totalPoints = '${totalPoints}'
	const totalReviews = '${totalReviews}'
    const averageRating = totalPoints / totalReviews;
    document.getElementById('averageRating').innerText = averageRating.toFixed(1);
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
            alert('리뷰 삭제 성공');
            location.reload();
        })
        .catch(error => {
            alert('리뷰 삭제 실패')
        });
    }
}

</script>

</body>
</html>