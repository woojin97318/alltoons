<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"content="width=device-width, initial-scale=1.0, user-scalable=yes,maximum-scale=1.0, minimum-scale=1.0" />
<title>회원 탈퇴하기</title>
<style type="text/css">
	.login-btn, h2 {
		margin-top: 30px;
	}
	h2 {
		margin-top: 50px;
	}
</style>
</head>
<body>
	<header>
		<div class="head">
			<h1 align="center">마이페이지</h1>
		</div>
	</header>
	<c:import url="../default/menu.jsp"/>

	<div align="center" class="white-box shadow box-center">
		<h2>탈퇴하기</h2>
		비밀번호를 입력해주세요.
		<form action="memberDeleteChk" method="post">
			<input type="password" name="userPw" placeholder="비밀번호">
			<br>
			<input class="login-btn" type="submit" value="탈퇴하기">
		</form>
	</div>
</body>
</html>