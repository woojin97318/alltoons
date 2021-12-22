<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=yes,maximum-scale=1.0, minimum-scale=1.0" />
<title>admin page</title>
</head>
<header>
		<c:import url="./adminHeader.jsp">
			<c:param name="tag" value="관리자 페이지"></c:param>
		</c:import>
</header>
<body>
관리자 페이지 메인
</body>
</html>