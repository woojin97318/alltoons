<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<style>
* {
	margin: 0; padding: 0;
}
.hideMenuBody {
	width: 60vw; height: 100vh;
	background: white;
	position: absolute;
	z-index: 888;
	transition: transform 600ms;
	transform: translate(-60vw, 0px);
	-ms-transition: -ms-transform 600ms;
	-webkit-transition: -webkit-transform 600ms;
	-moz-transition: -moz-transform 600ms;
	-o-transition: -o-transform 600ms;
	-ms-transform: translate(-60vw, 0px);
	-webkit-transform: translate(-60vw, 0px);
	-moz-transform: translate(-60vw, 0px);
	-o-transform: translate(-60vw, 0px);
}
.hideMenuBody2 {
	width: 100vw; height: 100vh;
	background: black;
	position: absolute;
	z-index: 777;
	opacity: 0.5;
	transition: transform 600ms;
	transform: translate(-100vw, 0px);
	-ms-transition: -ms-transform 600ms;
	-webkit-transition: -webkit-transform 600ms;
	-moz-transition: -moz-transform 600ms;
	-o-transition: -o-transform 600ms;
	-ms-transform: translate(-100vw, 0px);
	-webkit-transform: translate(-100vw, 0px);
	-moz-transform: translate(-100vw, 0px);
	-o-transform: translate(-100vw, 0px);
}
.hideMenuBody ul li {
	margin: 10px 30px;
}
.menuBtn {
	z-index: 666;
	width: 35px; height: 35px;
	margin: 5px;
	position: absolute;
	cursor: pointer;
}
.closetBtn {
	z-index: 999;
	width: 35px; height: 35px;
	margin: 5px;
	cursor: pointer;
}
.menu_close{
	width: 35px; height: 35px;
}
</style>
<script>
	function showLeftMenu() {
		var menuBtnObj = document.getElementById('menuBtn');
		var leftMenuObj = document.getElementById('hideMenuBodyId');
		var leftMenuObj2 = document.getElementById('hideMenuBodyId2');
		menuBtnObj.style['display'] = "none";
		leftMenuObj.style['transform'] = "translate(0px, 0px)";
		leftMenuObj2.style['transform'] = "translate(0px, 0px)";

		leftMenuObj.style['msTransform'] = "translate(0px, 0px)";
		leftMenuObj.style['mozTransform'] = "translate(0px, 0px)";
		leftMenuObj.style['webkitTransform'] = "translate(0px, 0px)";
		leftMenuObj.style['oTransform'] = "translate(0px, 0px)";
		leftMenuObj2.style['msTransform'] = "translate(0px, 0px)";
		leftMenuObj2.style['mozTransform'] = "translate(0px, 0px)";
		leftMenuObj2.style['webkitTransform'] = "translate(0px, 0px)";
		leftMenuObj2.style['oTransform'] = "translate(0px, 0px)";
	}

	function closeLeftMenu() {
		var menuBtnObj = document.getElementById('menuBtn');
		var leftMenuObj = document.getElementById('hideMenuBodyId');
		var leftMenuObj2 = document.getElementById('hideMenuBodyId2');

		menuBtnObj.style['display'] = "block";
		leftMenuObj.removeAttribute("style");
		leftMenuObj2.removeAttribute("style");
	}
</script>
</head>
<body>
	<div class="hideMenuBody" id="hideMenuBodyId">
		<div class="closetBtn" onclick="closeLeftMenu(); return false;">
			<img class="menu_close" src="${contextPath }/resources/img/close.png">
		</div>
		<div>
			<ul>
				<li><a href="${contextPath}/webtoon/platformWebtoon?platformName=naver">플랫폼별 웹툰</a></li>
				<li><a href="${contextPath}/webtoon/genreWebtoon?webtoonGenre=g1">장르별 웹툰</a></li>
				<li><a href="${contextPath }/member/interest">관심</a></li>
				<li><a href="${contextPath }/member/favorites">즐겨찾기</a></li>
				<br>
				<c:if test="${division == 'admin' }">
					<li><a href="${contextPath }/admin/report">관리자 페이지</a></li>
				</c:if>
				<c:choose>
					<c:when test="${user == null }">
						<li><a href="${contextPath }/member/login">로그인</a></li>
					</c:when>
					<c:otherwise>
						<li><a href="${contextPath }/member/logout">로그아웃</a></li>
					</c:otherwise>
				</c:choose>
				<br>
				<li><a href="${contextPath }/main">HOME</a></li>
			</ul>
		</div>
	</div>
	<div class="hideMenuBody2" id="hideMenuBodyId2" onclick="closeLeftMenu(); return false;"></div>
	<div class="menuBtn" id="menuBtn" onclick="showLeftMenu(); return false;">
		<img class="menu_close" src="${contextPath }/resources/img/menu.png">
	</div>
</body>
</html>