'use strict';

// 인증번호 전송 handler
async function sendAuthNumberHandler() {
	const email = document.querySelector('input[name="email"]')
	const submitButton = document.querySelector('.submitBtn');
	
	const url = cpath + '/sendAuthNumber/' + email.value + '/'
	const json = await fetch(url).then(resp => resp.json())
	alert(json.message)
	
	if(json.success == 1) {
		document.querySelector('p.hidden').classList.remove('hidden')
	}
}

// 인증번호 확인 handler
async function checkAuthNumberHandler(){
	const authNumber = document.querySelector('input[name="authNumber"]')
	const submitButton = document.querySelector('.submitBtn');
	if(authNumber.value == '') {
		return
	}
	const url = cpath + '/checkAuthNumber/' + authNumber.value
	const row = await fetch(url).then(resp => resp.text())
	const authMessage = document.getElementById('authMessage')
	if(row != 0) {
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

// id 중복확인 handler
async function dupCheckHandler(){
	const dupMessage = document.getElementById('dupMessage')
	const submitButton = document.querySelector('.submitBtn');
	
	if(userId.value == ''){
		dupCheckBtn.focus()
		alert('먼저 사용할 아이디를 입력해주세요')
		return
	}
	const url = cpath + '/dupCheck/' + userId.value + '/'
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

// 닉네임 중복확인 handler
async function dupNickHandler(){
	const dupMessage2 = document.getElementById('dupMessage2')
	const submitButton = document.querySelector('input[type="submit"]');
	
	if(userNick.value == ''){
		dupNickBtn.focus()
		alert('먼저 사용할 닉네임을 입력해주세요')
		return
	}
	const url = cpath + '/dupCheck2/' + userNick.value + '/'
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