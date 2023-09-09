'use strict';

// reservation guestCount handler
function minusBtnHandler(event) {
	const guestCount = event.target.parentNode.children[1]
	const guestCountValue = +guestCount.innerText
	   
	if(guestCountValue - 1 > 0) {
		guestCount.innerText = guestCountValue - 1
	}
}
	
function plusBtnHandler(event) {
	const rent = document.querySelector('input[name="rent"]')
	const guestCount = event.target.parentNode.children[1]
	const guestCountValue = +guestCount.innerText
	const url = cpath + '/reservation/selectGuestCount/' + rent.value
	   
	fetch(url)
	.then(resp => resp.text())
	.then(text => {
		if(guestCountValue + 1 <= text) {
			guestCount.innerText = guestCountValue + 1
		}
	})  
}

// 결제 handler
function payHandler(event) {
	event.preventDefault()
	
	const rent = document.querySelector('input[name="rent"]').value
	const member = document.querySelector('input[name="member"]').value
	const sDateString = document.querySelector('input[name="sDateString"]').value
	const eDateString = document.querySelector('input[name="eDateString"]').value
	const guestCount = document.querySelector('.guestCountValue').innerText
	const totalPrice = document.querySelector('input[name="totalPrice"]')
	
	if(member == '') {
	    alert('로그인 후 이용해주세요 ~ ')
	    location.href = cpath + '/member/login?url=/room/' + rent
	    return
	 }
	 if(sDateString == '' || eDateString == '') {
	    alert('체크인 또는 체크아웃 날짜를 선택해주세요 ~~')
	    return
	 }
	 if(guestCount == '') {
	    alert('인원 수를 정해주세요 ~')
	    return
	 }
	 
	function dateFormat() {
		const date = new Date()
		const year = date.getFullYear()
		const month = String(date.getMonth() + 1).padStart(2, '0')
		const day = String(date.getDate()).padStart(2, '0')
		const hours = String(date.getHours()).padStart(2, '0')
		const minutes = String(date.getMinutes()).padStart(2, '0')
		const seconds = String(date.getSeconds()).padStart(2, '0')
	
	 	return year + month + day + hours + minutes + seconds
	 }
	 
	const date = dateFormat()
	const random = Math.floor(Math.random() * (1000000 - 1)) + 1
	const merchant_uid = date + '_' + random
    
	IMP.request_pay({
		pg: "kakaopay",
		merchant_uid: merchant_uid,
		name: title,
		amount: totalPrice.value,
		buyer_name: userName,
		buyer_tel: userPhone
	}, function (resp) {
	 	if(resp.success) {
			const url = cpath + '/insertReservation'
			const opt = {
				method: 'POST',
				headers: {                  
				   'Content-Type': 'application/json; charset=utf-8'
				},
				body: JSON.stringify({   
					rent: rent,
					member: member,
					sDateString: sDateString,
					eDateString: eDateString,
					guestCount: guestCount,
					totalPrice: totalPrice.value,
					merchant_uid: merchant_uid
				})
			}
		 		  
			fetch(url, opt)
			.then(resp => resp.text())
			.then(text => {
				if(text != 0 && text != null) {
					alert('예약이 완료되었습니다 ~~')
					location.href = cpath + '/reservation/reservationList/' + userIdx
				}
				else {
					alert('예약에 실패하셨습니다 ~~')
				}
			})
		}
	 	else {
			alert(resp.error_msg)
		}
	})
}

//roomImg handler
function inputImgHandler(event) {
   const src = event.target.src
   
   roomBigImg.src = src
}

//별점 출력 함수
function printStars() {
    const starPointElements = document.querySelectorAll('.starPoint')
    
    starPointElements.forEach(starPointElement => {
        const numStars = parseInt(starPointElement.textContent)
        if (!isNaN(numStars) && numStars > 0) {
            // 별점을 표시하는 문자열을 초기화
            let starRatingString = ''
            for (let i = 0; i < numStars; i++) {
                starRatingString += "⭐"
            }
            // 텍스트로 설정
            starPointElement.textContent = starRatingString
        } else {
            alert('올바른 숫자를 입력하세요.')
        }
    })
}

// totalPrice
function totalPriceHandler(sDateString, eDateString) {
	if(sDateString != '' && eDateString != '') {
		sDateString = sDateString.replaceAll('. ', '-')
		eDateString = eDateString.replaceAll('. ', '-')
		const startDate = new Date(sDateString)
		const endDate = new Date(eDateString)
		const timeDifference = endDate - startDate
		const daysDifference = Math.floor(timeDifference / (1000 * 60 * 60 * 24))
		const nights = daysDifference
		const nightValue = document.querySelector('.nightValue')
		nightValue.innerText = nights + '박'
	
		const totalPrice = document.querySelector('#totalPrice')
		const totalPriceValue = document.querySelector('input[name="totalPrice"]')
		totalPriceValue.value = price * nights
		totalPrice.innerText = '총 합계 ₩ ' + new Intl.NumberFormat().format(price * nights)
		
		const priceSpace = document.querySelector('.priceSpace')
		priceSpace.classList.remove('hidden')
	}
}

// delete review handler
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

//review report handler
function openReviewReportModal(reviewIdx) {
    reviewReportModal.style.display = 'block'
    const hiddenInput = document.querySelector('input[name="review"]')
    hiddenInput.value = reviewIdx
}