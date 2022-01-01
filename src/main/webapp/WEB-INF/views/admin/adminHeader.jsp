<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/adminStyle.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<title>admin header</title>
</head>

<body>
	<div align="center">
		<c:import url="../default/menu.jsp"/>
		<div class="menu-title" style="position: relative; top: 10px;">
			<c:out value="${param.tag }"></c:out>
		</div>
		<div class="scrollBtn" style="position: relative; top: 50px;">
			<nav>
				<ul>
					<li><a href="${contextPath}/admin/report"><button class="listBtn">
					신고 확인</button></a></li>
					<li><a href="${contextPath}/admin/webtoonUpload"><button class="listBtn">
					작품 업로드</button></a></li>
					<li><a href="${contextPath}/admin/webtoonDelete"><button class="listBtn">
					작품 수정 및 삭제</button></a></li>
				</ul>
			</nav>
		</div>
	</div>
</body>
</html>