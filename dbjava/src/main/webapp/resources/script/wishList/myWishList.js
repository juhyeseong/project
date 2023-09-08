'use strict';

function wishDeleteHandler(event) {
	const target = event.target
	const rentIdx = target.parentNode.parentNode.children[2]
	const opt = {
			method: 'POST',
			headers:  {
				'CONTENT-TYPE' : 'application/json; charset=utf-8'
			},
			body: JSON.stringify({
				rent: rentIdx.value,
				member: loginIdx
			})
	}
	const url = cpath + '/wishList/deleteWishList'
	
	console.log(loginIdx)
	console.log(rentIdx.value)
	
	fetch(url, opt)
	location.reload()
}