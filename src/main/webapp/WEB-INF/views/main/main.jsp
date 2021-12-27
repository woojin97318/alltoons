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
	
	<div style="padding-top: 150px;">
	<h3>인기 웹툰</h3>
 <c:set var="i" value="0" />
 <c:set var="j" value="3" /><!-- 가로 n개씩 -->
 <table border=1>
    <c:forEach items="${popularPage }" var="webtoonList">
     <c:if test="{i%j == 0}">
      <tr>
     </c:if>
     <td>
     	<a href="${contextPath}/webtoon/webtooninfo?webtoonNum=${webtoonList.webtoonNum}">
	     <c:choose>
				<c:when
					test="${webtoonList.webtoonImage=='default_image'||webtoonList.webtoonImage=='default_image.png'}">
					<img id="webtoonImage" src="resources/img/webtoon/default_image.png"
						width=200 height=200 alt="선택된 이미지가 없습니다" />
				</c:when>
				<c:otherwise>
					<img id="webtoonImage"
						src="${contextPath }/thumbnail?webtoonImage=${webtoonList.webtoonImage}"
						width=200 height=200 alt="썸네일이 존재" />
				</c:otherwise>
			</c:choose>
			<br>
		     <label>${webtoonList.webtoonTitle}</label><br>
		     <label>${webtoonList.webtoonWriter}</label><br>
		     <label>${webtoonList.platformName}</label> 
		     <c:if test="${webtoonList.platformNum !=0}">
		     	<label> 외 ${webtoonList.platformNum}곳</label>
		     </c:if>
		</a>
     </td>
    <c:if test="${i%j == j-1}">
     </tr>
    </c:if> 
   <c:set var="i" value="${i+1}" />
    </c:forEach>
 </table>
</div>
</body>
</html>