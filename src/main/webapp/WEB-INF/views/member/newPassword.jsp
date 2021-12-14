<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경</title>
</head>
<body>
	<div align="center">
		<h3>비밀번호 변경</h3>
		<form action="newPasswordChk" method="post">
			새 비밀번호<br>
			<input type="password" name="newUserPw" placeholder="새 비밀번호"><br>
			새 비밀번호 확인<br>
			<input type="password" name="newUserPwChk" placeholder="새 비밀번호 확인"><br>
			<input type="submit" value="비밀번호 변경하기">
		</form>
	</div>
</body>
</html>