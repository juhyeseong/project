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
								<button class="prevBtn btnShape"><</button>
								<button class="nextBtn btnShape">></button>
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
	

	
	<!-- 리뷰 이미지 캐러셀 -->
	<script>
    const reviewCarousels = document.querySelectorAll('.carousel') // 모든 리뷰 캐러셀을 선택합니다.

    // 캐러셀을 초기화하고 현재 페이지를 추적하는 변수를 추가합니다.
    reviewCarousels.forEach((carousel, index) => {
        let currentPage = 0;

        // 페이지를 업데이트하고 보이지 않는 항목을 숨깁니다.
        function updatePage() {
            const itemsPerPage = 1 // 한 번에 보여줄 항목 수를 설정합니다.
            const reviewItems = carousel.querySelectorAll('.myReviewImgs'); // 변경: 클래스 이름이 올바른지 확인하세요.

            reviewItems.forEach((item, itemIndex) => {
                if (itemIndex >= currentPage * itemsPerPage && itemIndex < (currentPage + 1) * itemsPerPage) {
                    item.style.display = 'block';
                }
                else {
                    item.style.display = 'none';
                }
            });
        }

        // 이전 페이지로 이동하는 함수
        function prevPage() {
            if (currentPage > 0) {
                currentPage--;
                updatePage();
            }
        }

        // 다음 페이지로 이동하는 함수
        function nextPage() {
            const itemsPerPage = 1; // 한 번에 보여줄 항목 수를 설정합니다.
            const reviewItems = carousel.querySelectorAll('.myReviewImgs'); // 변경: 클래스 이름이 올바른지 확인하세요.
            const totalPages = Math.ceil(reviewItems.length / itemsPerPage);

            if (currentPage < totalPages - 1) {
                currentPage++;
                updatePage();
            }
        }

        // 변경: 이전 버튼과 다음 버튼에 이벤트 리스너를 추가합니다.
        const prevButton = carousel.querySelector('.prevBtn'); // 캐러셀 내의 이전 버튼을 선택합니다.
        const nextButton = carousel.querySelector('.nextBtn'); // 캐러셀 내의 다음 버튼을 선택합니다.

        if (prevButton) {
            prevButton.onclick = prevPage; // 이전 버튼의 클릭 이벤트에 함수를 연결합니다.
        }
        if (nextButton) {
            nextButton.onclick = nextPage; // 다음 버튼의 클릭 이벤트에 함수를 연결합니다.
        }

        // 초기 페이지를 업데이트합니다.
        updatePage();
    });
	</script> 
	
	<!-- delete 코드 수행시 리로드하는 스크립트 -->
	<script>
	function deleteReview(reviewId) {
	    if (confirm("이 리뷰를 삭제하시겠습니까?")) {
	       fetch(`${cpath}/review/delete/` + reviewId, {
	            method: 'DELETE'
	        })
	        .then(response => response.text())
	        .then(data => {
	            alert('리뷰 삭제 성공')
	            location.reload()
	        })
	        .catch(error => {
	            alert('리뷰 삭제 실패')
	        })
	    }
	}
	</script>

</body>
</html>