<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
	<main class="adminMain">
		<div class="adminLeft">
			<div class="adminStatus">
				<div class="addminProfileBox">
					<img class="addminProfile" src="${login.profile }">
				</div>
				<div>
					<p>${login.userNick }
				</div>
				<ul class="adminList">
					<li>숙박예약 관리
						<ul class="reservationManagement">
							<a href="${cpath }/admin/reservation"><li class="reservationManagementList">예약 현황</li></a>
							<a href="${cpath }/admin/registration"><li class="reservationManagementList">숙소 등록 관리</li></a>
							<a href="${cpath }/admin/reporting"><li class="reservationManagementList" style="background-color: #AFAB99;">숙소 신고 현황</li></a>
						</ul>
					</li>
					<li>댓글 관리
						<ul class="reviewManagement">
								<a href="${cpath }/admin/reviewReporting"><li class="reviewManagementList">댓글 신고 현황</li></a>
						</ul>
					</li>
				</ul>
			</div>
		</div>
		<div class="adminRight">
			<h2 class="adminTitle">숙소 신고 현황</h2>
	
				<div id="searchFilter">
					<form method="post">
						<input type="text" name="search" id="searchBar"
							placeholder="예약자 ID로 검색">
	
						<button class="searchBtn">검색</button>
					</form>
					<a href="${cpath }/admin/reporting"><button class="resetBtn">초기화</button></a>
				</div>
			<div class="reservationBox">
				
	
				<div class="reportsBox">
					<c:forEach var="dto" items="${list }">
						<div class="reportSimpleRow">
							<p>예약 번호 : <span class="reportIdx">${dto.idx }</span></p>
							<p>예약자 ID : ${dto.userId }</p>
							<p>예약자 성함 : ${dto.userName }</p>
							<p>예약룸 : <br>${dto.title }</a></p>
							<p>신고 타입 : <br>${dto.reportType }</p>
							<br>
							<p class="reportViewText">눌러서 상세내용 보기</p>
						</div>			
					</c:forEach>
				</div>
			</div>
		</div>
		
		<!-- 모달 창 -->
		<div class="modal" id="reportModal">
		    <div class="modal-content reportDetailBox">
		        <span class="close" id="closeModal">&times;</span>
		        <h2>숙소 신고 상세내용</h2>
		        <div class="reportDetail">
					<p id="modalReservationNumber">예약 번호 : </p>
					<p id="modalUserId">예약자 ID : </p>
					<p id="modalUserName">예약자 성함 : </p>
					<a href="${cpath }/rent/room/${dto.rent}"><p id="modalTitle">예약룸 : </p></a>
					<p id="modalReportType">신고 타입 : </p>
					<p>신고 내용</p>
					<textarea id="modalContent" readonly></textarea>
				</div>
		    </div>
		</div>
	</main>
	<!-- 숙소 신고 상세 모달창 -->
	<script>
		//모달 열기
		const cpath = '${cpath }'
		const roomReportButtons = document.querySelectorAll('.reportSimpleRow')
		const reportModal = document.getElementById('reportModal')
		const closeModal = document.getElementById('closeModal')
		
		
		roomReportButtons.forEach((roomReportButton) => {
			roomReportButton.addEventListener('click', () => {
			    reportModal.style.display = 'block'
			    const idx = roomReportButton.querySelector(".reportIdx").textContent
			    const url = '${cpath}/admin/reportOne/' + idx
			    
		 	    fetch(url)
			    .then(res => res.json())
			    .then(data => {
			    	// 모달 내용 업데이트
				    document.getElementById('modalReservationNumber').textContent = "예약 번호: " + data.idx;
				    document.getElementById('modalUserId').textContent = "예약자 ID: " + data.userId;
				    document.getElementById('modalUserName').textContent = "예약자 성함: " + data.userName;
				    document.getElementById('modalTitle').textContent = "예약룸: " + data.title;
				    document.getElementById('modalReportType').textContent = "신고 타입: " + data.reportType;
				    document.getElementById('modalContent').textContent = "신고 내용: " + data.content;
			    })
			    .catch(error => console.error('Error : ',error)) 
			})
		})
		
		// 모달 닫기
		closeModal.addEventListener('click', () => {
		    reportModal.style.display = 'none'
		})
		
		// 모달 외부 클릭으로 닫기
		window.addEventListener('click', (event) => {
		    if (event.target === reportModal) {
		        reportModal.style.display = 'none'
		    }
		})
	</script>
</body>
</html>