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
				<input type="text" name="year" placeholder="ex ) 1988" required>
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
	
	<script src="${cpath }/resources/script/member/join.js"></script>
	<script>
		const cpath = '${cpath }'
		// 인증번호 전송 변수
		const sendAuthNumber = document.getElementById('sendAuthNumber')
		let cnt = 0 ;     // 인증 성공을 카운트하는 변수 , 초기값 0 으로 설정
		// 인증번호 확인 변수
		const checkAuthNumber = document.getElementById('checkAuthNumber')
		// id 중복확인 변수
		const dupCheckBtn = document.getElementById('dupCheckBtn')
		const userId = document.querySelector('.joinUserId')
		// 닉네임 중복확인 변수
		const dupNickBtn = document.getElementById('dupNickBtn');
		const userNick = document.querySelector('.joinUserNick');
		
		// 인증번호 전송 event
		sendAuthNumber.onclick = sendAuthNumberHandler
		// 인증번호 확인 event
		checkAuthNumber.onclick = checkAuthNumberHandler
		// id 중복확인 event
		dupCheckBtn.addEventListener('click', dupCheckHandler)
		// 닉네임 중복확인 event
		dupNickBtn.addEventListener('click', dupNickHandler)
		// 회원가입 submit event, handler
		document.querySelector('.join').addEventListener('submit', function(event){
			event.preventDefault()
			const formData = new FormData(event.target)
			const url = cpath + '/member/join'
			fetch(url, {
				method: 'POST',
				body : formData,
			})
			.then(response => {
				if(response.ok){
					alert('회원가입 성공 !')
					window.location.href = '${cpath}/member/login'
				}
				else{
					alert('회원가입 실패. . ')
				}
			})
			.catch(error => {
				alert('회원가입 중 오류가 발생했습니다')
			})
		})
	</script> 
</body>
</html>