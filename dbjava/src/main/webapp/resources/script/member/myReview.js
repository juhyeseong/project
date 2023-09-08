'use strict'

//페이지를 업데이트하고 보이지 않는 항목을 숨깁니다.
function updatePage() {
    const itemsPerPage = 1 // 한 번에 보여줄 항목 수를 설정합니다.
    const reviewItems = document.querySelectorAll('.myReviewImgs') // 변경: 클래스 이름이 올바른지 확인하세요.

    reviewItems.forEach((item, itemIndex) => {
        if (itemIndex >= currentPage * itemsPerPage && itemIndex < (currentPage + 1) * itemsPerPage) {
            item.style.display = 'block'
        }
        else {
            item.style.display = 'none'
        }
    })
}

// 이전 페이지로 이동하는 함수
function prevPage() {
    if (currentPage > 0) {
        currentPage--
        updatePage()
    }
}

// 다음 페이지로 이동하는 함수
function nextPage() {
    const itemsPerPage = 1 // 한 번에 보여줄 항목 수를 설정합니다.
    const reviewItems = document.querySelectorAll('.myReviewImgs') // 변경: 클래스 이름이 올바른지 확인하세요.
    const totalPages = Math.ceil(reviewItems.length / itemsPerPage)

    if (currentPage < totalPages - 1) {
        currentPage++
        updatePage()
    }
}

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