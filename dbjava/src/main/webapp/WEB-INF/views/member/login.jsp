<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<div class="login">
      <fieldset>
          <legend>Welcome JavaBang</legend>

          <p><input type="text" placeholder="아이디"></p>
          <p><input type="text" placeholder="비밀번호"></p>
          <p><input type="submit" value="로그인"></p>
          
          <button class="kakao"> <img src="">카카오 아이디로 로그인하기</button>
          <button class="naver"> 네이버 아이디로 로그인하기</button>
          <button class="email"> 이메일로 로그인하기</button>
          <p><a href="${cpath }/member/join">회원가입 </a> | 비밀번호재설정</p> 
          
      </fieldset>
  </div>    
</body>
</html>