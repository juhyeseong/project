<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
	<script>
		document.addEventListener("keydown", function(event) {
			if (event.key === "F5") {
				event.preventDefault()
				if (confirm("페이지를 새로고치면 진행중인 설정이 날아갈 수 있습니다 ~ \n그래도 새로고침 하시겠습니까 ?")) {
					location.reload()
				}
			}
		})
	</script>
	
	<div class="main">
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
		
		<div id="selectRoomType" class="hidden">
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
		</div>
	</div>
	
	<script>
		// host 변수
		const start = document.getElementById('start')
		const nextHost = document.getElementById('nextHost')
		// category 변수
		const category = document.getElementById('selectCategory')
		const categoryItemList = document.querySelectorAll('.categoryItem')
		const preCategory = document.getElementById('preCategory')
		const nextCategory = document.getElementById('nextCategory')
		// roomType 변수
		const roomType = document.getElementById('selectRoomType')
		const roomTypeBtn = document.getElementById('roomTypeBtn')
		// ajax 옵션
		let opt = {
				method: 'POST',
				headers: {
					'Content-Type': 'application/json; charset=utf-8'
				}
		}
		
		// host handler
		function hostHandler() {
			const hostBtn = document.getElementById('hostBtn')
			const categoryBtn = document.getElementById('categoryBtn')
			
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
		
		function selectItemHandler(event) {
			let target = null
			if(event.target.className === 'categoryItem') {
				target = event.target
			}
			else if(event.target.parentNode.className === 'categoryItem') {
				target = event.target.parentNode
			}
			else if(event.target.parentNode.parentNode.className == 'categoryItem') {
				target = event.target.parentNode.parentNode
			}
			const selected = document.querySelector('.selected')
			
			if(selected == null) {
				target.classList.add('selected')
			}
			else if(selected == target) {
				selected.classList.remove('selected')
			}
			else {
				selected.classList.remove('selected')
				if(target != null) {
					target.classList.add('selected')
				}
			}
		}
		
		function categoryHandler() {
			const selected = document.querySelector('.selected')
			
			if(selected == null) {
				alert('숙소의 종류를 선택해주세요 ~ ')
				return
			}
			
			opt.body = JSON.stringify({
				category: selected.children[1].innerText
			})
			
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
		
		// host event
		nextHost.onclick = hostHandler
		// category event
		preCategory.onclick = preCategoryHandler
		nextCategory.onclick = categoryHandler
		categoryItemList.forEach(categoryItem => categoryItem.onclick = selectItemHandler)
		// roomType event
		preRoomType.onclick = preRoomTypeHandler
	</script>
</body>