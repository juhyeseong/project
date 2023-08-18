<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<form method="POST">
<div class="login">
      <fieldset>
          <legend>Welcome JavaBang</legend>

          <p><input type="text" name="userId" placeholder="아이디"></p>
          <p><input type="password" name="userPw" placeholder="비밀번호"></p>
          <p><input type="submit" value="로그인"></p>
          
          <a href="javascript:kakaoLogin();"><button class="kakao"> <img src="http://192.168.64.200/kakaoLogo.jpeg" > 카카오 아이디로 로그인하기</button></a>
          <button class="naver"> <img src="http://192.168.64.200/naverLogo.jpeg" >네이버 아이디로 로그인하기</button>
          <button class="email"> <img src="http://192.168.64.200/mailLogo.jpeg" >구글 이메일로 로그인하기</button>
 		  <p>
		  	<a href="${cpath }/member/join">회원가입 </a> |
	      	<a href="${cpath }/member/resetPassword">비밀번호재설정 </a>
	      </p> 
    
      </fieldset>
  </div>
 </form>    
 
 
 <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
 

 
 <script>
 	//9f70d9bb54ab5d75fd02bf5b519c5a11
 	window.Kakao.init("9f70d9bb54ab5d75fd02bf5b519c5a11")
 	
 	function kakaoLogin(){
 		window.Kakao.Auth.login({
 			scope:'profile_nickname, 	gender',
 			success: function(authObj){
 				window.Kakao.API.request({
 					url:'/v2/user/me',
 					success: res => {
 						const kakao_account = res.kakao_account;
 					}
 				});
 			}
 		});
 	}
 
 </script>
 
 
 
 
</body>
</html>