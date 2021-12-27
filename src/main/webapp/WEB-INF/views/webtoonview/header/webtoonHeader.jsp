<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css"
	href="${contextPath}/resources/css/adminStyle.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<title>webtoon header</title>
</head>
<body>
	<div class="menu-title">
		<c:out value="${param.tag }"></c:out>
	</div>
</body>
</html>