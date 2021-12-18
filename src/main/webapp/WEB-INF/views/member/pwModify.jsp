<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=yes,maximum-scale=1.0, minimum-scale=1.0" />
</head>
<body>
	<div align="center">
		<h3>비밀번호 변경</h3>
		현재 비밀번호를 입력해주세요<br>
		<form action="pwModifyChk" method="post">
			<input type="password" name="userPw" placeholder="비밀번호"><br>
			<input type="submit" value="비밀번호 확인">
		</form>
	</div>
</body>
</html>