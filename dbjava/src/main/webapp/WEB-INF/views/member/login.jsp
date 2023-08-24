<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<script src='https://code.jquery.com/jquery-3.1.1.min.js'></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script
	src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js"
	charset="utf-8"></script>

<!-- 네이버로그인에 필요한 js -->
<script type="text/javascript"
	src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"
	charset="utf-8"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.3.min.js"></script>

<div class="login">
	<fieldset>
		<legend>Welcome JavaBang</legend>
		<form method="POST" action="${cpath }/member/login">
			<p>
				<input type="text" name="userId" placeholder="아이디" required>
			</p>
			<p class="passwordBox">
				<input id="password" type="password" name="userPw"
					placeholder="비밀번호" required> <span id="toggleButton"
					onclick="togglePasswordVisibility()">O_O</span>
			</p>
			<p>
				<input type="submit" value="로그인">
			</p>
		</form>
		<%-- 테스트 용으로 남겨둠 
			 <p> <a href="http://developers.kakao.com/logout">카카오로그아웃</a> </p> 
 		     <p><a href="https://nid.naver.com/nidlogin.logout?returl=${cpath }/dbjava/member/login">네이버 로그아웃</a></p> 
 		  --%>

		<p>or</p>
		<div class="socialbox">
			<div id="kakaologin">
				<form method="post" action="${cpath }/api/kakaosignup">
					<input type="hidden" name="userId" id="kakaoid" /> <input
						type="hidden" name="userName" id="kakaoname" /> <input
						type="hidden" name="userNick" id="kakaonick" /> <input
						type="hidden" name="gender" id="kakaogender" /> <input
						type="hidden" name="email" id="kakaoemail" />
					<button class="kakao">
						<img src="http://192.168.64.200/kakaoLogo.jpeg"> 카카오 아이디로
						로그인
					</button>
				</form>
			</div>
			<div id="naver_id_login"></div>
		</div>
		<p>
			<a href="${cpath }/member/join">회원가입 </a> | <a
				href="${cpath }/member/resetPassword">비밀번호재설정 </a> | <a
				href="${cpath }/member/findId">아이디찾기</a>
		</p>
	</fieldset>
</div>
<!--  카카오로그인 script -->
<script>
 	const kakaologin = document.getElementById('kakaologin')
 	//9f70d9bb54ab5d75fd02bf5b519c5a11
 	window.Kakao.init("9f70d9bb54ab5d75fd02bf5b519c5a11");
 	
 	async function kakaoLogin(event){
 	  event.preventDefault(); // 기본 동작 막기
 		  await window.Kakao.Auth.login({
 			scope:'profile_nickname, account_email, profile_image, 	gender',
 			success: function(authObj){
 				console.log(authObj);
 				window.Kakao.API.request({
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
 				 	 
 						event.target.parentNode.submit()
 					}
 				});
 			}
 		});
 	}
 	kakaologin.addEventListener('click',kakaoLogin)
 </script>

<!-- 네이버로그인 script-->

<script>
	  	var naver_id_login = new naver_id_login("QBQcG_g3ay39MPum66CS", "http://localhost:8080/dbjava/member/navercallback");
	  	var state = naver_id_login.getUniqState();
	  	naver_id_login.setButton("green", 3, 50);
	  	naver_id_login.setDomain("http://localhost:8080/dbjava/member/login");
	  	naver_id_login.setState(state);
	  	naver_id_login.init_naver_id_login();
</script>

<!-- 눈 아이콘 클릭시 비밀번호 보기 -->
<script>
function togglePasswordVisibility() {
    var passwordInput = document.getElementById("password");
    var toggleButton = document.getElementById("toggleButton");
    if (passwordInput.type === "password") {
        passwordInput.type = "text";
        toggleButton.textContent = "◡‿◡";
    } else {
        passwordInput.type = "password";
        toggleButton.textContent = "O_O";
    }
}
</script>
</body>
</html>