<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>올툰즈 로그인</title>
</head>
<body>
	<div align="center">
		<h3>로그인</h3>
		<form action="loginChk" method="post">
			<input type="text" name="id" placeholder="ID"><br>
			<input type="text" name="pw" placeholder="PW"><br>
			<input type="checkbox" name="auto">&nbsp;자동 로그인
			<input type="submit" value="로그인">
		</form>
		<a href="#">아이디 찾기</a> / 
		<a href="#">비밀번호 찾기</a> / 
		<a href="#">회원가입</a>
	</div>
</body>
</html>