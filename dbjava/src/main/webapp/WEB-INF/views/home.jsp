<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<style>
	.roomInfo{
		display:none;
	}
	.seeFilter{
		margin-left:650px;
		
	}
	/* Hover effect for the button */
.seeFilter:hover {
    background-color : black;
}
/* Style for the range input */
input[type="range"] {
    width: 100%;
}

/* Style for the filter checkboxes */
input[type="checkbox"] {
    margin-right: 10px;
    width:30px;
    height:30px;
}
/* Style for the label */
label {
    display: block;
    margin-top: 10px;
    font-weight: bold;
}


</style>


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
			<c:forEach var="dto" items="${list }">
				<a href="${cpath }/rent/room/${dto.idx}">
					<div class="room">
						<img src="${dto.filePath }" class="roomImg">
						<span class="ellipsis">${dto.title}</span>
						<span class="roomPrice"><fmt:formatNumber value="${dto.price }" groupingUsed="true" />원</span> 
					    <span class="roomInfo">${dto.information }</span>
					</div>
				</a>
			</c:forEach>
		</div>		
	</main>
 
 
 
	<!-- 기존 모달 부분 -->
	<div id="myModal" class="modal">
	    <div class="modal-content">
	        <span class="close">×</span>
	        <p>가격 범위 지정하기</p>
	        <label for="priceRange">가격 범위</label>
	        <input type="range" id="priceRange" min="13000" max="290000" step="10">
	        <span id="priceRangeValue"></span>
		      <p>편의시설</p>
		       <span>필수</span> 
		       		<br>
				       <input type="checkbox" name="information" value="무선 인터넷"  onchange="applyFilter()" class="infoCheckbox"> 무선인터넷 
				       <input type="checkbox" name="information" value="주방" onchange="applyFilter()" class="infoCheckbox"> 주방 
				       <input type="checkbox" name="information" value="세탁기" onchange="applyFilter()" class="infoCheckbox"> 세탁기
				       <input type="checkbox" name="information" value="에어컨" onchange="applyFilter()" class="infoCheckbox"> 에어컨 
				       <input type="checkbox" name="information" value="TV" onchange="applyFilter()"  class="infoCheckbox"> TV 
				       <input type="checkbox" name="information" value="세탁기" onchange="applyFilter()" class="infoCheckbox"> 세탁기
				       <input type="checkbox" name="information" value="주변 무료 주차" onchange="applyFilter()" class="infoCheckbox"> 주변 무료 주차 
				       <input type="checkbox" name="information" value="주변 유료 주차" onchange="applyFilter()" class="infoCheckbox"> 주변 유료 주차 
				     <br><br>          
	        <button onclick="applyFilter()" class="seeFilter">숙소 보러가기 !</button>
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
    var priceRange = document.getElementById("priceRange");
    var priceRangeValue = document.getElementById("priceRangeValue");

    priceRange.oninput = function() {
        var selectedPrice = priceRange.value;
        priceRangeValue.innerHTML = "13000원 - " + selectedPrice + "원";
    } 
 

    // 필터를 적용하는 함수
    function applyFilter() {
        var maxPrice = priceRange.value;
        var roomElements = document.querySelectorAll('.room'); // 모든 room elements를 가져옴
        var selectedAmenities = getSelectedAmenities()
        
        roomElements.forEach(function(room) {
            var priceElement = room.querySelector('.roomPrice'); // 가격 정보가 있는 roomPrice 클래스
            var price = parseInt(priceElement.textContent.replace(/[^0-9]/g, ''), 10); // 숫자만 추출

            var amenitiesElement = room.querySelector('.roomInfo')
            var amenities = amenitiesElement.textContent
            
            // 선택된 편의시설이 있는지 확인
            var hasSelectedAmenities = selectedAmenities.every(function (amenity) {
            	return amenities.indexOf(amenity) !== -1
            })
           
            if(price <= maxPrice && hasSelectedAmenities) {
                room.style.display = 'block'; // 조건에 맞으면 보임
            } else {
                room.style.display = 'none'; // 조건에 안 맞으면 숨김
            }
            
            
        });

        // 모달을 닫음
        modal.style.display = "none";
    } 
    
    // 선택된 편의시설을 가져오는 함수
    function getSelectedAmenities(){
    	var amenities = document.getElementsByName("information")
    	var selectedAmenities = []
    	
    	for(var i = 0; i < amenities.length; i++){
    		if(amenities[i].checked){
    			selectedAmenities.push(amenities[i].value)
    		}
    	}
    	return selectedAmenities
    }

 
</script>


	
	

</body>
</html>