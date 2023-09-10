'use strict'

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