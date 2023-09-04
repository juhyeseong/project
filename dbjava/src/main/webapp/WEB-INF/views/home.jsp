<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
	<div class="homeMain">
		<div class="categories">
            	<div class="categoryImgBox">
            		<a href="${cpath }/rent/category/펜션">
            			<img src="http://192.168.64.200/펜션.png" class="categoryImg" style="background-color : grey;">
            			펜션
            		</a>
            	</div>
            	<div class="categoryImgBox">
            		<a href="${cpath }/rent/category/풀빌라">
            			<img src="http://192.168.64.200/풀빌라.png" class="categoryImg">
            			풀빌라
            		</a>
            	</div>
                <div class="categoryImgBox">
	                <a href="${cpath }/rent/category/호텔">
	                	<img src="http://192.168.64.200/호텔.png" class="categoryImg">
	                	호텔
	                </a>
	            </div>
                <div class="categoryImgBox">
                	<a href="${cpath }/rent/category/리조트">
                		<img src="http://192.168.64.200/리조트.png" class="categoryImg">
                		리조트
                	</a>
                </div>
                <div class="categoryImgBox">
                	<a href="${cpath }/rent/category/글램핑">
                		<img src="http://192.168.64.200/글램핑.png" class="categoryImg">
                		글램핑
                	</a>
                </div>
                <div class="categoryImgBox">
                	<a href="${cpath }/rent/category/캠핑">
                		<img src="http://192.168.64.200/캠핑.png" class="categoryImg">
                		캠핑
                	</a>
                </div>
                <div class="categoryImgBox">
               		<a href="${cpath }/rent/category/게스트하우스">
               			<img src="http://192.168.64.200/게스트하우스.png" class="categoryImg">
               			게스트하우스
               		</a>
               	</div>
                <div class="categoryImgBox">
                	<a href="${cpath }/rent/category/한옥">
                		<img src="http://192.168.64.200/한옥.png" class="categoryImg">
                		한옥
                	</a>
                </div>
                <div class="categoryImgBox">
                	<a href="${cpath }/rent/category/료칸">
                		<img src="http://192.168.64.200/료칸.png" class="categoryImg">
                		료칸
                	</a>
                </div>
      			<div class="categoryImgBox">
      				<button class="filter">필터✔️</button>
      			</div>
        </div>
		<div class="roomBox">
			<c:forEach var="dto" items="${rentList }">
					<div class="room">
						<a href="${cpath }/rent/room/${dto.idx}">
							<img src="${dto.filePath }" class="roomImg">
						</a>
						<div class="roomItemInfo">
							<div>
								<span class="ellipsis">${dto.title}</span>
								<span class="roomPrice"><fmt:formatNumber value="${dto.price }" groupingUsed="true" />원</span> 
							    <span class="roomInfo">${dto.information }</span> 
							</div>
							<div>
								<c:if test="${dto.wishCount == 0 }">
									<img class="wish" src="http://192.168.64.200/blankHeart.png">
								</c:if>
								<c:if test="${dto.wishCount != 0 }">
									<img class="wish" src="http://192.168.64.200/heart.png">
								</c:if>
							</div>
							<input type="hidden" value="${dto.wishCount }">
							<input type="hidden" value="${dto.idx }">
						</div>
					</div>
			</c:forEach>
		</div>		
	</div>
 
	<!-- 기존 모달 부분 -->
	<div id="myModal" class="modal">
	    <div class="modal-content">
	        <span class="close">×</span>
			<p> - 가격 - </p>
				<input type="radio" name="priceSort" id="lowPriceRadio" value="low" onclick="sortRooms()">🔻최저가 순
				<input type="radio" name="priceSort" id="highPriceRadio" value="high" onclick="sortRooms()">🔺최고가 순
		      <p> - 편의시설 - </p>
		       <span>필수</span> 
		       		<br>
		       		<div class="checkBoxContainer">
		       			<div class="checkBox1">
					       <input type="checkbox" name="information"  value="무선 인터넷"   class="infoCheckbox"> 무선 인터넷 📶 <br>
					       <input type="checkbox" name="information" value="주방" class="infoCheckbox"> 주방 🥄 <br>
					       <input type="checkbox" name="information" value="세탁기"  class="infoCheckbox"> 세탁기 👚  <br>
					       <input type="checkbox" name="information" value="에어컨" class="infoCheckbox"> 에어컨 ❄️ <br>
				     	  </div>
					       <div class="checkBox2">
						       <input type="checkbox" name="information" value="TV"   class="infoCheckbox"> TV 📺 <br>
						       <input type="checkbox" name="information" value="세탁기"  class="infoCheckbox"> 컴퓨터 🖥️ <br>
						       <input type="checkbox" name="information" value="주변 무료 주차"  class="infoCheckbox"> 주변 무료 주차 🚗 <br>
						       <input type="checkbox" name="information" value="주변 유료 주차"   class="infoCheckbox"> 주변 유료 주차 💰<br>
					       </div>
				       </div>
				      <p> - 그 밖의 편의시설 - </p>
				      <div class="checkBoxContainer">
		       			<div class="checkBox1">
					       <input type="checkbox" name="information"  value="수영장"   class="infoCheckbox"> 수영장 🏊🏻 <br>
					       <input type="checkbox" name="information" value="욕조" class="infoCheckbox"> 욕조 🛁<br>
					       <input type="checkbox" name="information" value="피아노"  class="infoCheckbox"> 피아노🎹 <br>
				     	  </div>
					       <div class="checkBox2">
						       <input type="checkbox" name="information" value="바베큐 그릴" class="infoCheckbox"> 바베큐 그릴 🍖<br>
							   <input type="checkbox" name="information" value="키즈"   class="infoCheckbox"> 키즈 🧒🏻 <br>
						       <input type="checkbox" name="information" value="무료영화 OTT"  class="infoCheckbox"> 무료영화 OTT 🍿 <br>
					       </div>
					       <div class="checkBox3">
						       <input type="checkbox" name="information" value="운동기구"  class="infoCheckbox"> 운동기구 🎾<br>
						       <input type="checkbox" name="information" value="계곡과 인접"   class="infoCheckbox"> 계곡과 인접 ⛰️ <br>
						       <input type="checkbox" name="information" value="해변과 인접"   class="infoCheckbox"> 해변과 인접 🏖️<br>
						    </div>
				       </div>
				       <p> - 안전관련 물품 - </p>
				      	   <input type="checkbox" name="information"  value="수영장"   class="infoCheckbox"> 구급상자 🚑 <br>
					       <input type="checkbox" name="information" value="욕조" class="infoCheckbox"> 화재 경보기 🚒<br>
					       <input type="checkbox" name="information" value="피아노"  class="infoCheckbox"> 소화기🧯 <br>
				     <br><br>          
	        <button onclick="applyFilter()" class="seeFilter">숙소 보러가기 !</button>
	    </div>
	</div>
	
	<!-- 모달을 처리하는 JavaScript -->
	<script>
	    // 모달을 열 버튼 가져오기
	    var filterButton = document.querySelector(".filter")
	    // 모달 가져오기
	    var modal = document.getElementById("myModal")
	    // 모달을 닫는 <span> 요소 가져오기
	    var closeBtn = document.querySelector(".close")
	    // 찜 버튼
	    const wishBtnList = document.querySelectorAll('.wish')
	    const loginIdx = '${login.idx }'
	    const cpath = '${cpath }'
	    
	    // 찜 handler
	    function wishHandler(event) {
	    	const target = event.target
	    	const wishCount = target.parentNode.parentNode.children[2]
	    	const rentIdx = target.parentNode.parentNode.children[3]
	    	const opt = {
    				method: 'POST',
    				headers:  {
    					'CONTENT-TYPE' : 'application/json; charset=utf-8'
    				},
    				body: JSON.stringify({
    					rent: rentIdx.value,
    					member: loginIdx
    				})
    		}
	    	
	    	if(wishCount.value == 0 && loginIdx != '') {
	    		const url = cpath + '/wishList/createWishList'
	    		
	    		fetch(url, opt)
		    	location.reload()
	    	}
	    	if(wishCount.value != 0 && loginIdx != '') {
	    		const url = cpath + '/wishList/deleteWishList'
	    		
	    		
	    		fetch(url, opt)
	    		location.reload()
	    	}
	    	
	    }
	    
	    // 사용자가 버튼을 클릭하면 모달을 엽니다
	    filterButton.onclick = function() {
	        modal.style.display = "block"
	    }
	
	    // 사용자가 <span> (x)을 클릭하면 모달을 닫습니다
	    closeBtn.onclick = function() {
	        modal.style.display = "none"
	    }
	
	    // 사용자가 모달 외부 어느 곳이든 클릭하면 모달을 닫습니다
	    window.onclick = function(event) {
	        if (event.target == modal) {
	            modal.style.display = "none"
	        }
	    }
	
	    // 필터를 적용하는 함수
	    function applyFilter() {
	        var roomElements = document.querySelectorAll('.room') // 모든 room elements를 가져옴
	        var selectedAmenities = getSelectedAmenities()    // 편의시설 요소들을 가져옴
	        var checkboxes = document.querySelectorAll('.infoCheckbox')		// 여러개 체크박스들을 모두 가져옴
	        var selectedFilters = []						// 선택된 체크박스 값을 저장할 배열을 만듦
	        var priceSort = getSelectedPriceSort()
	        
	        // 체크박스를 순회하면서 선택된 체크박스 값을 배열에 추가
	        checkboxes.forEach(function (checkbox){
	        	if(checkbox.checked){
	        		selectedFilters.push(checkbox.value)
	        	}
	        })
	        
	        roomElements.forEach(function(room) {
	
	            var amenitiesElement = room.querySelector('.roomInfo')
	            var amenities = amenitiesElement.textContent
	            
	            // 선택된 편의시설이 있는지 확인
	            var hasSelectedAmenities = selectedAmenities.every(function (amenity) {
	            	return amenities.indexOf(amenity) !== -1
	            })
	           
	            if(hasSelectedAmenities) {
	                room.style.display = 'block' // 조건에 맞으면 보임
	            } else {
	                room.style.display = 'none' // 조건에 안 맞으면 숨김
	            }
	     
	            
	        });
	     // 가격 정렬
	        if (priceSort === 'low') {
	            // 최저가 순으로 정렬
	            var sortedRooms = Array.from(roomElements).sort(function (a, b) {
	                var priceA = parseInt(a.querySelector('.roomPrice').textContent.replace(/[^\d]/g, ''))
	                var priceB = parseInt(b.querySelector('.roomPrice').textContent.replace(/[^\d]/g, ''))
	                return priceA - priceB
	            });
	        } else if (priceSort === 'high') {
	            // 최고가 순으로 정렬
	            var sortedRooms = Array.from(roomElements).sort(function (a, b) {
	                var priceA = parseInt(a.querySelector('.roomPrice').textContent.replace(/[^\d]/g, ''))
	                var priceB = parseInt(b.querySelector('.roomPrice').textContent.replace(/[^\d]/g, ''))
	                return priceB - priceA
	            });
	        }
	
	        // 정렬된 방을 다시 추가
	        var roomContainer = document.querySelector('.roomBox');
	        roomContainer.innerHTML = ''
	        sortedRooms.forEach(function (room) {
	            roomContainer.appendChild(room)
	        });
	    
	        // 모달을 닫음
	        modal.style.display = "none"
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
		 // 가격 정렬 방식을 가져오는 함수
	    function getSelectedPriceSort() {
	        var lowPriceRadio = document.getElementById('lowPriceRadio');
	        if (lowPriceRadio.checked) {
	            return 'low'
	        }
	
	        var highPriceRadio = document.getElementById('highPriceRadio');
	        if (highPriceRadio.checked) {
	            return 'high'
	        }
	
	        // 기본값: 최저가 정렬
	        return 'low'
	    }
		 
	    wishBtnList.forEach(wishBtn => wishBtn.onclick = wishHandler)
	</script>
</body>
</html>