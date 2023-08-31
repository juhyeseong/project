<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<main class="homeMain">
		<div class="categories">
            	<div class="categorieImgBox"><a href="${cpath }/rent/category/펜션"><img src="http://192.168.64.200/펜션.png" class="categoryImg" style="background-color : grey;"><p>펜션</p></a></div>
            	<div class="categorieImgBox"><a href="${cpath }/rent/category/풀빌라"><img src="http://192.168.64.200/풀빌라.png" class="categoryImg"><p>풀빌라</p></a></div>
                <div class="categorieImgBox"><a href="${cpath }/rent/category/호텔"><img src="http://192.168.64.200/호텔.png" class="categoryImg"><p>호텔</p></a></div>
                <div class="categorieImgBox"><a href="${cpath }/rent/category/리조트"><img src="http://192.168.64.200/리조트.png" class="categoryImg"><p>리조트</p></a></div>
                <div class="categorieImgBox"><a href="${cpath }/rent/category/글램핑"><img src="http://192.168.64.200/글램핑.png" class="categoryImg"><p>글램핑</p></a></div>
                <div class="categorieImgBox"><a href="${cpath }/rent/category/캠핑"><img src="http://192.168.64.200/캠핑.png" class="categoryImg"><p>캠핑</p></a></div>
                <div class="categorieImgBox"><a href="${cpath }/rent/category/게스트하우스"><img src="http://192.168.64.200/게스트하우스.png" class="categoryImg"><p>게스트하우스</p></a></div>
                <div class="categorieImgBox"><a href="${cpath }/rent/category/한옥"><img src="http://192.168.64.200/한옥.png" class="categoryImg"><p>한옥</p></a></div>
                <div class="categorieImgBox"> <a href="${cpath }/rent/category/료칸"><img src="http://192.168.64.200/료칸.png" class="categoryImg"><p>료칸</p></a></div>
       			<div class="categorieImgBox"> <button class="filter">필터</button></div>
        </div>
		<div class="roomBox">
			<c:forEach var="pension" items="${pensionList }">
				<a href="${cpath }/rent/room/${pension.idx}">
					<div class="room">
						<img src="${pension.filePath }" class="roomImg">
							 <span class="ellipsis">${pension.title}</span> 
							<span class="roomPrice"><fmt:formatNumber value="${pension.price }" groupingUsed="true" />원</span> 	
					</div>
				</a>
			</c:forEach>
		</div>		
	</main>

	 <!-- 기존모달 부분 -->
		<div id="myModal" class="modal">
		    <div class="modal-content">
		      <span class="close">×</span>
		      <p>가격 범위 지정하기</p>
		      <label for="minPrice">최소 가격</label>
		      <input type="number" id="minPrice"> ~
		      <label for="maxPrice">최대 가격</label>
		      <input type="number" id="maxPrice">
		      <button onclick="applyFilter()">숙소 보러가기 !</button>
		    </div>
		</div>
		
		
	<!-- 모달을 처리하는 JavaScript -->
	<script>
	// 모달을 열 버튼 가져오기
	var filterButton = document.querySelector(".filter");
	
	// 모달 가져오기
	var modal = document.getElementById("myModal");
	
	// 모달을 닫는 <span> 요소 가져오기
	var closeBtn = document.querySelector(".close");
	
	// 사용자가 버튼을 클릭하면 모달을 엽니다
	filterButton.onclick = function() {
	  modal.style.display = "block";
	}
	
	
	
	// 사용자가 <span> (x)을 클릭하면 모달을 닫습니다
	closeBtn.onclick = function() {
	  modal.style.display = "none";
	}
	
	// 사용자가 모달 외부 어느 곳이든 클릭하면 모달을 닫습니다
	window.onclick = function(event) {
	  if (event.target == modal) {
	    modal.style.display = "none";
	  }
	}


	
	// 필터를 적용하는 함수
	function applyFilter() {
	  var minPrice = document.getElementById("minPrice").value;
	  var maxPrice = document.getElementById("maxPrice").value;
	
	  var roomElements = document.querySelectorAll('.room'); // 모든 room elements를 가져옴

	  roomElements.forEach(function(room) {
	    var priceElement = room.querySelector('.roomPrice'); // 가격 정보가 있는 span 태그
	    var price = parseInt(priceElement.textContent.replace(/[^0-9]/g, ''), 10); // 숫자만 추출

	    if(price >= minPrice && price <= maxPrice) {
	      room.style.display = 'block'; // 조건에 맞으면 보임
	    } else {
	      room.style.display = 'none'; // 조건에 안 맞으면 숨김
	    }
	  });

	  // 모달을 닫음
	  var modal = document.getElementById("myModal");
	  modal.style.display = "none";
	}

	</script>



</body>
</html>