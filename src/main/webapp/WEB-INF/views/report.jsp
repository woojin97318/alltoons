<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=yes,maximum-scale=1.0, minimum-scale=1.0" />
<title>리뷰 신고하기</title>
<style type="text/css">
	form>section {
		margin-left: 50px;
		text-align: left;
	}

	.login-btn {
		margin-top: 30px;
		justify-content: center;
	}
</style>
</head>

<body>
	<header>
		<div class="head">
			<h1 align="center">마이페이지</h1>
		</div>
	</header>
	<c:import url="./default/menu.jsp"/>

	<div align="center" class="white-box shadow box-center">
		<h2>리뷰 신고하기</h2>
		<form action="${contextPath }/webtoon/reportinsert" method="post">
			<section>
				<input type="hidden" name="reportUserEmail" value="${user }">
				<input type="radio" name="reportContent" value="스포일러" checked>스포일러<br>
				<input type="radio" name="reportContent" value="광고/음란성/불법 정보">광고/음란성/불법정보<br>
				<input type="radio" name="reportContent" value="욕설/공격적/부적절한 언어">욕설/공격적/부적절한 언어<br>
				<input type="radio" name="reportContent" value="도배">도배<br>
				<input type="radio" name="reportContent" value="개인정보 노출">개인정보 노출<br>
				<input type="hidden" name="reviewNum" value="${reviewNum }">
				<input type="hidden" name="webtoonNum" value="${webtoonNum }">
			</section>
			<input class="login-btn" type="submit" value="신고하기">
		</form>
	</div>
</body>
</html>