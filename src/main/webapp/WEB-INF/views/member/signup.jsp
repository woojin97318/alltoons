<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 페이지</title>

</head>
<body>
	<c:import url="${contextPath }/defualt/header" />
	<div align="center">
		<form id="signupform" action="signUp" method="post"></form>

	</div>
	<c:import url="${contextPath }/defualt/header" />

</body>
</html>