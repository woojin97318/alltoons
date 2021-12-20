<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport"content="width=device-width, initial-scale=1.0, user-scalable=yes,maximum-scale=1.0, minimum-scale=1.0" />
<style type="text/css">
.td1 {
	width: 20%;
}
.td2 {
	width: 30%;
}
</style>
</head>
<body>
	<div align="center">
		<h3>내가 작성한 리뷰</h3>
		<p>총 댓글 수<br>${myReviewCnt } 개</p>
		<table>
			<c:choose>
				<c:when test="${myReview.isEmpty() }">
					<tr><th colspan="3">작성한 리뷰가 없습니다</th></tr>
				</c:when>
				<c:otherwise>
					<c:forEach var="myReview" items="${myReview }">
						<tr>
							<td colspan="2">작성 내용 : ${myReview.reviewContent }</td>
							<td class="td1">
								<button type="button" onclick="location.href='${contextPath}/member/myReviewDelete?reviewNum=${myReview.reviewNum }'">
									리뷰 삭제
								</button>
							</td>
						</tr>
						<tr>
							<td colspan="3">작성시간 : ${myReview.reviewTime }</td>
						</tr>
						<tr>
							<td class="td2">
								<img src="${contextPath }/member/webtoonImageView?file=${myReview.webtoonImage}"
									width="70px" height="70px" onclick="location.href='${contextPath}/webtooninfo?webtoonNum=${myReview.webtoonNum }'"
									style="cursor:pointer">
							</td>
							<td colspan="2">
								<span onclick="location.href='${contextPath}/webtooninfo?webtoonNum=${myReview.webtoonNum }'" style="cursor:pointer">
									${myReview.webtoonTitle }
								</span>
							</td>
						</tr>
						<tr><td colspan="3"><hr></td></tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</table>
	</div>
</body>
</html>