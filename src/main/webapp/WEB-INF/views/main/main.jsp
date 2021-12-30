<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AllToons</title>
<meta name="viewport"content="width=device-width, initial-scale=1.0, user-scalable=yes,	maximum-scale=1.0, minimum-scale=1.0" />
<link rel="stylesheet" type="text/css"	href="${contextPath}/resources/css/mainStyle.css">
</head>
<body>
	<header>
		<c:import url="../default/header.jsp"/>
		<c:import url="../default/menu.jsp"/>
		<c:import url="../default/moveTopBtn.jsp"/>
	</header>
	
	<div style="padding-top: 70px;" class="container">
		<h2>인기 웹툰</h2>
		<div class="webtoon-result">
			<c:forEach items="${popularPage }" var="webtoonList">
				<section class="webtoon-result-box" onclick="location.href='${contextPath}/webtoon/webtooninfo?webtoonNum=${webtoonList.webtoonNum}'">
					<c:choose>
						<c:when test="${webtoonList.webtoonImage=='default_image'||webtoonList.webtoonImage=='default_image.png'}">
							<section class="webtoonImg">
								<img id="webtoonImage" src="resources/img/webtoon/default_image.png" alt="선택된 이미지가 없습니다" />
							</section>
						</c:when>
						<c:otherwise>
							<section class="webtoonImg">
								<img id="webtoonImage" src="${contextPath }/thumbnail?webtoonImage=${webtoonList.webtoonImage}" alt="썸네일이 존재" />
							</section>
							</c:otherwise>
					</c:choose>
					<section class="webtoon-result-title">
						<label class="title-result pointer">${webtoonList.webtoonTitle}</label><br>
						<label class="small-font pointer">${webtoonList.webtoonWriter}</label><br>
						<label class="xsmall-font pointer">
							${webtoonList.platformName} 
							<c:if test="${webtoonList.platformNum !=0}"> 외 ${webtoonList.platformNum}곳</c:if>
						</label>
					</section>
				</section>
			</c:forEach>
		</div>
	</div>
	<footer>
		<c:import url="../default/footer.jsp"/>
	</footer>
</body>
</html>