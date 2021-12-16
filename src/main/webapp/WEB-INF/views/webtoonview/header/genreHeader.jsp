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
function back(){location.href="${contextPath}/main";};
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
				<li><a href="genreWebtoon?webtoonGenre=g1">
				<button	class="listBtn">에피소드</button></a></li>
				<li><a href="genreWebtoon?webtoonGenre=g2">
				<button	class="listBtn">옴니버스</button></a></li>
				<li><a href="genreWebtoon?webtoonGenre=g3">
				<button	class="listBtn">스토리</button></a></li>
				<li><a href="genreWebtoon?webtoonGenre=g4">
				<button	class="listBtn">일상</button></a></li>
				<li><a href="genreWebtoon?webtoonGenre=g5">
				<button	class="listBtn">개그</button></a></li>
				<li><a href="genreWebtoon?webtoonGenre=g6">
				<button	class="listBtn">판타지</button></a></li>
				<li><a href="genreWebtoon?webtoonGenre=g7">
				<button	class="listBtn">액션</button></a></li>
				<li><a href="genreWebtoon?webtoonGenre=g8">
				<button	class="listBtn">드라마</button></a></li>
				<li><a href="genreWebtoon?webtoonGenre=g9">
				<button	class="listBtn">순정</button></a></li>
				<li><a href="genreWebtoon?webtoonGenre=g10">
				<button	class="listBtn">감성</button></a></li>
				<li><a href="genreWebtoon?webtoonGenre=g11">
				<button	class="listBtn">스릴러</button></a></li>
				<li><a href="genreWebtoon?webtoonGenre=g12">
				<button	class="listBtn">시대극</button></a></li>
				<li><a href="genreWebtoon?webtoonGenre=g13">
				<button	class="listBtn">스포츠</button></a></li>
				
			</ul>
		</nav>
	</div>
	<a href="${contextPath}/main"><input type="button" class="mainBtn"></a>
</body>
</html>