<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<form class="join" method="POST">
	<fieldset>
	    <legend>회원가입</legend>
	    
	    <p><input type="text" name="userId" placeholder="아이디 입력" required></p>
	    <p><input type="password" name="userPw" placeholder="비밀번호 입력" required></p>
	    <p><input type="text" name="userNick"  placeholder="닉네임 입력" required></p>
	    <p><input type="email" name="email" placeholder="이메일 입력" required></p>
	    <p><input type="text" name="userName" placeholder="이름 입력" required></p>
	    <p>
	    	<input type="text" name="year" placeholder="생년 입력" required>
	    	<select name="month" required>
	    		<option value="">생월 선택</option>
	    		<c:forEach var="i" begin="1" end="12" step="1">
	    			<option value="${i }">${i }월</option>
	    		</c:forEach>
	    	</select>
	    	<select name="day" required>
	    		<option value="">생일 선택</option>
	    		<c:forEach var="i" begin="1" end="31" step="1">
	    			<option value="${i }">${i }일</option>
	    		</c:forEach>
	    	</select>
	    </p>
	    <p><input type="text" name="phoneNum" placeholder="전화번호 입력" required></p>
	    <p><select name="gender" required>
	        <option value="man">남성</option>
	        <option value="woman">여성</option>
	    </select></p>
	    <p><input type="submit" value="회원가입"></p>
	</fieldset>
</form>
</body>
</html>