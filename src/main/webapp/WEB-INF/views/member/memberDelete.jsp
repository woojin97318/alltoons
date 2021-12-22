<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴하기</title>
<meta name="viewport"content="width=device-width, initial-scale=1.0, user-scalable=yes,maximum-scale=1.0, minimum-scale=1.0" />
</head>
<body>
	<div align="center">
		<h3>탈퇴하기</h3>
		비밀번호를 입력해주세요
		<form action="memberDeleteChk" method="post">
			<input type="password" name="userPw" placeholder="비밀번호">
			<input type="submit" value="탈퇴하기">
		</form>
	</div>
</body>
</html>