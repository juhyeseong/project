<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../manageHeader.jsp" %>
	<script>
		const cpath = '${cpath }'
	</script>
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
		
			<a href="${cpath }/rent/rentDelete"><button>삭제</button></a>
		</div>
		<div class="picture">
			<div class="pictureTop">
				<span>사진</span>
				<a href="${cpath }/rent/fileUpdate/${rent.idx}">수정 ></a>
			</div>
			<div class="pictureValue">
			<c:forEach var="filePath" items="${rent.filePath }">
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
				<input name="title" value="${rent.title }">
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
			<div class="basicInfo">
				<div class="basicInfoTop">
					<span>숙소 제목</span>
					<button>수정</button>
				</div>
				<div class="basicInfoBottom">${rent.title }</div>
			</div>
			<div class="basicModify hidden">
				<div class="basicModifyTop">
					<span>숙소 제목</span>
					<button>✖</button>
				</div>
				<input name="title" value="${rent.title }">
				<button>저장하기</button>
			</div>
		</div>
	</div>
	
	<script>
		// title 변수
		const titleInfo = document.querySelector('.titleInfo')
		const titleModify = document.querySelector('.titleModify')
		const titleModifyBtn = document.querySelector('.titleInfoTop > button')
		const titleExit = document.querySelector('.titleModifyTop > button')
		const titleSubmit = document.querySelector('.titleSubmit')
		const idx = ${rent.idx }
		
		// content 변수
		const contentInfo = document.querySelector('.contentInfo')
		const contentModify = document.querySelector('.contentModify')
		const contentModifyBtn = document.querySelector('.contentInfoTop > button')
		const contentExit = document.querySelector('.contentModifyTop > button')
		const contentSubmit = document.querySelector('.contentSubmit')
		const textarea = document.querySelector('.basicInfoBottom textarea')
		textarea.style.height = (textarea.scrollHeight) + "px"
		contentInfo.style.height = (textarea.scrollHeight) + 50 + "px"
		
		
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
				if(text != 0) {
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
				if(text != 0) {
					alert('숙소 정보가 수정되었습니다 ~')
					location.reload()
				}
				else {
					alert('숙소 정보 수정에 실패했습니다.\n계속 실패할 경우 관리자에게 문의주세요 ~')
				}
			})
		}
		
		// title event
		titleModifyBtn.onclick = titleEnterHandler
		titleExit.onclick = titleExitHandler
		titleSubmit.onclick = titleSubmitHandler
		// content event
		contentModifyBtn.onclick = contentEnterHandler
		contentExit.onclick = contentExitHandler
		contentSubmit.onclick = contentSubmitHandler
	</script>
</body>
</html>