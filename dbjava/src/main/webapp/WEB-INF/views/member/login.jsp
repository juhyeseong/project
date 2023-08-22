<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<script src='https://code.jquery.com/jquery-3.1.1.min.js'></script>
 <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
 <script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
 
 
<div class="login">
      <fieldset>
          <legend>Welcome JavaBang</legend>

			<form method="POST">
          		<p><input type="text" name="userId" placeholder="아이디"></p>
          		<p><input type="password" name="userPw" placeholder="비밀번호"></p>
          		<p><input type="submit" value="로그인"></p>
 			</form>    
 			
          	<div id="kakaologin">
          		
				 <form method="post" action="${cpath }/api/kakaosignup"> 
		          	<input type="hidden" name="userId" id="kakaoid" />
		          	<input type="hidden" name="userNick" id="kakaoname" /> 
		          	<input type="hidden" name="gender" id="kakaogender" /> 
		          	<input type="hidden" name="email" id="kakaoemail" />         
		            <button class="kakao"> <img src="http://192.168.64.200/kakaoLogo.jpeg" > 카카오 아이디로 로그인하기</button> 
		          
	         	 </form>
	         	
         	 </div>
         	 <p> <a href="http://developers.kakao.com/logout">카카오로그아웃</a> </p>  
      		 <div id="naverlogin">
	          <form method="POST" action="${cpath }/api/naversignup">
		             <input type="hidden" name="userId" id="naveremail" />
		          	 <input type="hidden" name="userNick" id="navername" />  
	         		 <button class="naver"> <img src="http://192.168.64.200/naverLogo.jpeg" >네이버 아이디로 로그인하기</button>
	          </form>
              </div> 
          <%--  <a href="${cpath }/member/naverlogin"><button class="naver"> <img src="http://192.168.64.200/naverLogo.jpeg" >네이버 아이디로 로그인하기</button></a> --%>
          <button class="email"> <img src="http://192.168.64.200/mailLogo.jpeg" >구글 이메일로 로그인하기</button> 
 		  <p>
 
		  	<a href="${cpath }/member/join">회원가입 </a> |
	      	<a href="${cpath }/member/resetPassword">비밀번호재설정 </a>
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
 						
 						console.log(kakao_account);
 						console.log(userId);
 						console.log(userNick);
 						console.log(email);
 						console.log(gender);
 						
 
 					document.getElementById('kakaoid').value = userId
 					document.getElementById('kakaoname').value = userNick
 					document.getElementById('kakaogender').value = gender
 					document.getElementById('kakaoemail').value = email
 				 	 
 					event.target.parentNode.submit()

 					}
 				});

 			}
 		});
	 		console.log(1)
//		 	alert(event.target)
//	 		location.href = event.target.parentNode.action
//			event.target.parentNode.submit()
			 	  
 	}
  //window.addEventListener('load', kakaoLogin)
 	kakaologin.addEventListener('click',kakaoLogin)
 </script>
 

 <!-- 	네이버로그인 script -->

 <script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
 <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
 <script>
 var naver = new naver("QBQcG_g3ay39MPum66CS", "http://localhost:8080/dbjava/member/navercallback");
 // 접근 토큰 값 출력
 alert(naver_id_login.oauthParams.access_token);
 // 네이버 사용자 프로필 조회
 naver_id_login.get_naver_userprofile("naverSignInCallback()");
 // 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
 function naverSignInCallback() {
   const email = (naver_id_login.getProfileData('email'));
   const nickname = (naver_id_login.getProfileData('nickname'));
   const userName = (naver_id_login.getProfileData('name'));
   const gender = (naver_id_login.getProfileData('gender'));
   
   console.log(email)
   console.log(nickname)
   console.log(userName)
   console.log(gender)

 }
</script>

 
 
 
 
</body>
</html>