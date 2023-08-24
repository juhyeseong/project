<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>


<form class="join" method="POST" action="${cpath }/member/join">
	<fieldset>
		<legend>회원가입</legend>
		<p>
			<input type="text" name="userId" placeholder="아이디 입력"
				value="${dto.userId }" required> <input id="dupCheckBtn"
				type="button" value="중복확인"><br> <span id="dupMessage"></span>
		</p>
		<p>
			<input type="password" name="userPw" placeholder="비밀번호 입력" required>
		</p>
		<p>
			<input type="text" name="userNick" placeholder="닉네임 입력"
				value="${dto.userNick }" required>
		</p>

		<p>
			<input type="email" name="email" placeholder="이메일 입력"
				value="${dto.email }" required> <input type="button"
				id="sendAuthNumber" value="인증번호 발송">
		</p>
		<p class="hidden">
			<input type="number" name="authNumber" placeholder="인증번호 8자리"
				required> <input id="checkAuthNumber" type="button"
				value="인증번호 확인"> <br> <span id="authMessage"></span>
		</p>

		<p>
			<input type="text" name="userName" placeholder="이름 입력"
				value="${dto.userName }" required>
		</p>

		<p>
			<input type="text" name="year" placeholder="생년 입력" required>
			<select name="month" required>
				<option value="">생월 선택</option>
				<c:forEach var="i" begin="1" end="12" step="1">
					<option value="${i }">${i }월</option>
				</c:forEach>
			</select> <select name="day" required>
				<option value="">생일 선택</option>
				<c:forEach var="i" begin="1" end="31" step="1">
					<option value="${i }">${i }일</option>
				</c:forEach>
			</select>
		</p>
		<p>
			<input type="text" name="phoneNum" placeholder="전화번호 입력" required>
		</p>
		<p>
			<select name="gender" required>
				<option value="male">남성</option>
				<option value="female">여성</option>
			</select>
		</p>
		<p>
			<input type="submit" value="회원가입">
		</p>
	</fieldset>
</form>
<script>
	const sendAuthNumber = document.getElementById('sendAuthNumber')
	async function sendAuthNumberHandler() {
		const email = document.querySelector('input[name="email"]')
		
		const url = '${cpath}/sendAuthNumber/' + email.value + '/'
		const json = await fetch(url).then(resp => resp.json())
		alert(json.message)
		
		if(json.success == 1) {
			document.querySelector('p.hidden').classList.remove('hidden')
			document.querySelector('input[type="submit"]').disable = 'disabled'
		}
	}
	sendAuthNumber.onclick = sendAuthNumberHandler
	
	const checkAuthNumber = document.getElementById('checkAuthNumber')
	async function checkAuthNumberHandler(){
		const authNumber = document.querySelector('input[name="authNumber"]')
		if(authNumber.value == '') {
			return
		}
		const url = '${cpath}/checkAuthNumber/' + authNumber.value
		const row = await fetch(url).then(resp => resp.text())
		const authMessage = document.getElementById('authMessage')
		if(row != 0) {
			document.querySelector('input[type="submit"]').removeAttribute('disabled')
			authMessage.innerText = '인증 성공'
			authMessage.style.color = 'grey'
		}
		else { 
			authMessage.innerText = '인증 실패'
			authMessage.style.color = 'pink'
		}
	}
	checkAuthNumber.onclick = checkAuthNumberHandler
	
</script>

<script>
	const dupCheckBtn = document.getElementById('dupCheckBtn')
	
	async function dupCheckHandler(){
		const dupMessage = document.getElementById('dupMessage')
		const userId = document.querySelector('input[name="userId"]')
		
		if(userId.value == ''){
			dupCheckBtn.focus()
			alert('먼저 사용할 아이디를 입력해주세요')
			return
		}
		const url = '${cpath}/dupCheck/' + userId.value + '/'
		const count = await fetch(url).then(resp => resp.text())
		
		if(isNaN(count)){
			alert('처리도중 문제가 발생했습니다 !')
			userId.focus()
		}
		else if(count == 0){
			dupMessage.innerText = '사용가능한 아이디입니다.'
			dupMessage.style.color = 'grey'
		}
		else{
			dupMessage.innerText = '이미 사용중인 아이디입니다.'
			dupMessage.style.color = 'pink'
			userId.select()
		}
		
	}
	
	dupCheckBtn.addEventListener('click', dupCheckHandler)
	
</script>
</body>
</html>