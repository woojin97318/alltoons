<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<header>
		<!-- 어드민 페이지 헤더 -->
		<c:import
			url="./header/platformHeader.jsp">
			<c:param name="tag" value="플랫폼 별 웹툰"></c:param>
		</c:import>
		<!-- value에 카테고리명을 넣어주세요 -->
	</header>
 <c:set var="i" value="0" />
 <c:set var="j" value="3" /><!-- 가로 n개씩 -->
 <table border=1>
    <c:forEach items="${platformView }" var="webtoonList">
     <c:if test="{i%j == 0}">
      <tr>
     </c:if>
     <td>
     	<a href="${contextPath}/webtooninfo?webtoonNum=${webtoonList.webtoonNum}">
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
		     <label>${webtoonList.webtoonWriter}</label>
		</a>
     </td>
    <c:if test="${i%j == j-1}">
     </tr>
    </c:if> 
   <c:set var="i" value="${i+1}" />
    </c:forEach>
 </table>

</body>
</html>