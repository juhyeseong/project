'use strict';

function cancelPay(access_token, reservationIdx, merchant_uid, totalPrice) {
	const url = cpath + '/cancelPay'
	const opt = {
            method: 'POST',
            headers: {                  
               'Content-Type': 'application/json; charset=utf-8'
            },
            body: JSON.stringify({   
               merchant_uid: merchant_uid,
               cancel_request_amount: totalPrice,
               access_token: access_token,
               reservationIdx: reservationIdx
            })
         }
	fetch(url, opt)
	.then(resp => resp.text())
	.then(text => {
		if(text != 0 && text != null) {
			alert('환불 및 예약이 취소되었습니다 ~~')
			location.reload()
		}
		else {
			alert('환불 실패하였습니다 ~\n계속 실패할 경우 관리자에게 문의주세요 ~~')
		}
	})
}

async function payCancelHandler(event) {
	if(confirm('정말 예약을 취소하시겠습니까 ?')) {
		const url = cpath + '/getToken'
		const json = await fetch(url).then(resp => resp.json())
		const access_token = json.response.access_token
		const totalPrice = event.target.parentNode.parentNode.children[4].value
		const reservationIdx = event.target.parentNode.parentNode.children[7].value
		const merchant_uid = event.target.parentNode.parentNode.children[8].value
		
		if(access_token != null) {
			cancelPay(access_token, reservationIdx, merchant_uid, totalPrice)
		}
	}
}