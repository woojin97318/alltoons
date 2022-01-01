<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=yes,maximum-scale=1.0, minimum-scale=1.0" />
<title>관리자 신고 확인</title>
<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/adminStyle.css">
<style type="text/css">
.td {
	width: 100px;
}

img {
	width: 70px;
	height: 70px;
	cursor: pointer;
}

</style>
</head>

<body>
	<header>
		<c:import url="./adminHeader.jsp">
			<c:param name="tag" value="신고 확인"></c:param>
		</c:import>
	</header>

	<div class="body container">
		<table border="1">
			<c:choose>
				<c:when test="${reportList.isEmpty() }">
					<tr><th>신고 테이터가 없습니다</th></tr>
				</c:when>
				<c:otherwise>
					<c:forEach var="report" items="${reportList }">
						<tr>
							<td style="padding: 20px;">
								<b>신고자: </b> ${report.reportUserEmail }<br>
								
								<b>신고 내용: </b> ${report.reportContent }<br>
								
								<b>신고 시간: </b>${report.reportTime }<br>
								
								<b>리뷰 작성자: </b>${report.reviewUserEmail }<br>
								
								<b>리뷰 내용: </b><br>
								${report.reviewContent }<br>

								<b>리뷰 작성시간: </b>${report.reviewTime }<br>
							</td>
							
							<th>
								<img src="${contextPath }/member/webtoonImageView?file=${report.webtoonImage }"
									onclick="location.href='${contextPath}/webtoon/webtooninfo?webtoonNum=${report.webtoonNum}'">
								<br>

								<span onclick="location.href='${contextPath}/webtoon/webtooninfo?webtoonNum=${report.webtoonNum }'">
									${report.webtoonTitle }
								</span><br>

								<button onclick="location.href='${contextPath}/admin/reportDel?reportNum=${report.reportNum }'">
									신고내용 삭제
								</button><br>

								<button onclick="location.href='${contextPath}/admin/reportReviewDel?reviewNum=${report.reviewNum }'">
									해당리뷰 삭제
								</button><br>
							</th>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</table>
	</div>
</body>
</html>