<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
	<script>
		window.addEventListener("beforeunload", function(event) {
			event.returnValue = "변경사항이 저장되지 않을 수 있습니다";
		});
	</script>
	
	<div class="main">
		<!-- host 프론트 -->
		<div id="start">
			<div id="host">
				<div class="hostLeft">
					<h1>
						당신의<br>
						멋진 숙소를<br>
						등록해주세요 😉
					</h1>
				</div>
				<div class="hostRight">
					<div class="hostInfo">
						<div class="infoWrite">
							<h2>1. 숙소 정보를 알려주세요</h2>
							<span>
								숙소 위치와 숙박가능 인원 등<br>
								기본정보를 열려주세요
							</span>
						</div>
						<div class="infoImg">
							<img src="http://192.168.64.200/infoImgOne.jpeg">
						</div>
					</div>
					<div class="hostInfo">
						<div class="infoWrite">
							<h2>2. 숙소 사진을 등록해주세요</h2>
							<span>
								사진을 제출하고<br>
								제목과 설명을 추가해주세요
							</span>
						</div>
						<div class="infoImg">
							<img src="http://192.168.64.200/infoImgTwo.jpeg">
						</div>
					</div>
					<div class="hostInfo">
						<div class="infoWrite">
							<h2>3. 등록을 완료하세요</h2>
							<span>
								숙소 요금을 설정한 후<br>
								등록을 완료하세요
							</span>
						</div>
						<div class="infoImg">
							<img src="http://192.168.64.200/infoImgThree.jpeg">
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<!-- category 프론트 -->
		<div id="selectCategory" class="hidden">
			<h1>숙소의 종류를 선택해주세요</h1>
			<div class="categoryItems">
				<button class="categoryItem">
					<div><img src="http://192.168.64.200/house.jpeg"></div>
					<div>팬션</div>
				</button>
				<button class="categoryItem">
					<div><img src="http://192.168.64.200/poolvilla.jpeg"></div>
					<div>풀빌라</div>
				</button>
				<button class="categoryItem">
					<div><img src="http://192.168.64.200/hotel.jpeg"></div>
					<div>호텔</div>
				</button>
				<button class="categoryItem">
					<div><img src="http://192.168.64.200/resort.jpeg"></div>
					<div>리조트</div>
				</button>
				<button class="categoryItem">
					<div><img src="http://192.168.64.200/glamping.jpeg"></div>
					<div>글램핑</div>
				</button>
				<button class="categoryItem">
					<div><img src="http://192.168.64.200/camping.jpeg"></div>
					<div>캠핑</div>
				</button>
				<button class="categoryItem">
					<div><img src="http://192.168.64.200/guestHouse.jpeg"></div>
					<div>게스트하우스</div>
				</button>
				<button class="categoryItem">
					<div><img src="http://192.168.64.200/hanok.jpeg"></div>
					<div>한옥</div>
				</button>
				<button class="categoryItem">
					<div><img src="http://192.168.64.200/ryokan.jpeg"></div>
					<div>료칸</div>
				</button>
			</div>
		</div>
		
		<!-- roomType 프론트 -->
		<div id="selectRoomType" class="hidden">
			<div class="roomTypeWrap">
				<h1>게스트가 사용할 숙소 유형</h1>
				<button class="roomTypeItem">
					<div class="roomInfo">
						<h3>독채</h3>
						<span>게스트가 숙소 전체를 사용합니다</span>
					</div>
					<div>
						<img src="http://192.168.64.200/roomTypeOne.jpeg">
					</div>
				</button>
				<button class="roomTypeItem">
					<div class="roomInfo">
						<h3>원룸</h3>
						<span>게스트가 묵을 숙소가 방이 하나인 타입입니다</span>
					</div>
					<div>
						<img src="http://192.168.64.200/roomTypeTwo.jpeg">
					</div>
				</button>
				<button class="roomTypeItem">
					<div class="roomInfo">
						<h3>멀티룸</h3>
						<span>게스트가 묵을 숙소가 방이 여러개인 타입입니다</span>
					</div>
					<div>
						<img src="http://192.168.64.200/house.jpeg">
					</div>
				</button>
			</div>
		</div>
		
		<!-- rentCount 프론트 -->
		<div id="rentCount" class="hidden">
			<div class="rentCountWrap">
				<h1>숙소 기본 정보를 알려주세요</h1>
				<span>방, 침대 등의 갯수들을 정해주세요 ~ </span>
				<div class="roomCount">
					<div class="rentCountItem">
						<div class="roomCountName">
							<div>방</div>
						</div>
						<div class="roomCountNumber">
							<button class="minus"><span>➖</span></button>
							<span class="roomCountValue">0</span>
							<button class="plus"><span>➕</span></button>
						</div>
					</div>
				</div>
				<div class="bathCount">
					<div class="rentCountItem">
						<div class="roomCountName">
							<div>욕실</div>
						</div>
						<div class="roomCountNumber">
							<button class="minus"><span>➖</span></button>
							<span class="bathCountValue">0</span>
							<button class="plus"><span>➕</span></button>
						</div>
					</div>
				</div>
				<div class="guestCount rentCountItem">
					<div class="roomCountName">
						<div>게스트</div>
					</div>
					<div class="roomCountNumber">
						<button class="minus"><span>➖</span></button>
						<span class="guestCountValue">0</span>
						<button class="plus"><span>➕</span></button>
					</div>
				</div>
				<div class="bedCount rentCountItem">
					<div class="roomCountName">
						<div>침대</div>
					</div>
					<div class="roomCountNumber">
						<button class="minus"><span>➖</span></button>
						<span class="bedCountValue">0</span>
						<button class="plus"><span>➕</span></button>
					</div>
				</div>
			</div>
		</div>
		
		<!-- buttons -->
		<div class="btnSpace">
			<div id="hostBtn">
				<button id="nextHost">시작하기</button>
			</div>
			
			<div id="categoryBtn" class="hidden">
				<button id="preCategory" class="blackBtn">이전</button>
				<button id="nextCategory" class="blackBtn">다음</button>
			</div>
			
			<div id="roomTypeBtn" class="hidden">
				<button id="preRoomType" class="blackBtn">이전</button>
				<button id="nextRoomType" class="blackBtn">다음</button>
			</div>
			<div id="rentCountBtn" class="hidden">
				<button id="preRentCount" class="blackBtn">이전</button>
				<button id="nextRentCount" class="blackBtn">다음</button>
			</div>
		</div>
	</div>
	
	<script>
		// host 변수
		const start = document.getElementById('start')
		const hostBtn = document.getElementById('hostBtn')
		const nextHost = document.getElementById('nextHost')
		// category 변수
		const category = document.getElementById('selectCategory')
		const categoryItemList = document.querySelectorAll('.categoryItem')
		const categoryBtn = document.getElementById('categoryBtn')
		const preCategory = document.getElementById('preCategory')
		const nextCategory = document.getElementById('nextCategory')
		// roomType 변수
		const roomType = document.getElementById('selectRoomType')
		const roomTypeBtn = document.getElementById('roomTypeBtn')
		const roomTypeItemList = document.querySelectorAll('.roomTypeItem')
		const preRoomType = document.getElementById('preRoomType')
		const nextRoomType = document.getElementById('nextRoomType')
		// rentCount 변수
		const rentCount = document.getElementById('rentCount')
		const rentCountBtn = document.getElementById('rentCountBtn')
		const minusList = document.querySelectorAll('.minus')
		const plusList = document.querySelectorAll('.plus')
		// ajax 옵션
		let opt = {						
				method: 'POST',					
				headers: {						
					'Content-Type': 'application/json; charset=utf-8'
				}
		}
		let formData = new FormData()
		
		// host handler
		function hostHandler() {
			
			start.classList.add('hidden')
			category.classList.remove('hidden')
			hostBtn.classList.add('hidden')
			categoryBtn.classList.remove('hidden')
		}
		
		// category handler
		function preCategoryHandler() {
			category.classList.add('hidden')
			start.classList.remove('hidden')
			categoryBtn.classList.add('hidden')
			hostBtn.classList.remove('hidden')
		}
		
		function categoryItemHandler(event) {
			let target = event.target
			while(target.classList.contains('categoryItem') == false) {
				target = target.parentNode
			}
			const categorySelected = document.querySelector('.categorySelected')
			
			if(categorySelected == null) {
				target.classList.add('categorySelected')
			}
			else if(categorySelected == target) {
				categorySelected.classList.remove('categorySelected')
			}
			else {
				categorySelected.classList.remove('categorySelected')
				if(target != null) {
					target.classList.add('categorySelected')
				}
			}
		}
		
		function categoryHandler() {
			const categorySelected = document.querySelector('.categorySelected')
			
			if(categorySelected == null) {
				alert('숙소의 종류를 선택해주세요 ~ ')
				return
			}
			
			formData.append("category", categorySelected.children[1].innerText)
			
			category.classList.add('hidden')
			roomType.classList.remove('hidden')
			categoryBtn.classList.add('hidden')
			roomTypeBtn.classList.remove('hidden')
		}
		
		// roomType handler
		function preRoomTypeHandler() {
			roomType.classList.add('hidden')
			category.classList.remove('hidden')
			roomTypeBtn.classList.add('hidden')
			categoryBtn.classList.remove('hidden')
		}
		
		function roomTypeItemHandler(event) {
			let target = event.target
			while(target.classList.contains('roomTypeItem') == false) {
				target = target.parentNode
			}
			const roomTypeSelected = document.querySelector('.roomTypeSelected')
			
			if(roomTypeSelected == null) {
				target.classList.add('roomTypeSelected')
			}
			else if(roomTypeSelected == target) {
				roomTypeSelected.classList.remove('roomTypeSelected')
			}
			else {
				roomTypeSelected.classList.remove('roomTypeSelected')
				if(target != null) {
					target.classList.add('roomTypeSelected')
				}
			}
		}
		
		function roomTypeHandler() {
			const roomTypeSelected = document.querySelector('.roomTypeSelected')
			
			if(roomTypeSelected == null) {
				alert('숙소 유형을 선택해주세요 ~ ')
				return
			}
		
			formData.append("roomType", roomTypeSelected.children[0].children[0].innerText)
			
			console.log(formData.get("roomType"))
			roomType.classList.add('hidden')
			rentCount.classList.remove('hidden')
			roomTypeBtn.classList.add('hidden')
			rentCountBtn.classList.remove('hidden')
			
			const roomCount = document.querySelector('.roomCount')
			const bathCount = document.querySelector('.bathCount')
			
			if(roomTypeSelected.children[0].children[0].innerText == '원룸') {
				roomCount.classList.add('hidden')
				bathCount.classList.add('hidden')
			}
			else {
				roomCount.classList.remove('hidden')
				bathCount.classList.remove('hidden')
			}
		}
		
		// rentCount handler
		function preRentCountHandler() {
			rentCount.classList.add('hidden')
			roomType.classList.remove('hidden')
			rentCountBtn.classList.add('hidden')
			roomTypeBtn.classList.remove('hidden')
		}
		
		function minusHandler(event) {
			let target = event.target
			if(target.classList.contains('minus') == false) {
				target = target.parentNode
			}
			
			const value = target.parentNode.children[1]
			
			if(+value.innerText - 1 >= 0) {
				value.innerText = +value.innerText - 1
			}
		}
		
		function plusHandler(event) {
			let target = event.target
			if(target.classList.contains('plus') == false) {
				target = target.parentNode
			}
			
			const value = target.parentNode.children[1]
			
			value.innerText = +value.innerText + 1
		}
		
		// host event
		nextHost.onclick = hostHandler
		// category event
		preCategory.onclick = preCategoryHandler
		categoryItemList.forEach(categoryItem => categoryItem.onclick = categoryItemHandler)
		nextCategory.onclick = categoryHandler
		// roomType event
		preRoomType.onclick = preRoomTypeHandler
		roomTypeItemList.forEach(roomTypeItem => roomTypeItem.onclick = roomTypeItemHandler)
		nextRoomType.onclick = roomTypeHandler
		// rentCount event
		preRentCount.onclick = preRentCountHandler
		minusList.forEach(minus => minus.onclick = minusHandler)
		plusList.forEach(plus => plus.onclick = plusHandler)
		
	</script>
</body>