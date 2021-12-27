<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/mainStyle.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<title>Insert title here</title>
<style>
@import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic+Coding:wght@700&display=swap');

:root {
	--blue: rgb(0,119,255);
	--skyblueL: rgb(174, 209, 255);
	--heart: rgb(255, 38, 0);
	--star: rgb(255, 208, 0);
}

a {
	text-decoration: none;
}

.center {/*정가운데*/
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%,-50%);
}

#menu-Btn {
	z-index: 1000;
	width: 50px;
	height: 50px;
	position: fixed;
	top: 50px;
	left: 30px;
	transform: translate(10%,-50%);
	border-radius: 100%;
}

#menu-Btn:hover {
	background: rgba(0, 0, 0, 0.1);
}

.hideMenuBody #menu1 {
	position: absolute;
	top: -5px;
}

.hideMenuBody #menu2 {
	position: absolute;
	bottom: 90px;
}

.hideMenuBody ul li {
	width: 300px;
	position: relative;
	left: -20px;
	margin: 5%;
	list-style: none;
}

.hideMenuBody ul li a {
	color: #6c7a83c7;
	line-height: 50px;
	font-family: 'Nanum Gothic Coding', monospace;
}

.hideMenuBody ul li:hover a {
	color: var(--blue);
}

.hideMenuBody ul li a .menuicon {
	position: relative;
	bottom: -7px;
}

.hideMenuBody ul li a .menuicon ion-icon {
	font-size: 1.75em;
}

.hideMenuBody ul li:hover a .heart {
	color: var(--heart);
}

.hideMenuBody ul li:hover a .star {
	color: var(--star);
}

.hideMenuBody ul li a .menutitle {
	font-size: 1.2em;
}

div[id="hideMenuBodyId"] {
	left: -300px;
	width: 300px;
	height: 100vh;
	background: white;
	position: fixed;
	z-index: 999;
	transition: all .35s ease-in;
}
div[id="hideMenuBodyId2"] {
	visibility : hidden;
	width: 100vw;
	height: 100vh;
	position: fixed;
	background: black;
	opacity: 0;
	z-index: 998;
	transition: opacity .35s ease;
}
input[id="menuicon"] {display: none;}
input[id="menuicon"] + label {
	display: block;
	width: 30px;
	height: 30px;
	position: relative;
	cursor: pointer;
}
input[id="menuicon"] + label span {
	display: block;
	position: absolute;
	width: 100%;
	height: 4px;
	border-radius: 30px;
	background: white;
	transition: all .35s;
}
input[id="menuicon"] + label span:nth-child(1) {top:10%;}
input[id="menuicon"] + label span:nth-child(2) {top:50%;transform:translateY(-50%);} /* 비슷하게 사용할 수 있는 style top:calc(50% - 2.5px); margin-top:-2.5px;*/
input[id="menuicon"] + label span:nth-child(3) {bottom:10%;}
input[id="menuicon"]:checked + label span:nth-child(1) {top:50%;transform:translateY(-50%) rotate(45deg);}
input[id="menuicon"]:checked + label span:nth-child(2) {opacity:0;}
input[id="menuicon"]:checked + label span:nth-child(3) {bottom:50%;transform:translateY(50%) rotate(-45deg);}

img#MOVE_TOP_BTN {
	width: 50px; 
	height: 50px;
	position: fixed;
	right: 2%;
	bottom: 10%;
	display: none;
	z-index: 999;
	cursor: pointer;
}

</style>

<script>
	$(function() {
		$(window).scroll(function() {
			if ($(this).scrollTop() > 500) {
				$('#MOVE_TOP_BTN').fadeIn();
			} else {
				$('#MOVE_TOP_BTN').fadeOut();
			}
		});

		$("#MOVE_TOP_BTN").click(function() {
			$('html, body').animate({
				scrollTop : 0
			}, 400);
			return false;
		});
	});

	function loginChk() {
		if(${user == null}){
			alert("로그인 후 이용 가능합니다.");
			window.location.href = 'member/login';
		}
	}

	function moveMenu(obj){
		    var menu1 = document.getElementById('hideMenuBodyId');
			var menu2 = document.getElementById('hideMenuBodyId2');
		    if(obj.checked == true){
				menu1.style['left'] = "0px";
				menu2.style['visibility'] = "visible";
				menu2.style['opacity'] = "0.3";
			}else{
		    	menu1.removeAttribute("style");
		    	menu2.style['opacity'] = "0";
		    	menu2.style['transition'] = "opacity .35s ease";
		    	setTimeout(function() {
		    		var menu2 = document.getElementById('hideMenuBodyId2');
		    		menu2.style['visibility'] = "hidden";
		    	}, 0.35*1000);
		    }
	}
	
</script>
</head>

<body>
	<div id="menu-Btn" ><!-- 메뉴버튼 -->
	   <div class="center">
		   <input type="checkbox" id="menuicon" onclick="moveMenu(this)">
		   <label for="menuicon">
			   <span></span>
			   <span></span>
			   <span></span>
		   </label>
	   </div>
	</div>

	<div class="hideMenuBody" id="hideMenuBodyId">
			<ul id="menu1">
				<li>
					<a href="${contextPath}/webtoon/platformWebtoon?platformName=naver">
						<span class="menutitle">플랫폼별 웹툰 </span>
					</a>
				</li>
				<li>
					<a href="${contextPath}/webtoon/genreWebtoon?webtoonGenre=g1">
						<span class="menutitle">장르별 웹툰 </span>
					</a>
				</li>
				<li>
					<a href="${contextPath }/member/interest" onclick="loginChk()">
						<span class="menutitle">관심목록 </span>
						<span class="menuicon"><ion-icon name="heart-outline" class="heart"></ion-icon></span>
					</a>
				</li>
				<li>
					<a href="${contextPath }/member/favorites" onclick="loginChk()">
						<span class="menutitle">즐겨찾기 </span>
						<span class="menuicon"><ion-icon name="star-outline" class="star"></ion-icon></span>
					</a>
				</li>
			</ul>
			<ul id="menu2">
				<c:if test="${division == 'admin' }">
					<li>
						<a href="${contextPath }/admin/report">
							<span class="menutitle">관리자 페이지 </span>
						</a>
					</li>
				</c:if>
				<c:choose>
					<c:when test="${user == null }">
						<li>
							<a href="${contextPath }/member/login">
								<span class="menutitle">로그인 </span>
								<span class="menuicon"><ion-icon name="log-in-outline"></ion-icon></span>
							</a>
						</li>
					</c:when>
					<c:otherwise>
						<li>
							<a href="${contextPath }/member/myPage">
								<span class="menutitle">마이페이지 </span>
								<span class="menuicon"><ion-icon name="person-outline"></ion-icon></span>
							</a>
						</li>
						<li>
							<a href="${contextPath }/member/logout">
								<span class="menutitle">로그아웃 </span>
								<span class="menuicon"><ion-icon name="log-out-outline"></ion-icon></span>
							</a>
						</li>
					</c:otherwise>
				</c:choose>
				<li>
					<a href="${contextPath }/main">
						<span class="menutitle">HOME </span>
						<span class="menuicon"><ion-icon name="home-outline"></ion-icon></span>
					</a>
				</li>
			</ul>
		</div>
	<div class="hideMenuBody2" id="hideMenuBodyId2" ></div>
	<img id="MOVE_TOP_BTN" src="${contextPath}/resources/img/moveTopBtn.png">

	<script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
	<script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
</body>
</html>