'use strict';

async function wishDeleteHandler(event) {
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
	
	const response = await fetch(url, opt)
	
	if(response != 0) {
		location.reload()
	}
}