<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../manageHeader.jsp" %>
	<div class="rentModify">
		<div class="rentUpdateTop">
			<c:if test="${rent.state == 0 }">
				<button class="running">등록 중...</button>
			</c:if>
			<c:if test="${rent.state == 1 }">
				<button class="rest">휴식모드</button>
			</c:if>
			<c:if test="${rent.state == 2 }">
				<button class="operate">운영모드</button>
			</c:if>
		
			<a class="deleteRent"><button>삭제</button></a>
		</div>
		<div class="picture">
			<div class="pictureTop">
				<span>사진</span>
				<a href="${cpath }/rent/fileUpdate/${rent.idx}">수정 ></a>
			</div>
			<div class="pictureValue">
			<c:forEach var="filePath" items="${rent.filePathList }">
				<div><img src="${filePath }"></div>
			</c:forEach>
			</div>
		</div>
		<div class="rentBasicInfo">
			<h2>숙소 기본 정보</h2>
			
			<div class="basicInfo titleInfo">
				<div class="basicInfoTop titleInfoTop">
					<span>숙소 제목</span>
					<button>수정</button>
				</div>
				<div class="basicInfoBottom">${rent.title }</div>
			</div>
			<div class="basicModify titleModify hidden">
				<div class="basicModifyTop titleModifyTop">
					<span>숙소 제목</span>
					<button>✖</button>
				</div>
				<input type="text" name="title" value="${rent.title }">
				<button class="titleSubmit">저장하기</button>
			</div>
			<div class="basicInfo contentInfo">
				<div class="basicInfoTop contentInfoTop">
					<span>숙소 정보</span>
					<button>수정</button>
				</div>
				<div class="basicInfoBottom">
					<textarea>${rent.content }</textarea>
				</div>
			</div>
			<div class="basicModify contentModify hidden">
				<div class="basicModifyTop contentModifyTop">
					<span>숙소 정보</span>
					<button>✖</button>
				</div>
				<textarea class="contentValue">${rent.content }</textarea>
				<button class="contentSubmit">저장하기</button>
			</div>
			<div class="basicInfo priceInfo">
				<div class="basicInfoTop priceInfoTop">
					<span>숙소 가격</span>
					<button>수정</button>
				</div>
				<div class="basicInfoBottom commaPrice"><fmt:formatNumber value="${rent.price }" groupingUsed="true"/>원</div>
			</div>
			<div class="basicModify priceModify hidden">
				<div class="basicModifyTop priceModifyTop">
					<span>숙소 가격</span>
					<button>✖</button>
				</div>
				<input type="number" name="price" value="${rent.price }">
				<button class="priceSubmit">저장하기</button>
			</div>
			
			<div class="basicCount">
				<h3>숙소 인원 및 공간</h3>
				<span style="color: gray;">인원 및 공간의 경우 수정 시 자동 저장됩니다</span>
				<div class="basicCountSpace">
					<div class="basicCountLeft">게스트 수</div>
					<div class="basicCountRight">
						<button class="minus">➖</button>
						<span>${rent.guestCount }</span>
						<button class="plus">➕</button>
					</div>
				</div>
				<div class="basicCountSpace">
					<div class="basicCountLeft">침대 수</div>
					<div class="basicCountRight">
						<button class="minus">➖</button>
						<span>${rent.bedCount }</span>
						<button class="plus">➕</button>
					</div>
				</div>
				<c:if test="${rent.roomType != '원룸' }">
					<div class="basicCountSpace">
						<div class="basicCountLeft">욕실 수</div>
						<div class="basicCountRight">
							<button class="minus">➖</button>
							<span>${rent.bathCount }</span>
							<button class="plus">➕</button>
						</div>
					</div>
					<div class="basicCountSpace">
						<div class="basicCountLeft">방 수</div>
						<div class="basicCountRight">
							<button class="minus">➖</button>
							<span>${rent.roomCount }</span>
							<button class="plus">➕</button>
						</div>
					</div>
				</c:if>
			</div>
		</div>
	</div>
	
	<script>
		// el tag 변수
		const cpath = '${cpath }'
		const idx = '${rent.idx }'
		const member = '${login.idx }'
		// title 변수
		const titleInfo = document.querySelector('.titleInfo')
		const titleModify = document.querySelector('.titleModify')
		const titleModifyBtn = document.querySelector('.titleInfoTop > button')
		const titleExit = document.querySelector('.titleModifyTop > button')
		const titleSubmit = document.querySelector('.titleSubmit')
		
		// content 변수
		const contentInfo = document.querySelector('.contentInfo')
		const contentModify = document.querySelector('.contentModify')
		const contentModifyBtn = document.querySelector('.contentInfoTop > button')
		const contentExit = document.querySelector('.contentModifyTop > button')
		const contentSubmit = document.querySelector('.contentSubmit')
		const textarea = document.querySelector('.basicInfoBottom textarea')
		textarea.style.height = (textarea.scrollHeight) + "px"
		contentInfo.style.height = (textarea.scrollHeight) + 50 + "px"
		
		// price 변수
		const priceInfo = document.querySelector('.priceInfo')
		const priceModify = document.querySelector('.priceModify')
		const priceModifyBtn = document.querySelector('.priceInfoTop > button')
		const priceExit = document.querySelector('.priceModifyTop > button')
		const priceSubmit = document.querySelector('.priceSubmit')
		const commaPrice = document.querySelector('.commaPrice')
		const price = ${rent.price }
		
		// count 변수
		const minusList = document.querySelectorAll('.minus')
		const plusList = document.querySelectorAll('.plus')
		
		// mode 변수
		const rest = document.querySelector('.rest')
		const operate = document.querySelector('.operate')
		
		// delete button
		const deleteRentBtn = document.querySelector('.deleteRent')
		
		function confirmDelete(event) {
			event.preventDefault()
			
			if(confirm('숙소를 정말 삭제하시겠습니까 ? ')) {
				location.href = cpath + '/rent/rentDelete/' + idx + "/" + member
			}
		}
		
		deleteRentBtn.onclick = confirmDelete
		
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
		
		// price handler
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
		
		// mode handler
		function restHandler() {
			const url = cpath + '/rent/restMode/' + idx
			
			fetch(url)
			location.reload()
		}
		
		function operateHandler() {
			const url = cpath + '/rent/operateMode/' + idx
			
			fetch(url)
			location.reload()
		}
		
		// title event
		titleModifyBtn.onclick = titleEnterHandler
		titleExit.onclick = titleExitHandler
		titleSubmit.onclick = titleSubmitHandler
		// content event
		contentModifyBtn.onclick = contentEnterHandler
		contentExit.onclick = contentExitHandler
		contentSubmit.onclick = contentSubmitHandler
		// price event
		priceModifyBtn.onclick = priceEnterHandler
		priceExit.onclick = priceExitHandler
		priceSubmit.onclick = priceSubmitHandler
		// count event
		minusList.forEach(minus => minus.onclick = minusHandler)
		plusList.forEach(plus => plus.onclick = plusHandler)
		// mode event
		if(rest != null) {
			rest.onclick = restHandler
		}
		if(operate != null) {
			operate.onclick = operateHandler
		}
	</script>
</body>
</html>