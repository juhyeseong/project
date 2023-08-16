<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<form class="join" method="POST">
<fieldset>
    <legend>회원가입</legend>
    <p><input type="text" name="userId" placeholder="아이디 입력" required></p>
    <p><input type="password" name="userPw" placeholder="비밀번호 입력" required></p>
    <p><input type="text" name="userNick"  placeholder="닉네임 입력" required></p>
    <p><input type="text" name="userName" placeholder="이름 입력" required></p>
    <p><input type="text" name="birth" placeholder="생년월일 8자리 입력" required></p>
    <p><select name="gender" required>
        <option>====================선택====================</option>
        <option value="man">남성</option>
        <option value="woman">여성</option>
    </select></p>
    <p><input type="email" name="email" placeholder="이메일 입력" required></p>
    <p><input type="text" name="phoneNum" placeholder="전화번호 입력" required></p>
    <p><input type="submit" value="회원가입"></p>
</fieldset>
</form>
</body>
</html>