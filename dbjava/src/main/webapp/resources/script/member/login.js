'use strict';

// 일반 login handler
	function loginHandler(event) {
		event.preventDefault()
	sessionStorage.removeItem('url')
	submitBtn.submit()
}

// kakaoLogin handler
async function kakaoLogin(event){
	event.preventDefault(); // 기본 동작 막기
	await window.Kakao.Auth.login({             // 카카오 로그인을 시도, 사용자 정보에 접근 권한을 요청
		scope:'profile_nickname, account_email, profile_image, 	gender',
		success: function(authObj){          // 로그인이 성공적으로 되면 콜백 함수 실행
			console.log(authObj);
			window.Kakao.API.request({      // 사용자 정보를 가져오기 위해 사용
				url:'/v2/user/me',
				success: res => {
					const kakao_account = res.kakao_account;
					/* const userId = res.kakao_account.email; */
					const userId = res.id;
					const userNick = res.kakao_account.profile.nickname;
					const email = res.kakao_account.email;
					const gender = res.kakao_account.gender;
					
					document.getElementById('kakaoid').value = userId
					document.getElementById('kakaoname').value = userNick
					document.getElementById('kakaonick').value = userNick
					document.getElementById('kakaogender').value = gender
					document.getElementById('kakaoemail').value = email
			 	 

					sessionStorage.removeItem('url')
					event.target.parentNode.submit()              // 정보를 폼에 넣고 폼을 서버로 제출함
				}
			});
		}
	});
}

// naver login handler
function naverSignInCallback() {
    const email = naver_id_login.getProfileData('email')
    const nickname = naver_id_login.getProfileData('nickname')
    const name = naver_id_login.getProfileData('name')
    const gender = naver_id_login.getProfileData('gender')
    const naverEmail = document.getElementById('naverid')
    const naverNick = document.getElementById('navernick')
    const naverName = document.getElementById('navername')
    
	naverEmail.value = email
	naverNick.value = nickname
	naverName.value = name
				 	 
	const naverLoginForm = document.getElementById('naverFrom')
	let actionUrl = cpath + '/api/naversignup'
	if(storageUrl != '' && storageUrl != null) {
		actionUrl = actionUrl + storageUrl
	}
    
    sessionStorage.removeItem('url')
	naverLoginForm.action = actionUrl
	naverLoginForm.submit()
}

function togglePasswordVisibility() {
    var passwordInput = document.getElementById("password");
    var toggleButton = document.getElementById("toggleButton");
    if (passwordInput.type === "password") {
        passwordInput.type = "text";
        toggleButton.textContent = "😌";
    } else {
        passwordInput.type = "password";
        toggleButton.textContent = "🙂";
    }
}