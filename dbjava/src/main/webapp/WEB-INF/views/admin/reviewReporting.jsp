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
							<a href="${cpath }/admin/reporting"><li class="reservationManagementList">숙소 신고 현황</li></a>
						</ul>
					</li>
					<li>댓글 관리
						<ul class="reviewManagement">
								<a href="${cpath }/admin/reviewReporting"><li class="reviewManagementList" style="background-color: #AFAB99;">댓글 신고 현황</li></a>
						</ul>
					</li>
				</ul>
			</div>
		</div>
		<div class="adminRight">
			<h2 class="adminTitle">리뷰 신고 현황</h2>
	
				<div id="searchFilter">
					<form method="post">
						<input type="text" name="search" id="searchBar"placeholder="신고자 ID로 검색">
						<button class="searchBtn">검색</button>
					</form>
					<a href="${cpath }/admin/reviewReporting"><button class="resetBtn">초기화</button></a>
				</div>
			<div class="reservationBox">
				<div class="reportsBox">
					<c:forEach var="dto" items="${list }">
						<div class="reportSimpleRow">
							<c:if test="${dto.reportStatus == 1 }">
								<p class="reportViewText">블락</p>
							</c:if>
							<c:if test="${dto.reportStatus == 0 }">
								<p class="reportViewText">확인중</p>
							</c:if>
							<p>신고 번호 : <span class="reportIdx">${dto.idx }</span></p>
							<p>신고자 ID : ${dto.userId }</p>
							<p>신고자 이름 : ${dto.userName }</p>
							<p>신고 타입 : <br>${dto.reportType }</p>
							<p>---------------------------</p>
							<p>신고된 리뷰 번호 : ${dto.reviewIdx}</p>
							<p>신고된 리뷰 작성자 ID : <br>${dto.reviewWriterId }</p>
							<p>신고된 리뷰 작성자 이름 : <br>${dto.reviewWriterName }</p>
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
		        <h2>리뷰 신고 상세내용</h2>
		        <div class="reportDetail">
					<p id="modalReservationNumber">리뷰 신고 번호 : </p>
					<p id="modalUserId">신고자 ID : </p>
					<p id="modalUserName">신고자 성함 : </p>
					<p id="modalReportType">신고 타입 : </p>
					<p>------------------------------------------------------------------------------------</p>
					<div class="reportWriterId">
						<p id="modalReviewWriterId">신고된 리뷰 작성자 ID : </p>
						<div class="blaockBtns">
							<button class="reviewBlock" data-review-id="">블락</button>
							<button class="reverseBlock" data-review-id="">해제</button>
						</div>
					</div>
					<p id="modalReviewWriterName">신고된 리뷰 작성자 이름 :</p> 
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
			    
			    
			    const url = `${cpath}/admin/reviewReportOne/`+idx
		 	    fetch(url)
			    .then(res => res.json())
			    .then(data => {
			    	// 모달 내용 업데이트
				    document.getElementById('modalReservationNumber').textContent = "리뷰 신고 번호: " + data.idx
				    document.getElementById('modalUserId').textContent = "신고자 ID: " + data.userId
				    document.getElementById('modalUserName').textContent = "신고자 성함: " + data.userName
				    document.getElementById('modalReportType').textContent = "신고 타입: " + data.reportType
				    document.getElementById('modalReviewWriterId').textContent = "신고된 리뷰 작성자 ID: " + data.reviewWriterId
				    document.getElementById('modalReviewWriterName').textContent = "신고된 리뷰 작성자 이름: " + data.reviewWriterName
				    document.getElementById('modalContent').textContent = "신고 내용: " + data.content
				    document.querySelector('.reviewBlock').setAttribute('data-review-id', data.reviewIdx)
				    document.querySelector('.reverseBlock').setAttribute('data-review-id', data.reviewIdx)
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

<!-- 리뷰 블락하기 스크립트 -->
<script>
//댓글 블락을 위한 새로운 코드
document.querySelector('.reviewBlock').addEventListener('click', function() {
    const reviewId = this.getAttribute('data-review-id');
    const blockUrl = `${cpath}/admin/blockReview/` + reviewId
    
    fetch(blockUrl, {
        method: 'POST',
    })
    .then(res => res.text())
    .then(data => {
        if (data == 1) {
            alert('댓글을 성공적으로 블락했습니다.')
            location.reload()
        } else {
            alert('댓글 블락에 실패했습니다.')
        }
    })
    .catch(error => {
        alert('오류가 발생했습니다.')
        console.error('Error:', error)
    });
});
	
</script>

<!-- 댓글 블락을 해제하는 스크립트 -->
<script>
document.querySelector('.reverseBlock').addEventListener('click', function() {
    const reviewId = this.getAttribute('data-review-id');
    const reverseUrl = `${cpath}/admin/reverseBlock/` + reviewId
    fetch(reverseUrl, {
        method: 'POST',
    })
    .then(res => res.text())
    .then(data => {
        if (data == 1) {
            alert('블락을 성공적으로 해제했습니다.')
            location.reload()
        } else {
            alert('블락 해제에 실패했습니다.')
        }
    })
    .catch(error => {
        alert('오류가 발생했습니다.')
        console.error('Error:', error)
    });
});
</script>
</body>
</html>