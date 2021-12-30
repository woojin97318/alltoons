<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=yes,maximum-scale=1.0, minimum-scale=1.0" />
<link rel="stylesheet" type="text/css"	href="${contextPath}/resources/css/mainStyle.css">
<title>즐겨찾기</title>
</head>

<body>
	<header>
		<div class="head">
			<h1 class="txt-align-center">즐겨찾기</h1>
		</div>
	</header>
	<c:import url="../default/menu.jsp"/>
<div class="container">
	<c:choose>
		<c:when test="${favortiesPage.isEmpty()}">
			<table>
				<tr>
					<th>
						<label class="small-font">즐겨찾는 작품이 없습니다.</label>
					</th>
				</tr>
			</table>
		</c:when>
		<c:otherwise>
			<c:forEach items="${favortiesPage }" var="webtoonList">
				<section class="webtoon-result-box" onclick="location.href='${contextPath}/webtoon/webtooninfo?webtoonNum=${webtoonList.webtoonNum}'">
					<c:choose>
						<c:when test="${webtoonList.webtoonImage=='default_image'||webtoonList.webtoonImage=='default_image.png'}">
							<section class="webtoonImg">
								<img id="webtoonImage"
									src="${contextPath }/resources/img/webtoon/default_image.png"
									alt="선택된 이미지가 없습니다"/>
							</section>
						</c:when>
						<c:otherwise>
							<section class="webtoonImg">
								<img id="webtoonImage"
									src="${contextPath }/thumbnail?webtoonImage=${webtoonList.webtoonImage}"
									alt="썸네일이 존재"/>
							</section>
						</c:otherwise>
					</c:choose>
					<section class="webtoon-result-title">
						<label class="title-result pointer">${webtoonList.webtoonTitle}</label><br>
						<label class="small-font pointer">${webtoonList.webtoonWriter}</label><br>
						<label class="xsmall-font pointer">
							${webtoonList.platformName} 
							<c:if test="${webtoonList.platformNum !=0}"> 외 ${webtoonList.platformNum}</c:if>
						</label>
					</section>
				</section>
			</c:forEach>
		</c:otherwise>
	</c:choose>
</div>
</body>
</html>