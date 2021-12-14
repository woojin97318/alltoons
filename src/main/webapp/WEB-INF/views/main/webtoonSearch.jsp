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
<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/mainStyle.css">

<style type="text/css">
</style>

<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	var page = 1;

</script>
<title>작품 검색</title>
</head>

<header>
		<c:import url="../default/header.jsp"/>
</header>
	
<body>
	<c:if test="${search != null }">
		<label><b>" ${search } "</b>에 대한 검색 결과 입니다.</label><br>
	</c:if>
	
	<hr>
	
	<div>
	<h2>제목명</h2>
		<table border="1">
			<tr class="table-top">
				<th>썸네일</th>
				<th>번호</th>
				<th>제목</th>
				<th>작가명</th>
			</tr>
			<c:choose>
				<c:when test="${titleList == null }">
					<tr>
						<td colspan="4">데이터가 없습니다.</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach var="dto" items="${titleList }">
					<tr>
						<c:choose>
							<c:when test="${dto.webtoonImage eq 'default_image' || dto.webtoonImage eq 'default_image.png'||dto.webtoonImage eq 'default_image.jpg'}">
								<td><div class="webtoonImage"><img src="${contextPath }/resources/default_image.png"></div></td>
							</c:when>
							<c:otherwise>
								<td><div class="webtoonImage"><img src="${contextPath }/resources/img/webtoon_image/${dto.webtoonImage }"></div></td>
							</c:otherwise>
						</c:choose>
						<td>${dto.webtoonTitle }</td>
						<td>${dto.webtoonWriter }</td>
						<th>${dto.platformName }</th>
					</tr>
				</c:forEach>
				</c:otherwise>
			</c:choose>
		</table>
		
		
		
		<h2>작가명</h2>
		<table border="1">
			<tr class="table-top">
				<th>썸네일</th>
				<th>번호</th>
				<th>제목</th>
				<th>작가명</th>
			</tr>
			<c:choose>
				<c:when test="${writerList == null }">
					<tr>
						<td colspan="4">데이터가 없습니다.</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach var="dto" items="${writerList }">
					<tr>
						<c:choose>
							<c:when test="${dto.webtoonImage eq 'default_image' || dto.webtoonImage eq 'default_image.png'||dto.webtoonImage eq 'default_image.jpg'}">
								<td><div class="webtoonImage"><img src="${contextPath }/resources/default_image.png"></div></td>
							</c:when>
							<c:otherwise>
								<td><div class="webtoonImage"><img src="${contextPath }/resources/img/webtoon_image/${dto.webtoonImage }"></div></td>
							</c:otherwise>
						</c:choose>
						<td>${dto.webtoonTitle }</td>
						<td>${dto.webtoonWriter }</td>
						<th>${dto.platformName }</th>
					</tr>
				</c:forEach>
				</c:otherwise>
			</c:choose>
		</table>
	</div>
</body>
</html>