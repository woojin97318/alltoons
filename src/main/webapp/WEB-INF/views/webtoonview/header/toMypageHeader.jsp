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
<script type="text/javascript">
function back(){location.href = "${contextPath}/member/myPage" };
</script>
<title>favorites and interest header</title>
</head>
<body>
	<div class="menu-title">
		<c:out value="${param.tag }"></c:out>
	</div>

	<button id="backBtn" onclick="back()" type="button"></button>
	<br>
	
	<a href="${contextPath}/main"><input type="button" class="mainBtn"></a>
</body>
</html>