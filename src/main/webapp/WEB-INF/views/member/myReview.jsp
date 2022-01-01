<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"content="width=device-width, initial-scale=1.0, user-scalable=yes,maximum-scale=1.0, minimum-scale=1.0" />
<title>내 쓴 리뷰</title>
<link rel="stylesheet" type="text/css"	href="${contextPath}/resources/css/mainStyle.css">
<link rel="stylesheet" type="text/css"	href="${contextPath}/resources/css/btnStyle.css">
<link rel="stylesheet" type="text/css"	href="${contextPath}/resources/css/fontStyle.css">
<link rel="stylesheet" type="text/css"	href="${contextPath}/resources/css/img_or_webtoon_Style.css">
<style type="text/css">
p {
	color: var(--grayD);
	font-weight: 600;
}
.td1 {
	width: 20%;
}

.td2 {
	width: 30%;
}

hr {
	width: 80%;
	max-width: 450px;
	color: #bbb;
}

.my-review-box {
	position: relative;
	text-align: left;
	max-width: 500px;
	border: 3px solid white;
}

.content-center {
	display: flex;
	align-items: center;
	width: 100%;
}

.webtoonImg-50 {
	margin-top: 10px;
}

.gowun-font {
	color: var(--blueD);
}

.mypage-container {
	margin-top: -50px;
}
</style>
</head>
<body class="body-color">
	<c:import url="../default/menu.jsp"/>
	<div align="center" class="mypage-container">
		<h3>내가 작성한 리뷰</h3>
		<p>총 댓글 수<br>${myReviewCnt } 개</p>
		<hr>
		<c:choose>
			<c:when test="${myReview.isEmpty() }">
				<h4>아직 작성한 리뷰가 없습니다.</h4>
			</c:when>
			<c:otherwise>
				<c:forEach var="myReview" items="${myReview }">
					<section class="my-review-box shadow">
						<button class="review-inner-btn nomal-gray-blue-btn" onclick="location.href='${contextPath}/member/myReviewDelete?reviewNum=${myReview.reviewNum }'">
							리뷰 삭제
						</button>
						<label class="small-font">
							<b>작성 내용 : </b>${myReview.reviewContent }
						</label>
						<br>
						<label class="small-font">
							<b>작성시간 : </b>${myReview.reviewTime }
						</label>
						<br>
						<!--웹툰 이미지-->
						<section title="웹툰 보러가기" class="content-center">
							<img class="webtoonImg-50" src="${contextPath }/member/webtoonImageView?file=${myReview.webtoonImage}"
							onclick="location.href='${contextPath}/webtoon/webtooninfo?webtoonNum=${myReview.webtoonNum }'"
							style="cursor: pointer">
							<!--웹툰 제목-->
							<span onclick="location.href='${contextPath}/webtoon/webtooninfo?webtoonNum=${myReview.webtoonNum }'"
								style="cursor: pointer">
								<label class="gowun-font" style="margin-left: 10px; cursor: pointer;">
									<b>${myReview.webtoonTitle }</b>
								</label>
							</span>
						</section>
					</section>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</div>
</body>
</html>