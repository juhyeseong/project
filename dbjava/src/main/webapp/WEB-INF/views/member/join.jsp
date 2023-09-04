<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>


<form class="join" method="POST" action="${cpath }/member/join">
	<fieldset>
		<legend>회원가입</legend>
		<p>
			<input class="joinUserId" type="text" name="userId" placeholder="아이디 입력"
				value="${dto.userId }" required> <input id="dupCheckBtn"
				type="button" value="중복확인"><br> <span id="dupMessage"></span>
		</p>
		<p>
			<input type="password" name="userPw" placeholder="비밀번호 입력" required>
		</p>
		<p>
			<input class="joinUserNick" type="text" name="userNick" placeholder="닉네임 입력"
				value="${dto.userNick }" required>
			<input type="button"
				id="dupNickBtn" value="닉네임 중복확인"><br> <span id="dupMessage2"></span>
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
			<input type="text" name="year" placeholder="태어난 년도" required>
			<select name="month" required>
				<option value="">태어난 달 선택</option>
				<c:forEach var="i" begin="1" end="12" step="1">
					<option value="${i }">${i }월</option>
				</c:forEach>
			</select> <select name="day" required>
				<option value="">태어난 날 선택</option>
				<c:forEach var="i" begin="1" end="31" step="1">
					<option value="${i }">${i }일</option>
				</c:forEach>
			</select>
		</p>
		<p class="phoneNum">
				<input type="tel" name="phoneNum" placeholder="ex ) 01012345678" required>
			</p>
		<p>
			<select name="gender" required>
				<option value="male">남성</option>
				<option value="female">여성</option>
			</select>
		</p>
		<p>
			<input class="submitBtn" type="submit" value="회원가입" disabled>
		</p>
	</fieldset>
</form>

<!-- 회원가입 성공 or 실패 시 alert 창 띄우기 -->
<script>
	document.querySelector('.join').addEventListener('submit')
</script>
<script>
	const sendAuthNumber = document.getElementById('sendAuthNumber')
	
	let cnt = 0 ;     // 인증 성공을 카운트하는 변수 , 초기값 0 으로 설정
	
	async function sendAuthNumberHandler() {
		const email = document.querySelector('input[name="email"]')
		const submitButton = document.querySelector('.submitBtn');
		
		const url = '${cpath}/sendAuthNumber/' + email.value + '/'
		const json = await fetch(url).then(resp => resp.json())
		alert(json.message)
		
		if(json.success == 1) {
			document.querySelector('p.hidden').classList.remove('hidden')

		}
	}
	sendAuthNumber.onclick = sendAuthNumberHandler
	
	const checkAuthNumber = document.getElementById('checkAuthNumber')
	async function checkAuthNumberHandler(){
		const authNumber = document.querySelector('input[name="authNumber"]')
		const submitButton = document.querySelector('.submitBtn');
		if(authNumber.value == '') {
			return
		}
		const url = '${cpath}/checkAuthNumber/' + authNumber.value
		const row = await fetch(url).then(resp => resp.text())
		const authMessage = document.getElementById('authMessage')
		if(row != 0) {
/* 			document.querySelector('input[type="submit"]').removeAttribute('disabled') */
			authMessage.innerText = '인증 성공'
			authMessage.style.color = 'grey'
			cnt += 1;
			console.log("count : " +cnt)
		if (cnt >= 3 ) {
		    document.querySelector('.submitBtn').removeAttribute('disabled');
		}
		}
		else { 
			authMessage.innerText = '인증 실패'
			authMessage.style.color = 'pink'
		    submitButton.setAttribute('disabled', 'disabled'); // 제출 버튼 비활성화

		}
	}
	checkAuthNumber.onclick = checkAuthNumberHandler
	
</script>

<script>
	const dupCheckBtn = document.getElementById('dupCheckBtn')
	const userId = document.querySelector('.joinUserId')
	async function dupCheckHandler(){
		const dupMessage = document.getElementById('dupMessage')
		const submitButton = document.querySelector('.submitBtn');
		
		if(userId.value == ''){
			dupCheckBtn.focus()
			alert('먼저 사용할 아이디를 입력해주세요')
			return
		}
		const url = '${cpath}/dupCheck/' + userId.value + '/'
		const count = await fetch(url).then(resp => resp.text())
		
		if(isNaN(count)){           //count 가 숫자가 아니면
			alert('처리도중 문제가 발생했습니다 !')       // 경고메시지 표시
			userId.focus()         // 입력필드에 포커스
		}
		else if(count == 0){     // 0인 경우
			dupMessage.innerText = '사용가능한 아이디입니다.';    // 가능 메시지 표시
	        dupMessage.style.color = 'grey'; 
	        cnt += 1;
	        console.log("count : " +cnt)
	        if (cnt >= 3 ) {     // cnt 3보다 크거나 같으면 
		   		document.querySelector('input[type="submit"]').removeAttribute('disabled');       // 제출버튼 활성화
			}
		}
		else{         // 이도 저도 아닌 경우, 이미 사용중인 아이디 메시지 띄우기
			dupMessage.innerText = '이미 사용중인 아이디입니다.'; 
	        dupMessage.style.color = 'pink';
	        submitButton.setAttribute('disabled', 'disabled'); // 제출 버튼 비활성화
		}
		
	}
	
	dupCheckBtn.addEventListener('click', dupCheckHandler)
	
</script>

<!-- 닉네임 중복확인 -->
<script>
const dupNickBtn = document.getElementById('dupNickBtn');
const userNick = document.querySelector('.joinUserNick');
async function dupNickHandler(){
	const dupMessage2 = document.getElementById('dupMessage2')
	const submitButton = document.querySelector('input[type="submit"]');
	
	if(userNick.value == ''){
		dupNickBtn.focus()
		alert('먼저 사용할 닉네임을 입력해주세요')
		return
	}
	const url = '${cpath}/dupCheck2/' + userNick.value + '/'
	const count2 = await fetch(url).then(resp => resp.text())
	
	if(isNaN(count2)){
		alert('처리도중 문제가 발생했습니다 !')
		userNick.focus()
	}
	else if(count2 == 0){
		dupMessage2.innerText = '사용가능한 닉네임입니다.';
        dupMessage2.style.color = 'grey';
        cnt += 1;
        console.log("count : " +cnt)
      	if (cnt >= 3 ) {
		    document.querySelector('input[type="submit"]').removeAttribute('disabled');
		}
	}
	else{
		dupMessage2.innerText = '이미 사용중인 닉네임입니다.';
        dupMessage2.style.color = 'pink';
        submitButton.setAttribute('disabled', 'disabled'); // 제출 버튼 비활성화

	}
	
}

dupNickBtn.addEventListener('click', dupNickHandler)




</script> 
</body>
</html>