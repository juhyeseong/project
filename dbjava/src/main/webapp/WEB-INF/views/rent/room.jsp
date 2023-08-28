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

   <div class="roomText">
      <p class="roomTitle">${dto.title }</p>
      <p class="roomAddress">${dto.address }</p>
      <p class="roomDetailAddress">${dto.detailAddress }</p>
      <p class="roomPrice">${dto.price }원</p>
   </div>

</div>
<div class="roomBtn">
   <ul class="tab">
      <li class="selected">숙소정보</li>
      <li>리뷰</li>
   </ul>
   <div class="box">
      <div class="menu1 selected">${dto.content }</div>
      <div class="menu2">
         <form method="POST"  enctype="multipart/form-data">
            <div class="rating">
               <span class="star">&#9733;</span> <span class="star">&#9733;</span>
               <span class="star">&#9733;</span> <span class="star">&#9733;</span>
               <span class="star">&#9733;</span> <input type="hidden" name="point"
                  id="starRating" value="5">
               <!-- 별점을 저장할 숨겨진 입력 필드 추가 -->
            </div>
            <p>
               <textarea class="reviewWrite" name="content"></textarea>
               <input type="file" name="upload" multiple>
            </p>
            <p>
               <input type="submit" value="리뷰 작성">
            </p>
         </form>

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
                        <img src="${dto.filePath }" />
                        <p>${dto.content }</p>
                     </div>
                  </div>
               </c:forEach>
         <%--       <c:forEach var="Img" items="${reviewImg }">
              		<img src="${Img.filePath }">
               </c:forEach>  --%>
            </div>
         </c:if>
      </div>
   </div>
</div>


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
	
	<!--  리뷰글 창 새로고침 시 자꾸 추가 되는 거 방지 ajax -->
	
	

</body>
</html>