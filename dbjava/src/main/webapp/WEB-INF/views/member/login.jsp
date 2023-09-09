<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
	<c:if test="${not empty param.url }">
		<c:set var="url" value="?url=${param.url }"/>
	</c:if>
	<script src='https://code.jquery.com/jquery-3.1.1.min.js'></script>
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	<script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
	
	<!-- 네이버로그인에 필요한 js -->
	<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
	<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
	
	<div class="login">
		<fieldset>
			<legend>Welcome JavaBang</legend>
			<form method="POST" action="${cpath }/member/login${not empty param.url ? url : ''}">
				<p>
					<input id="userId" type="text" name="userId" placeholder="아이디" style="padding-left:10px;" required>
				</p>
				<p class="passwordBox">
					<input id="password" type="password" name="userPw" placeholder="비밀번호" style="padding-left:10px;" required> <span id="toggleButton" onclick="togglePasswordVisibility()">🙂</span>
				</p>
				<p>
					<input type="submit" value="로그인">
				</p>
			</form>
	
			<p>or</p>
			
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
				<a href="${cpath }/member/findId">아이디찾기</a>
				 | 
				<a href="${cpath }/member/resetPassword">비밀번호재설정 </a>
			</p>
		</fieldset>
	</div>
	<script src="${cpath }/resources/script/member/login.js"></script>
	<script>
		// el tag 변수
	 	const cpath = '${cpath }'
		const url = '${url }'
		if(url != '') {
			sessionStorage.setItem('url', url)
		}
		const storageUrl = sessionStorage.getItem('url')
		// 일반 login 변수
		const submitBtn = document.querySelector('input[type="submit"]')
		// kakaoLogin 변수
	 	const kakaologin = document.getElementById('kakaologin')
	 	window.Kakao.init("9f70d9bb54ab5d75fd02bf5b519c5a11");     // kakao sdk 를 초기화 , 클라이언트 아이디 제공
		// naverLogin 변수
	  	var naver_id_login = new naver_id_login("QBQcG_g3ay39MPum66CS", "http://192.168.64.128/dbjava/member/login")    // 네이버 아이디 로그인을 위한 객체, 클라이언트 아이디, 로그인 후 리다이렉션 될 사용자 정보를 전달
	  	var state = naver_id_login.getUniqState()   	// 고유 상태 값 생성 -> state 변수에 저장
	  	naver_id_login.setButton("green", 3, 50)		// 네이버 아이디 버튼 생성
	  	naver_id_login.setState(state)
	  	naver_id_login.init_naver_id_login()
	  	naver_id_login.get_naver_userprofile("naverSignInCallback()");
	 	
	  	// 일반 login event
	  	submitBtn.onclick = loginHandler
	  	// kakaoLogin event
	 	kakaologin.addEventListener('click',kakaoLogin)    // 클릭하면 kakaoLogin 함수가 실행돼서 로그인 시작
	</script>
</body>
</html>