<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
	<main class="myReviewMain">
		<div class="myReviewBox">
			<span class="myReviewTitle">내가 작성한 리뷰보기</span>
		</div>
		<div class="searchBox">
			<div id="searchFilter">
				<form method="post">
					<input type="text" name="search" id="searchBar"
						placeholder="작성한 내용으로 검색">

					<button class="searchBtn">검색</button>
				</form>
				<a href="${cpath }/member/myReview/${idx}"><button class="resetBtn">초기화</button></a>
			</div>
		</div> 
		<div class="myReviewsListBox">
 			<c:forEach var="dto" items="${list }">
				<div class="myReviewRow">
					<div class="myReviewContentBox">
						<div class="myReviewStars">
							<c:forEach var="i" begin="1" end="${dto.point }">
								<span>⭐️</span>
							</c:forEach>				
								${dto.point }
						</div>
						<div class="myReviewContent">
							<textarea class="myReviewTextarea" readonly>${dto.content }</textarea>
						</div>
					</div>
					<div class="myReviewPictureBox">
						<div class="myReviewPicture carousel">
							<c:if test="${dto.filePath != null}">
								<c:if test="${fn:contains(dto.filePath, ',')}">
									<button class="prevBtn btnShape"><</button>
									<button class="nextBtn btnShape">></button>
								</c:if>
								<c:forTokens var="picture" items="${dto.filePath }" delims=",">
									<div class="myReviewImgsBox">
										<img class="myReviewImgs" src="${picture }" />
									</div>
								</c:forTokens>
							</c:if>
						</div>
					</div>
					<span class="deleteReviewBtn" onclick="deleteReview(${dto.idx})">삭제하기</span>
				</div>
			 </c:forEach>
		</div>
	</main>
	<script src="${cpath }/resources/script/member/myReview.js"></script>
	<script>
		const cpath = '${cpath }'
	    const reviewCarousels = document.querySelectorAll('.carousel') // 모든 리뷰 캐러셀을 선택합니다.
        let currentPage = 0
	
	    // 캐러셀을 초기화하고 현재 페이지를 추적하는 변수를 추가합니다.
	    reviewCarousels.forEach((carousel, index) => {
	        // 변경: 이전 버튼과 다음 버튼에 이벤트 리스너를 추가합니다.
	        const prevButton = carousel.querySelector('.prevBtn') // 캐러셀 내의 이전 버튼을 선택합니다.
	        const nextButton = carousel.querySelector('.nextBtn') // 캐러셀 내의 다음 버튼을 선택합니다.
	
	        if (prevButton) {
	            prevButton.onclick = prevPage // 이전 버튼의 클릭 이벤트에 함수를 연결합니다.
	        }
	        if (nextButton) {
	            nextButton.onclick = nextPage // 다음 버튼의 클릭 이벤트에 함수를 연결합니다.
	        }
	
	        // 초기 페이지를 업데이트합니다.
	        updatePage()
	    });
	</script>
</body>
</html>