<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div align="center">
		<h3>내가 작성한 리뷰</h3>
		<p>총 댓글 수<br>${myReviewCnt }</p>
		<hr>
		<c:forEach var="myReview" items="${myReview }">
			내용 : ${myReview.reviewContent }<br>
			작성시간 : ${myReview.reviewTime }<br>
			<a href="#">웹툰 : ${myReview.webtoonTitle }</a>
			<hr>
		</c:forEach>
	</div>
</body>
</html>