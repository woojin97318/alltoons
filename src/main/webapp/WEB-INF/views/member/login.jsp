<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>올툰즈 로그인</title>
</head>
<body>
	<c:choose>
		<c:when test="${user != null }">
			<script>
				alert("이미 로그인이 되어있습니다");
				location.href = "${contextPath}/member/myPage";
			</script>
		</c:when>
		<c:otherwise>
			<div align="center">
				<h3>로그인</h3>
				<form action="userChk" method="post">
					<input type="text" name="userEmail" placeholder="E-mail"><br>
					<input type="password" name="userPw" placeholder="Password"><br>
					<input type="checkbox" name="autoLogin">&nbsp;자동 로그인
					<input type="submit" value="로그인">
				</form>
				<a href="${contextPath}/member/findpassword">비밀번호 찾기</a> /
				<a href="${contextPath}/member/signup">회원가입</a>
			</div>
		</c:otherwise>
	</c:choose>
</body>
</html>