<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"content="width=device-width, initial-scale=1.0, user-scalable=yes,maximum-scale=1.0, minimum-scale=1.0" />
<title>마이페이지</title>
<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/mainStyle.css">
<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/fontStyle.css">
<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/btnStyle.css">
<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/img_or_webtoon_Style.css">
<style type="text/css">
a {
	color: var(--grayD);
	font-weight: 600;
}

.container {
	padding: 0 50px;
}

.block {
	height: 50px;
	cursor: pointer;
	padding: 5px;
	margin: 20px 0;
	vertical-align: middle;
}

.block:hover {
	background-color: var(--grayL);
}

#heart, #star {
	font-size: 1.6em;
	position: relative;
	top: 7px;
}

.mypage-profil {
	cursor: pointer;
}
</style>
</head>

<body>
	<!--헤더&메뉴-->
	<header>
		<div class="head">
			<h1 align="center" style="position:relative; top:5px;">마이페이지</h1>
		</div>
	</header>
	<c:import url="../default/menu.jsp"/>

	<div class="container">
		<section align="center">
			<!--프로필 사진-->
			<img title="프로필 사진 변경하기" class="mypage-profil" src="${contextPath }/member/userImageView?file=${userInfo.userImage}"
				onclick="location.href='${contextPath}/member/userImageModify'"><br>
			<label class="gowun-font">이메일 : ${userInfo.userEmail }</label><br>
			<button class="gray-btn" onclick="location.href='${contextPath}/member/pwModify'">
				<b>비밀번호 변경</b>
			</button>
		</section>
		<hr>
		<section class="block">
			<a href="${contextPath }/member/interest">
				관심 가는 웹툰<br>
				<span class="menuicon"><ion-icon name="heart" id="heart"></ion-icon></span>
				${interest }개
			</a>
		</section>
		<section class="block">
			<a href="${contextPath }/member/favorites">
				즐겨 찾는 웹툰<br>
				<span class="menuicon"><ion-icon name="star" id="star"></ion-icon></span>
				${favorites }개
			</a>
		</section>
		<section class="block">
			<a href="${contextPath }/member/myReview">내가 작성한 리뷰</a>
		</section>
		<section class="block">
			<a href="${contextPath }/member/memberDelete">회원 탈퇴하기</a>
		</section>
	</div>

<script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
</body>
</html>