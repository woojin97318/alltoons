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
function back(){window.history.back();};
</script>
<title>admin header</title>
</head>
<body>
	<div class="menu-title">
		<c:out value="${param.tag }"></c:out>
	</div>

	<button id="backBtn" onclick="back()" type="button"></button>
	<br>
	<div class="scrollBtn">
		<nav>
			<ul>
				<li><a href="platformWebtoon?platformName=naver">
				<button	class="listBtn">네이버</button></a></li>
				<li><a href="platformWebtoon?platformName=kakaoWebtoon">
				<button	class="listBtn">카카오웹툰</button></a></li>
				<li><a href="platformWebtoon?platformName=kakaoPage">
				<button	class="listBtn">카카오페이지</button></a></li>
				<li><a href="platformWebtoon?platformName=bomtoon">
				<button	class="listBtn">봄툰</button></a></li>
				<li><a href="platformWebtoon?platformName=lezhin">
				<button	class="listBtn">레진코믹스</button></a></li>
				<li><a href="platformWebtoon?platformName=toptoon">
				<button	class="listBtn">탑툰</button></a></li>
				<li><a href="platformWebtoon?platformName=mrblue">
				<button	class="listBtn">미스터블루</button></a></li>
				<li><a href="platformWebtoon?platformName=ridibooks">
				<button	class="listBtn">리디북스</button></a></li>
			</ul>
		</nav>
	</div>
	<a href="${contextPath}/main"><input type="button" class="mainBtn"></a>
</body>
</html>