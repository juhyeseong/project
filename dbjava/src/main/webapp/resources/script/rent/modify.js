'use strict';

// delete handler
function confirmDelete(event) {
	event.preventDefault()
	
	if(confirm('숙소를 정말 삭제하시겠습니까 ? ')) {
		location.href = cpath + '/rent/rentDelete/' + idx + "/" + member
	}
}

// title handler
function titleEnterHandler() {
	titleInfo.classList.add('hidden')
	titleModify.classList.remove('hidden')
}

function titleExitHandler() {
	titleInfo.classList.remove('hidden')
	titleModify.classList.add('hidden')
}

function titleSubmitHandler() {
	const titleValue = document.querySelector('input[name="title"]').value
	const opt = {
		method: 'POST',
		headers: {						
			'Content-Type': 'application/json; charset=utf-8'
		},
		body: JSON.stringify({		
			idx: idx,
			title: titleValue
		})
	}
	const url = cpath + '/rent/rentTitleUpdate'
	
	
	fetch(url, opt)
	.then(resp => resp.text())
	.then(text => {
		if(text != 0 && text != null) {
			alert('숙소 이름이 수정되었습니다 ~')
			location.reload()
		}
		else {
			alert('숙소 이름 수정에 실패했습니다.\n계속 실패할 경우 관리자에게 문의주세요 ~')
		}
	})
}

//content handler
function contentEnterHandler() {
	contentInfo.classList.add('hidden')
	contentModify.classList.remove('hidden')
}

function contentExitHandler() {
	contentInfo.classList.remove('hidden')
	contentModify.classList.add('hidden')
}

function contentSubmitHandler() {
	const contentValue = document.querySelector('.contentValue').value
	const opt = {
		method: 'POST',
		headers: {						
			'Content-Type': 'application/json; charset=utf-8'
		},
		body: JSON.stringify({		
			idx: idx,
			content: contentValue
		})
	}
	const url = cpath + '/rent/rentContentUpdate'
	
	fetch(url, opt)
	.then(resp => resp.text())
	.then(text => {
		if(text != 0 && text != null) {
			alert('숙소 정보가 수정되었습니다 ~')
			location.reload()
		}
		else {
			alert('숙소 정보 수정에 실패했습니다.\n계속 실패할 경우 관리자에게 문의주세요 ~')
		}
	})
}

//price handler
function priceEnterHandler() {
	priceInfo.classList.add('hidden')
	priceModify.classList.remove('hidden')
}

function priceExitHandler() {
	priceInfo.classList.remove('hidden')
	priceModify.classList.add('hidden')
}

function priceSubmitHandler() {
	const priceValue = document.querySelector('input[name="price"]').value
	const opt = {
		method: 'POST',
		headers: {						
			'Content-Type': 'application/json; charset=utf-8'
		},
		body: JSON.stringify({		
			idx: idx,
			price: priceValue
		})
	}
	const url = cpath + '/rent/rentPriceUpdate'
	
	fetch(url, opt)
	.then(resp => resp.text())
	.then(text => {
		if(text != 0 && text != null) {
			alert('숙소 가격이 수정되었습니다 ~')
			location.reload()
		}
		else {
			alert('숙소 가격 수정에 실패했습니다.\n계속 실패할 경우 관리자에게 문의주세요 ~')
		}
	})
}

// count handler
function minusHandler(event) {
	const target = event.target
	const column = target.parentNode.parentNode.children[0].innerText
	let countValue = target.parentNode.children[1].innerText
	if(countValue == 0) {
		return
	}
	countValue = +countValue
	
	const url = cpath + '/rent/rentCountUpdateMinus'
	const opt = {
		method: 'POST',
		headers: {						
			'Content-Type': 'application/json; charset=utf-8'
		},
	}
	
	if(column === '게스트 수') {
		opt.body = JSON.stringify({		
			idx: idx,
			guestCount: countValue
		})
	}
	if(column === '침대 수') {
		opt.body = JSON.stringify({		
			idx: idx,
			bedCount: countValue
		})
	}
	if(column === '욕실 수') {
		opt.body = JSON.stringify({		
			idx: idx,
			bathCount: countValue
		})
	}
	if(column === '방 수') {
		opt.body = JSON.stringify({		
			idx: idx,
			roomCount: countValue
		})
	}

	fetch(url, opt)
	.then(resp => resp.text())
	.then(text => {
		if(text != 0 && text != null) {
			location.reload()
		}
		else {
			alert('숙소 인원 및 공간 수정에 실패했습니다.\n계속 실패할 경우 관리자에게 문의주세요 ~')
		}
	})
}

function plusHandler(event) {
	const target = event.target
	const column = target.parentNode.parentNode.children[0].innerText
	let countValue = target.parentNode.children[1].innerText
	countValue = +countValue + 1
	
	const url = cpath + '/rent/rentCountUpdatePlus'
	const opt = {
		method: 'POST',
		headers: {						
			'Content-Type': 'application/json; charset=utf-8'
		},
	}
	
	if(column === '게스트 수') {
		opt.body = JSON.stringify({		
			idx: idx,
			guestCount: countValue
		})
	}
	if(column === '침대 수') {
		opt.body = JSON.stringify({		
			idx: idx,
			bedCount: countValue
		})
	}
	if(column === '욕실 수') {
		opt.body = JSON.stringify({		
			idx: idx,
			bathCount: countValue
		})
	}
	if(column === '방 수') {
		opt.body = JSON.stringify({		
			idx: idx,
			roomCount: countValue
		})
	}

	fetch(url, opt)
	.then(resp => resp.text())
	.then(text => {
		if(text != 0 && text != null) {
			location.reload()
		}
		else {
			alert('숙소 인원 및 공간 수정에 실패했습니다.\n계속 실패할 경우 관리자에게 문의주세요 ~')
		}
	})
}

//mode handler
async function restHandler() {
	const url = cpath + '/rent/restMode/' + idx
	
	await fetch(url)
	location.reload()
}

async function operateHandler() {
	const url = cpath + '/rent/operateMode/' + idx
	
	await fetch(url)
	location.reload()
}
