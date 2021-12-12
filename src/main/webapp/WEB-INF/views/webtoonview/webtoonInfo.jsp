<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=yes,maximum-scale=1.0, minimum-scale=1.0" />
<title>작품 상세페이지</title>
</head>
<body>	<h1>작품 상세 페이지</h1>
	<div style="display: flex;">
		<c:choose>
			<c:when test="${webtoonList.webtoonImage=='default_image'}">
				<img id="webtoonImage" src="resources/resources/default_image.jpg"
					width=100 height=100 alt="선택된 이미지가 없습니다" />
			</c:when>
			<c:otherwise>
				<img id="webtoonImage"
					src="${contextPath }/thumbnail?webtoonImage=${webtoonDate.webtoonImage}"
					width=100 height=100 alt="썸네일이 존재" />
			</c:otherwise>
		</c:choose>
		<div>
			${webtoonDate.webtoonTitle}<br>
			<button type="button" name="interest">♡</button><label>0</label><br>
			<button type="button" name="favorites">☆</button><br>
			<b>작가명</b><br>
			${webtoonDate.webtoonWriter }
		</div>
	</div>
	<b>보러가기</b>
	<c:forEach var="list" items="${platformList}">
		<button type="button" onclick="location.href='${list.webtoonLink}'" >${list.platformName }</button>
	</c:forEach>
	<br>
	<c:if test="${originList[0].webtoonOriginalLink !='nan' }">
		<b>이 작품은 소설이 존재해요!</b><br>
		<c:forEach var="origin" items="${originList }">
			<button type="button" onclick="location.href='${origin.webtoonOriginalLink}'" >${origin.originalPlatform}</button>
		</c:forEach>
	</c:if>
	<br>
	<b>작품 소개글</b><br>
	<label>${webtoonDate.webtoonContent }</label>
</body>
</html>