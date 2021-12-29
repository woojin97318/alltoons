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

	.flex-container {
		width: 100%;
		height: 100%;
		display: -webkit-box; 
    display: -moz-box;
    display: -ms-flexbox; 
    display: flex;
    -webkit-box-align: center; 
    -moz-box-align: center;
    -ms-flex-align: center;
    align-items: center; /* 수직 정렬 */
    -webkit-box-pack: center;
    -moz-box-pack: center; 
    -ms-flex-pack: center; 
    justify-content: center; /* 수평 정렬 */
	}

	.login-box {
		padding: auto;
		position: absolute; 
		left: 50%; 
		top: 50%; 
		transform: translate(-50%, -50%);
		width: 300px;
		height: 300px;
		background-color:rgba(255, 255, 255, 0.6);
		backdrop-filter: blur(8px);
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
		cursor: pointer;
	}

	.login-btn > label {
		font-size: 1.5em;
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
			<div class="flex-container">
				<div align="center" class="login-box">
					<h1>로그인</h1>
					<form action="userChk" method="post">
						<section>
							<input type="email" name="userEmail" placeholder="E-mail"><br>
							<input type="password" name="userPw" placeholder="Password"><br>
						</section>
						<input type="checkbox" id="autoLogin" name="autoLogin">
							&nbsp;<label class="small-font" for="autoLogin">자동 로그인</label>
						<br><br>
						<button type="submit" class="login-btn"><label>로그인</label></button>
					</form>
					<br>
					<a href="${contextPath}/member/findpassword">비밀번호 찾기</a> /
					<a href="${contextPath}/member/signup">회원가입</a>
				</div>
			</div>
		</c:otherwise>
	</c:choose>
	<footer>
		<jsp:include page="../default/footer.jsp"/>
	</footer>
</body>
</html>