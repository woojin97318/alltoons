<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 신고 확인</title>
<style type="text/css">
.td {
	width: 100px;
}
</style>
</head>
<body>
	<div align="center">
		<header>
			<c:import url="./adminHeader.jsp">
				<c:param name="tag" value="신고 확인"></c:param>
			</c:import>
		</header>
		<table>
			<tr>
				<td colspan="3">
					<hr>
				</td>
			</tr>
			<c:forEach var="reportList" items="${reportList }">
				<tr>
					<th>신고자</th>
					<td>${reportList.reportUserEmail }</td>
					<td class="td">
						<button type="button"
							onclick="location.href='${contextPath}/admin/reportDel?reportNum=${reportList.reportNum }'">
							신고내용 삭제
						</button>
					</td>
				</tr>
				<tr>
					<th>신고 내용</th>
					<td>${reportList.reportContent }</td>
					<td class="td">
						<button type="button"
							onclick="location.href='${contextPath}/admin/reportReviewDel?reviewNum=${reportList.reviewNum }'">
							해당리뷰 삭제
						</button>
					</td>
				</tr>
				<tr>
					<th>신고 시간</th>
					<td colspan="2">${reportList.reportTime }</td>
				</tr>
				<tr>
					<th>리뷰 작성자</th>
					<td colspan="2">${reportList.reviewUserEmail }</td>
				</tr>
				<tr>
					<th>리뷰 내용</th>
					<td colspan="2">${reportList.reviewContent }</td>
				</tr>
				<tr>
					<th>리뷰 작성시간</th>
					<td colspan="2">${reportList.reviewTime }</td>
				</tr>
				<tr>
					<td>
						<img src="${contextPath }/member/webtoonImageView?file=${reportList.webtoonImage }"
							width="70px" height="70px" onclick="location.href='${contextPath}/webtooninfo?webtoonNum=${reportList.webtoonNum}'"
							style="cursor:pointer">
					</td>
					<td colspan="2">
						<span onclick="location.href='${contextPath}/webtooninfo?webtoonNum=${reportList.webtoonNum }'"
							style="cursor:pointer">
							${reportList.webtoonTitle }
						</span>
					</td>
				</tr>
				<tr>
					<td colspan="3">
						<hr>
					</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>