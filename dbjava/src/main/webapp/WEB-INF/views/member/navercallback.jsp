<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../header.jsp" %>
 <script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
  <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
  
  
  <div class="naverlogin">
  	<form id = "naverLoginForm"method="POST" action="${cpath }/api/naversignup">
  					<input type="hidden" name="userId" id="naveremail" />
		          	 <input type="hidden" name="userName" id="navername" />  
		          	  <input type="hidden" name="userNick" id="navernick"/>
  	</form>
  </div>
  
  <script>
 var naver_id_login = new naver_id_login("QBQcG_g3ay39MPum66CS", "http://localhost:8080/dbjava/member/navercallback");
 //var naver = new naver("QBQcG_g3ay39MPum66CS", "http://localhost:8080/dbjava/member/navercallback");
	const token = naver_id_login.oauthParams.access_token
  // 네이버 사용자 프로필 조회
  naver_id_login.get_naver_userprofile("naverSignInCallback()");
  // 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
  function naverSignInCallback() {

    const email = naver_id_login.getProfileData('email')
    const nickname = naver_id_login.getProfileData('nickname')
    const name = naver_id_login.getProfileData('name')
    const gender = naver_id_login.getProfileData('gender')
    
	document.getElementById('naveremail').value = email
	document.getElementById('navernick').value=nickname
	document.getElementById('navername').value=name
				 	 
	const naverLoginForm = document.getElementById('naverLoginForm')
	naverLoginForm.submit()
  }
</script>
</body>
</html>