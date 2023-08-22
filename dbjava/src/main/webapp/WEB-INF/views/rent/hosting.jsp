<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<script>
	window.addEventListener("beforeunload", function(event) {
		event.returnValue = "변경사항이 저장되지 않을 수 있습니다";
	});
</script>

	<!-- host 프론트 -->
	<div id="start">
		<div id="host">
			<div class="hostLeft">
				<h1>
					당신의<br> 멋진 숙소를<br> 등록해주세요 😉
				</h1>
			</div>
			<div class="hostRight">
				<div class="hostInfo">
					<div class="infoWrite">
						<h2>1. 숙소 정보를 알려주세요</h2>
						<span> 숙소 위치와 숙박가능 인원 등<br> 기본정보를 열려주세요
						</span>
					</div>
					<div class="infoImg">
						<img src="http://192.168.64.200/infoImgOne.jpeg">
					</div>
				</div>
				<div class="hostInfo">
					<div class="infoWrite">
						<h2>2. 숙소 사진을 등록해주세요</h2>
						<span> 사진을 제출하고<br> 제목과 설명을 추가해주세요
						</span>
					</div>
					<div class="infoImg">
						<img src="http://192.168.64.200/infoImgTwo.jpeg">
					</div>
				</div>
				<div class="hostInfo">
					<div class="infoWrite">
						<h2>3. 등록을 완료하세요</h2>
						<span> 숙소 요금을 설정한 후<br> 등록을 완료하세요
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
				<div>
					<img src="http://192.168.64.200/펜션.jpeg">
				</div>
				<div>펜션</div>
			</button>
			<button class="categoryItem">
				<div>
					<img src="http://192.168.64.200/풀빌라.jpeg">
				</div>
				<div>풀빌라</div>
			</button>
			<button class="categoryItem">
				<div>
					<img src="http://192.168.64.200/호텔.jpeg">
				</div>
				<div>호텔</div>
			</button>
			<button class="categoryItem">
				<div>
					<img src="http://192.168.64.200/리조트.jpeg">
				</div>
				<div>리조트</div>
			</button>
			<button class="categoryItem">
				<div>
					<img src="http://192.168.64.200/글램핑.jpeg">
				</div>
				<div>글램핑</div>
			</button>
			<button class="categoryItem">
				<div>
					<img src="http://192.168.64.200/캠핑.jpeg">
				</div>
				<div>캠핑</div>
			</button>
			<button class="categoryItem">
				<div>
					<img src="http://192.168.64.200/게스트하우스.jpeg">
				</div>
				<div>게스트하우스</div>
			</button>
			<button class="categoryItem">
				<div>
					<img src="http://192.168.64.200/한옥.jpeg">
				</div>
				<div>한옥</div>
			</button>
			<button class="categoryItem">
				<div>
					<img src="http://192.168.64.200/료칸.jpeg">
				</div>
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
					<img src="http://192.168.64.200/독채.jpeg">
				</div>
			</button>
			<button class="roomTypeItem">
				<div class="roomInfo">
					<h3>원룸</h3>
					<span>게스트가 묵을 숙소가 방이 하나인 타입입니다</span>
				</div>
				<div>
					<img src="http://192.168.64.200/원룸.jpeg">
				</div>
			</button>
			<button class="roomTypeItem">
				<div class="roomInfo">
					<h3>멀티룸</h3>
					<span>게스트가 묵을 숙소가 방이 여러개인 타입입니다</span>
				</div>
				<div>
					<img src="http://192.168.64.200/멀티룸.jpeg">
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
						<button class="minus">
							<span>➖</span>
						</button>
						<span class="roomCountValue">0</span>
						<button class="plus">
							<span>➕</span>
						</button>
					</div>
				</div>
			</div>
			<div class="bathCount">
				<div class="rentCountItem">
					<div class="roomCountName">
						<div>욕실</div>
					</div>
					<div class="roomCountNumber">
						<button class="minus">
							<span>➖</span>
						</button>
						<span class="bathCountValue">0</span>
						<button class="plus">
							<span>➕</span>
						</button>
					</div>
				</div>
			</div>
			<div class="guestCount rentCountItem">
				<div class="roomCountName">
					<div>게스트</div>
				</div>
				<div class="roomCountNumber">
					<button class="minus">
						<span>➖</span>
					</button>
					<span class="guestCountValue">0</span>
					<button class="plus">
						<span>➕</span>
					</button>
				</div>
			</div>
			<div class="bedCount rentCountItem">
				<div class="roomCountName">
					<div>침대</div>
				</div>
				<div class="roomCountNumber">
					<button class="minus">
						<span>➖</span>
					</button>
					<span class="bedCountValue">0</span>
					<button class="plus">
						<span>➕</span>
					</button>
				</div>
			</div>
		</div>
	</div>

	<!-- information -->
	<div id="rentInformation" class="hidden">
		<div class="rentInformationScroll">
			<div class="rentInformationWrap">
				<h1>숙소 편의시설 정보를 추가하세요</h1>

				<div class="rentInformationItems">
					<button class="rentInformationItem">
						<div>
							<img src="http://192.168.64.200/무선 인터넷.jpeg">
						</div>
						<div>무선 인터넷</div>
					</button>
					<button class="rentInformationItem">
						<div>
							<img src="http://192.168.64.200/TV.jpeg">
						</div>
						<div>TV</div>
					</button>
					<button class="rentInformationItem">
						<div>
							<img src="http://192.168.64.200/컴퓨터.jpeg">
						</div>
						<div>컴퓨터</div>
					</button>
					<button class="rentInformationItem">
						<div>
							<img src="http://192.168.64.200/주방.jpeg">
						</div>
						<div>주방</div>
					</button>
					<button class="rentInformationItem">
						<div>
							<img src="http://192.168.64.200/세탁기.jpeg">
						</div>
						<div>세탁기</div>
					</button>
					<button class="rentInformationItem">
						<div>
							<img src="http://192.168.64.200/에어컨.jpeg">
						</div>
						<div>에어컨</div>
					</button>
					<button class="rentInformationItem">
						<div>
							<img src="http://192.168.64.200/주변 무료 주차.jpeg">
						</div>
						<div>주변 무료 주차</div>
					</button>
					<button class="rentInformationItem">
						<div>
							<img src="http://192.168.64.200/주변 유료 주차.jpeg">
						</div>
						<div>주변 유료 주차</div>
					</button>
				</div>

				<h2>자랑하고 싶은 편의시설이 있나요?</h2>

				<div class="rentInformationItems">
					<button class="rentInformationItem">
						<div>
							<img src="http://192.168.64.200/수영장.jpeg">
						</div>
						<div>수영장</div>
					</button>
					<button class="rentInformationItem">
						<div>
							<img src="http://192.168.64.200/욕조.jpeg">
						</div>
						<div>욕조</div>
					</button>
					<button class="rentInformationItem">
						<div>
							<img src="http://192.168.64.200/바베큐 그릴.jpeg">
						</div>
						<div>바베큐 그릴</div>
					</button>
					<button class="rentInformationItem">
						<div>
							<img src="http://192.168.64.200/피아노.jpeg">
						</div>
						<div>피아노</div>
					</button>
					<button class="rentInformationItem">
						<div>
							<img src="http://192.168.64.200/키즈.jpeg">
						</div>
						<div>키즈</div>
					</button>
					<button class="rentInformationItem">
						<div>
							<img src="http://192.168.64.200/빔프로젝트.jpeg">
						</div>
						<div>빔프로젝트</div>
					</button>
					<button class="rentInformationItem">
						<div>
							<img src="http://192.168.64.200/무료영화(OTT).jpeg">
						</div>
						<div>무료영화(OTT)</div>
					</button>
					<button class="rentInformationItem">
						<div>
							<img src="http://192.168.64.200/운동기구.jpeg">
						</div>
						<div>운동기구</div>
					</button>
					<button class="rentInformationItem">
						<div>
							<img src="http://192.168.64.200/계곡과 인접.jpeg">
						</div>
						<div>계곡과 인접</div>
					</button>
					<button class="rentInformationItem">
						<div>
							<img src="http://192.168.64.200/해변과 인접.jpeg">
						</div>
						<div>해변과 인접</div>
					</button>
				</div>

				<h3>안전관련 물품이 있나요?</h3>

				<div class="rentInformationItems">
					<button class="rentInformationItem">
						<div>
							<img src="http://192.168.64.200/화재경보기.jpeg">
						</div>
						<div>화재경보기</div>
					</button>
					<button class="rentInformationItem">
						<div>
							<img src="http://192.168.64.200/구급상자.jpeg">
						</div>
						<div>구급상자</div>
					</button>
					<button class="rentInformationItem">
						<div>
							<img src="http://192.168.64.200/소화기.jpeg">
						</div>
						<div>소화기</div>
					</button>
				</div>
			</div>
		</div>
	</div>

	<!-- rentImg -->
	<div id="rentImg" class="hidden">
		<div class="rentImgAdd">
			<div class="rentImgScroll">
				<div class="rentImgWrap">
					<h1>사진을 넣어주세요</h1>
					<div class="mainImgSpace">
						<div class="mainInputSpace">
							<input type="file" id="mainImg" class="fileImg" onchange="rentImgInputHandler(event)">
							<div class="inputInfo">
								<img src="http://192.168.64.200/picture.jpeg">
								<h3>
									여기다 대표 사진을 끌어다 놓으세요<br>
								</h3>
								<span>
									또는 공간을 클릭하여<br>
									업로드할 사진을 선택해주세요
									<br><br>
								</span>
							</div>
						</div>
						<div class="mainImg hidden">
							<button class="imgDelete" onclick="imgDeleteHandler(event)">삭제</button>
	  						<img class="preview-img addMainImg">
						</div>
					</div>
					<div class="subImg">
						<div class="subImgWrap">
							<div class="subImgSpace">
								<div class="subInputSpace">
									<input type="file" class="fileImg" onchange="rentImgInputHandler(event)">
									<div class="subInfo">
										<img src="http://192.168.64.200/picture.jpeg">
									</div>
								</div>
								<div class="subImg hidden">
									<button class="imgDelete" onclick="imgDeleteHandler(event)">삭제</button>
			  						<img class="preview-img addMainImg">
								</div>
							</div>
							<div class="subImgSpace">
								<div class="subInputSpace">
									<input type="file" class="fileImg" onchange="rentImgInputHandler(event)">
									<div class="subInfo">
										<img src="http://192.168.64.200/picture.jpeg">
									</div>
								</div>
								<div class="subImg hidden">
									<button class="imgDelete" onclick="imgDeleteHandler(event)">삭제</button>
			  						<img class="preview-img addMainImg">
								</div>
							</div>
							<div class="subImgSpace">
								<div class="subInputSpace">
									<input type="file" class="fileImg" onchange="rentImgInputHandler(event)">
									<div class="subInfo">
										<img src="http://192.168.64.200/picture.jpeg">
									</div>
								</div>
								<div class="subImg hidden">
									<button class="imgDelete" onclick="imgDeleteHandler(event)">삭제</button>
			  						<img class="preview-img addMainImg">
								</div>
							</div>
							<div class="subImgSpace">
								<div class="subInputSpace">
									<input type="file" class="fileImg" onchange="rentImgInputHandler(event)">
									<div class="subInfo">
										<img src="http://192.168.64.200/picture.jpeg">
									</div>
								</div>
								<div class="subImg hidden">
									<button class="imgDelete" onclick="imgDeleteHandler(event)">삭제</button>
			  						<img class="preview-img addMainImg">
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- rentContent -->
	<div id="rentContent" class="hidden">
		<div class="rentContentSpace">
			<h1>숙소의 정보들을 입력해주세요 ~ </h1>
			<p><input type="text" name="title" placeholder="숙소 이름"></p>
			<p><input type="number" name="price" min="0" step="10" placeholder="숙소 가격(1박 기준)"></p>
			<p><textarea name="content" placeholder="숙소 소개"></textarea></p>
		</div>
	</div>
	
	<!-- rentLoacation -->
	<div id="rentLocation" class="hidden">
		<div>경로</div>
	</div>
	
	<hr>

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
		<div id="rentInformationBtn" class="hidden">
			<button id="preRentInformation" class="blackBtn">이전</button>
			<button id="nextRentInformation" class="blackBtn">다음</button>
		</div>
		<div id="rentImgBtn" class="hidden">
			<button id="preRentImg" class="blackBtn">이전</button>
			<button id="nextRentImg" class="blackBtn">다음</button>
		</div>
		<div id="rentContentBtn" class="hidden">
			<button id="preRentContent" class="blackBtn">이전</button>
			<button id="nextRentContent" class="blackBtn">다음</button>
		</div>
		<div id="rentLocationBtn" class="hidden">
			<button id="preRentLocation" class="blackBtn">이전</button>
			<button id="nextHost" class="finish">완성</button>
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
		const preRentCount = document.getElementById('preRentCount')
		const nextRentCount = document.getElementById('nextRentCount')
		// rentInformation 변수
		const rentInformation = document.getElementById('rentInformation')
		const rentInformationBtn = document.getElementById('rentInformationBtn')
		const rentInformationItemList = document.querySelectorAll('.rentInformationItem')
		const preRentInformation = document.getElementById('preRentInformation')
		const nextRentInformation = document.getElementById('nextRentInformation')
		// rentImg 변수
		const rentImg = document.getElementById('rentImg')
		const rentImgBtn = document.getElementById('rentImgBtn')
		let fileImgList = document.querySelectorAll('.fileImg')
		const preRentImg = document.getElementById('preRentImg')
		const nextRentImg = document.getElementById('nextRentImg')
		let subImgWrap = document.querySelector('.subImgWrap')
		// rentContent 변수
		const rentContent = document.getElementById('rentContent')
		const rentContentBtn = document.getElementById('rentContentBtn')
		const preRentContent = document.getElementById('preRentContent')
		const nextRentContent = document.getElementById('nextRentContent')
		// rentLocation 변수
		const rentLocation = document.getElementById('rentLocation')
		const preRentLocation = document.getElementById('preRentLocation')
		const finish = document.querySelector('.finish')
		const rentLocationBtn = document.getElementById('rentLocationBtn')
		// ajax 옵션
		let opt = {						
				method: 'POST'
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
			
			if(formData.get("category") != null) {
				formData.delete("category")
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
		
			if(formData.get("roomType") != null) {
				formData.delete("roomType")
			}
			formData.append("roomType", roomTypeSelected.children[0].children[0].innerText)
			
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
		
		function rentCountHandler() {
			const roomCountValue = document.querySelector('.roomCountValue')
			const bathCountValue = document.querySelector('.bathCountValue')
			const guestCountValue = document.querySelector('.guestCountValue')
			const bedCountValue = document.querySelector('.bedCountValue')
			
			if(formData.get("roomCount") != null) {
				formData.delete("roomCount")
				formData.delete("bathCount")
				formData.delete("guestCount")
				formData.delete("bedCount")
			}
			formData.append("roomCount", +roomCountValue.innerText)
			formData.append("bathCount", +bathCountValue.innerText)
			formData.append("guestCount", +guestCountValue.innerText)
			formData.append("bedCount", +bedCountValue.innerText)
			
			rentCount.classList.add('hidden')
			rentInformation.classList.remove('hidden')
			rentCountBtn.classList.add('hidden')
			rentInformationBtn.classList.remove('hidden')
		}
		
		// rentInformation handler
		function preRentInformationHandler() {
			rentInformation.classList.add('hidden')
			rentCount.classList.remove('hidden')
			rentInformationBtn.classList.add('hidden')
			rentCountBtn.classList.remove('hidden')
		}
		
		function rentInformationItemHandler() {
			let target = event.target
			let isEqual = false
			while(target.classList.contains('rentInformationItem') == false) {
				target = target.parentNode
			}
			const rentInformationSelectedList = document.querySelectorAll('.rentInformationSelected')
			
			rentInformationSelectedList.forEach(rentInformationSelected => {
				if(rentInformationSelected == target) {
					rentInformationSelected.classList.remove('rentInformationSelected')
					isEqual = true
				}
			})
			
			if(isEqual == false) {
				target.classList.add('rentInformationSelected')
			}
		}
		
		function rentInformationHandler() {
			const rentInformationSelectedList = document.querySelectorAll('.rentInformationSelected')
			const listLength = rentInformationSelectedList.length
			let rentInformationValue = ''
			let count = 1
			
			rentInformationSelectedList.forEach(rentInformationSelected => {
				if(count != listLength) {
					rentInformationValue += rentInformationSelected.children[1].innerText + ', '
				}
				else {
					rentInformationValue += rentInformationSelected.children[1].innerText
				}
				count++
			})
			
			if(formData.get("information") != null) {
				formData.delete("information")
			}
			formData.append("information", rentInformationValue)
			
			rentInformation.classList.add('hidden')
			rentImg.classList.remove('hidden')
			rentInformationBtn.classList.add('hidden')
			rentImgBtn.classList.remove('hidden')
		}
		
		// rentImgHandler
		function preRentImgHandler() {
			rentImg.classList.add('hidden')
			rentInformation.classList.remove('hidden')
			rentImgBtn.classList.add('hidden')
			rentInformationBtn.classList.remove('hidden')
		}
		
		function rentImgInputHandler(event) {
 			const target = event.target
 			const selectedFile = target.files[0]
			
 			if(selectedFile != null) {
 				const reader = new FileReader()
			
 				reader.readAsDataURL(selectedFile)
 				reader.onload = function(e) {
 					const inputSpace = target.parentNode
 					const imgSpace = inputSpace.parentNode
 					const img = imgSpace.children[1]
					
 					inputSpace.classList.add('hidden')
					img.classList.remove('hidden')
					img.children[1].src = e.target.result
 				};
 			}
		}
		
		function rentImgHandler() {
			const fileInputs = document.querySelectorAll('.fileImg')
			let index = 0
			const mainImgSpace = document.querySelector('.mainImgSpace')
			
			fileInputs.forEach(fileInput => {
				if(fileInput.files[0] != null) {
					formData.append('files[' + index + ']', fileInput.files[0])
					index++
				}
			})
			
			if(index == 0) {
				alert('숙소를 표현할 사진 하나 이상은 꼭 등록해주세요 ~~')
				return
			} 
			
			rentImg.classList.add('hidden')
			rentContent.classList.remove('hidden')
			rentImgBtn.classList.add('hidden')
			rentContentBtn.classList.remove('hidden')
		}
		
		function imgDeleteHandler(event) {
			const target = event.target
			const img = target.parentNode
			const inputSpace = target.parentNode.parentNode.children[0]
			const input = inputSpace.querySelector('input[type="file"]')
			const createInput = document.createElement('input')
			createInput.type = 'file'
			createInput.className = input.className
			createInput.addEventListener("change", rentImgInputHandler)
			let count = 0
			
			console.log('target', target)
			console.log('img', img)
			console.log('inputSpace', inputSpace)
			console.log('input', input)
			console.log('input.className', input.className)
			console.log('createInput', createInput)
			
			inputSpace.removeChild(input)
			inputSpace.appendChild(createInput)
			inputSpace.classList.remove('hidden')
			img.classList.add('hidden')
		}
		
		//rentContent handler
		function preRentContentHandler() {
			rentContent.classList.add('hidden')
			rentImg.classList.remove('hidden')
			rentContentBtn.classList.add('hidden')
			rentImgBtn.classList.remove('hidden')
		}
		
		function rentContentHandler() {
			const title = document.querySelector('input[name="title"]')
			const price = document.querySelector('input[name="price"]')
			const content = document.querySelector('textarea[name="content"]')

			formData.append('title', title.value)
			formData.append('price', price.value)
			formData.append('content', content.value)
			
			rentContent.classList.add('hidden')
			rentLocation.classList.remove('hidden')
			rentContentBtn.classList.add('hidden')
			rentLocationBtn.classList.remove('hidden')
		}
		
		// rentLocation handler
		function preRentLocationHandler() {
			rentLocation.classList.add('hidden')
			rentContent.classList.remove('hidden')
			rentLocationBtn.classList.add('hidden')
			rentContentBtn.classList.remove('hidden')
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
		nextRentCount.onclick = rentCountHandler
		// rentInformation event
		preRentInformation.onclick = preRentInformationHandler
		rentInformationItemList.forEach(rentInformationItem => rentInformationItem.onclick = rentInformationItemHandler)
		nextRentInformation.onclick = rentInformationHandler
		// rentImg event
		preRentImg.onclick = preRentImgHandler
		nextRentImg.onclick = rentImgHandler
		// rentContent event
		preRentContent.onclick = preRentContentHandler
		nextRentContent.onclick = rentContentHandler
		// rentLocation event
		preRentLocation.onclick = preRentLocationHandler
	</script>
</body>