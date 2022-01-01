<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=yes,maximum-scale=1.0, minimum-scale=1.0" />
<title>비밀번호 변경</title>
<link rel="stylesheet" type="text/css"	href="${contextPath}/resources/css/mainStyle.css">
<link rel="stylesheet" type="text/css"	href="${contextPath}/resources/css/loginStyle.css">
<style type="text/css">
	.login-box {
		width: 300px;
		height: 300px;
		top: 50%;
		left: 50%;
		transform: translate(-50%, -50%);
	}
</style>
</head>
<body class="body-color">
	<c:import url="../default/menu.jsp"/>
	<div class="flex-container">
		<div align="center" class="login-box">
			<h3>비밀번호 변경</h3>
			현재 비밀번호를 입력해주세요<br>
			<form action="pwModifyChk" method="post">
				<input type="password" name="userPw" placeholder="비밀번호">
				<br>
				<input type="submit" value="비밀번호 확인">
			</form>
		</div>
	</div>
</body>
</html>