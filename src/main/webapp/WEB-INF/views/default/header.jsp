<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/mainStyle.css">

<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">

</script>

<title>header</title>

</head>
<body>
	<div class="main-title">
		AllToons
	</div>
	
	<div class="searchBar">
		<form action="${contextPath }/webtoonSearch" method="POST">
			<input type="text" name="search" size="20" placeholder="검색어 입력" required >
			<input type="submit" value="검색">
		</form>
	</div>
	<button id="menuBtn"></button>
	<div class="menuList">
	<h3>메뉴</h3>
		<nav>
			<ul>
				<li><a href="${contextPath}/">
				플랫폼별 웹툰</a></li>
				<li><a href="${contextPath}/">
				장르별 웹툰</a></li>
				<li><a href="${contextPath}/">
				즐겨찾기</a></li>
				<li><a href="${contextPath}/">
				관심목록</a></li>
				<li><a href="${contextPath}/admin">
				관리자 페이지</a></li>
				<li><a href="${contextPath}/member/myPage">
				마이 페이지</a></li>
				<!-- 
				<c:choose>
					<c:when test="">
						
					</c:when>
					<c:otherwise>
						
					</c:otherwise>
				</c:choose>
				 -->
				 <li><a href="${contextPath}/">
				로그인</a></li>
				
				 <li><a href="${contextPath}/member/login">
				로그아웃</a></li>
			</ul>
		</nav>
	</div>
</body>
</html>