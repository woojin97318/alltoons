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
<style type="text/css">
	body {
		background: linear-gradient(90deg, rgba(255,215,215,1) 0%, rgba(238,238,238,1) 33%, rgba(205,237,255,1) 66%, rgba(175,217,242,1) 100%);
	}

	.login-box {
		padding: auto;
		display: grid;
  	place-items: center;
		width: 300px;
		height: 300px;
		background-color:rgba(255, 255, 255, 0.6);
		backdrop-filter: blur(8px);
		border: 3px solid transparent;
		border-image: linear-gradient(to right, #fbfcb9be, #ffcdf3aa, #65d3ffaa) 1;
		border-radius: 30px;
	}

	.login-btn {
		width: 80%;
		height: 50px;
		border-radius: 30px;
		display: block;
		background-color: var(--blue);
		color: white;
		border: none;
	}

</style>
</head>
<body>
		<c:import url="../default/menu.jsp"/>
		<c:choose>
			<c:when test="${user != null }">
				<script>
					alert("이미 로그인이 되어있습니다");
					location.href = "${contextPath}/member/myPage";
				</script>
			</c:when>
			<c:otherwise>
				<div class="login-box">
					<div align="center">
						<h1>로그인</h1>
						<form action="userChk" method="post">
							<section>
								<input type="text" name="userEmail" placeholder="E-mail"><br>
								<input type="password" name="userPw" placeholder="Password">
							</section>
							<input type="checkbox" id="autoLogin" name="autoLogin">
								&nbsp;<label class="small-font" for="autoLogin">자동 로그인</label>
							<br><br>
							<input type="submit" class="login-btn" value="로 그 인">
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