<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=yes,maximum-scale=1.0, minimum-scale=1.0" />
<title>비밀번호 변경</title>
<link rel="stylesheet" type="text/css"	href="${contextPath}/resources/css/mainStyle.css">

<style type="text/css">
	.white-box>section {
		margin-top: 50px;
	}

	.login-btn {
		margin: 30px 0 0 0;
	}
</style>
</head>

<body style="padding-top: 100px;">
	<header>
		<div class="head">
			<h1 align="center">마이페이지</h1>
		</div>
	</header>
	<c:import url="../default/menu.jsp"/>

	<div class="flex-container">
		<div align="center" class="white-box shadow box-center">
			<section>
				<h2>비밀번호 확인</h2>
				<b>현재 비밀번호</b>를 입력해주세요<br>
				👇<br>
				<form action="pwModifyChk" method="post">
					<input type="password" name="userPw" placeholder="비밀번호">
					<br>
					<input class="login-btn" type="submit" value="비밀번호 확인">
				</form>
			</section>
		</div>
	</div>
</body>
</html>