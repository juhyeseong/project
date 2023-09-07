<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<script src='https://code.jquery.com/jquery-3.1.1.min.js'></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>

<!-- 네이버로그인에 필요한 js -->
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>

<div class="login">
	<fieldset>
		<legend>Welcome JavaBang</legend>
		<form method="POST">
			<p>
				<input type="text" name="userId" placeholder="아이디" style="padding-left:10px;" required>
			</p>
			<p class="passwordBox">
				<input id="password" type="password" name="userPw" placeholder="비밀번호" style="padding-left:10px;" required> <span id="toggleButton" onclick="togglePasswordVisibility()">🙂</span>
			</p>
			<p>
				<input type="submit" value="로그인">
			</p>
		</form>

		<p>or</p>
		<c:if test="${not empty param.url }">
			<c:set var="url" value="?url=${param.url }"/>
		</c:if>
		<div class="socialbox">
			<div id="kakaologin">
				<form method="POST" action="${cpath }/api/kakaosignup${not empty param.url ? url : ''}">
					<input type="hidden" name="userId" id="kakaoid" />
					<input type="hidden" name="userName" id="kakaoname" />
					<input type="hidden" name="userNick" id="kakaonick" />
					<input type="hidden" name="gender" id="kakaogender" />
					<input type="hidden" name="email" id="kakaoemail" />
					<button class="kakao">
						<img src="http://192.168.64.200/kakaoLogo.png"> 카카오 아이디로 로그인
					</button>
				</form>
			</div>
			<div id="naver_id_login"></div>
			<div id="naver_login_form">
				<form id="naverFrom" method="POST">
					<input type="hidden" name="userId" id="naverid"/>
					<input type="hidden" name="userName" id="navername"/>  
					<input type="hidden" name="userNick" id="navernick"/>
				</form>
			</div>
		</div>
		<p>
			<a href="${cpath }/member/join">회원가입 </a>
			 | 
			<a href="${cpath }/member/resetPassword">비밀번호재설정 </a>
			 | 
			<a href="${cpath }/member/findId">아이디찾기</a>
		</p>
	</fieldset>
</div>
<!--  카카오로그인 script -->
<script>
	const cpath = '${cpath }'
</script>
<script>
 	const kakaologin = document.getElementById('kakaologin')
 	//9f70d9bb54ab5d75fd02bf5b519c5a11
 	window.Kakao.init("9f70d9bb54ab5d75fd02bf5b519c5a11");     // kakao sdk 를 초기화 , 클라이언트 아이디 제공
 	
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
				 	 
						event.target.parentNode.submit()              // 정보를 폼에 넣고 폼을 서버로 제출함
					}
				});
			}
 		});
 	}
 	
 	function rmsessionStorage() {
 		sessionStorage.removeItem('url')
 	}
 	
 	window.addEventListener("beforeunload", rmsessionStorage)
 	kakaologin.addEventListener('click',kakaoLogin)    // 클릭하면 kakaoLogin 함수가 실행돼서 로그인 시작
 </script>

<!-- 네이버로그인 script-->
<script>
	const url = '${url }'
	if(url != '') {
		sessionStorage.setItem('url', url)
	}
	console.log(sessionStorage.getItem('url'))
	
  	var naver_id_login = new naver_id_login("QBQcG_g3ay39MPum66CS", "http://localhost:8080/dbjava/member/login")    // 네이버 아이디 로그인을 위한 객체, 클라이언트 아이디, 로그인 후 리다이렉션 될 사용자 정보를 전달
  	var state = naver_id_login.getUniqState()   	// 고유 상태 값 생성 -> state 변수에 저장
  	naver_id_login.setButton("green", 3, 50)		// 네이버 아이디 버튼 생성
  	state += url
  	naver_id_login.setState(state)
  	naver_id_login.init_naver_id_login()
  	
  	naver_id_login.get_naver_userprofile("naverSignInCallback()");
	// 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
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
		if(sessionStorage.getItem('url') != '' && sessionStorage.getItem('url') != null) {
			actionUrl = actionUrl + sessionStorage.getItem('url')
		}

		naverLoginForm.action = actionUrl
		naverLoginForm.submit()
	}
</script>

<!-- 눈 아이콘 클릭시 비밀번호 보기 -->
<script>
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
</script>
</body>
</html>