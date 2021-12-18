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
<!-- 
<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/mainStyle.css">
 -->
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

<c:set var="defaultImg" value='${contextPath }/resources/img/webtoon/default_image.png'/>
<c:set var="thumbnail" value='${contextPath }/thumbnail?webtoonImage='/>
<c:set var="webtooninfo" value='${contextPath }/webtoon/webtooninfo?webtoonNum='/>

<body onload="" style="padding-top: 200px;">
	<c:if test="${search != null }">
		<label><b>" ${search } "</b>에 대한 검색 결과 입니다.</label><br>
	</c:if>
	
	<hr>
	
	<div>
	<h2>제목명</h2>
		<table border="1">
			<tr class="table-top">
				<th>썸네일</th>
				<th>플랫폼</th>
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
							<c:when test="${dto.webtoonImage eq 'default_image.png'}">
								<th><div class="webtoonImage"><img src="${defaultImg}"></div></th>
							</c:when>
							<c:otherwise>
								<td><div class="webtoonImage"><img src="${thumbnail}${dto.webtoonImage }"></div></td>
							</c:otherwise>
						</c:choose>
						<td class="platform">${ dto.platformName}</td>
						<th><a href="#" onclick="location.href='${webtooninfo}${dto.webtoonNum}'">${dto.webtoonTitle }</a></th>
						<td>${dto.webtoonWriter }</td>
					</tr>
				</c:forEach>
				</c:otherwise>
			</c:choose>
		</table>
		
		
		
		<h2>작가명</h2>
		<table border="1">
			<tr class="table-top">
				<th>썸네일</th>
				<th>플랫폼</th>
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
							<c:when test="${dto.webtoonImage eq 'default_image.png'}">
								<th><div class="webtoonImage"><img src="${defaultImg}"></div></th>
							</c:when>
							<c:otherwise>
								<td><div class="webtoonImage"><img src="${thumbnail}${dto.webtoonImage }"></div></td>
							</c:otherwise>
						</c:choose>
						<td class="platform">${ dto.platformName}</td>
						<th><a href="#" onclick="location.href='${webtooninfo}${dto.webtoonNum}'">${dto.webtoonTitle }</a></th>
						<td>${dto.webtoonWriter }</td>
					</tr>
				</c:forEach>
				</c:otherwise>
			</c:choose>
		</table>
	</div>
</body>
</html>