<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>올툰즈 로그인</title>
<meta name="viewport"content="width=device-width, initial-scale=1.0, user-scalable=yes,maximum-scale=1.0, minimum-scale=1.0" />
<link rel="stylesheet" type="text/css"	href="${contextPath}/resources/css/mainStyle.css">
<link rel="stylesheet" type="text/css"	href="${contextPath}/resources/css/loginStyle.css">
<style type="text/css">
	.login-box {
		position: absolute;
		width: 300px;
		height: 300px;
		top: 50%;
		left: 50%;
		transform: translate(-50%, -50%);
	}

	.login-btn {
		margin: 20px 0 0 0;
	}
</style>
</head>
<body class="body-color">
	<c:import url="../default/menu.jsp"/>
	<c:choose>
		<c:when test="${user != null }">
			<script>
				alert("이미 로그인이 되어있습니다");
				location.href = "${contextPath}/member/myPage";
			</script>
		</c:when>
		<c:otherwise>
			<div class="flex-container">
				<div align="center" class="login-box">
					<h1>로그인</h1>
					<form action="userChk" method="post">
						<section>
							<input type="email" name="userEmail" placeholder="E-mail"><br>
							<input type="password" name="userPw" placeholder="Password"><br>
						</section>
						<input type="checkbox" id="autoLogin" name="autoLogin">
							<label class="small-font" for="autoLogin">자동 로그인</label>
						<br>
						<input type="submit" class="login-btn" value="로그인">
					</form>
					<br>
					<a href="${contextPath}/member/findpassword">비밀번호 찾기</a> /
					<a href="${contextPath}/member/signup">회원가입</a>
				</div>
			</div>
		</c:otherwise>
	</c:choose>
</body>
</html>