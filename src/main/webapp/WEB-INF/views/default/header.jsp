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
<style type="text/css">
	@import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic+Coding:wght@400;700&display=swap');
	.center1 {
		display: flex;
		justify-content: center;
	}

	.header-container {
		min-width: 320px;
		max-width: 768px;
		height: auto;
	}

	#logo {
		transform: translate(-50%,-90%);
	}

	#logo a > img {
		height: 50px;
		width: auto;
	}

	input::-webkit-input-placeholder {
		padding: auto;
		color:#335999;
		font-weight: bold;
	}

	input:-ms-input-placeholder {
		padding: auto;
		color:#335999;
		font-weight: bold;
	}

	textarea::-webkit-input-placeholder {
		padding: auto;
		color:#335999;
		font-weight: bold;
	}

	textarea:-ms-input-placeholder {
		padding: auto;
		color:#335999;
		font-weight: bold;
	}

	#searchBar {/*검색창+버튼*/
		transform: translate(-50%, -10%);
	}

	.searchIn {/*검색창*/
		position: fixed;
		transform: translate(-50%, 10%);
		border: 3px solid var(--blue);
		padding: 0 1em;
		height: 30px;
		border-radius: 25px;
		font-family: 'Nanum Gothic Coding', monospace;
	}

	.searchIn:focus {
		box-shadow: 0px 0px 5px 2px var(--blue);
		outline: none;
	}

	.searchBtn {	/*검색버튼*/
		cursor: pointer;
		position: absolute;
		width: 40px;
		height: 40px;
		background-color: transparent;
		color: var(--blue);
		top: 3px;
		left: 130px;
		border: none;
	}

	.searchBtn ion-icon {
		font-size: 20px;
	}

	#main-title {
		height: 100px;
		background-color:rgba(111, 173, 255, 0.56);
		backdrop-filter: blur(8px);
	}
</style>

<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">

(function(){
	if (${sessionScope.user == null}) {
		console.log('null');
	}else{
		console.log('login');
	}
}());
function menuOpen(){
	if($('#menuicon').prop("checked")){
		$('#main-menu').css({"transform":"translateX(-70px)"});
		$('#main-menu').css({"transition":"all .4s"});
	}else{
		$('#main-menu').css({"transform":"translateX(-300px)"});
		$('#main-menu').css({"transition":"all .4s"});
	}
};
function showId(id){
	document.getElementById(id).style.display ='block';
}
function hideId(id){
	document.getElementById(id).style.display ='none';
}
</script>

<title>header</title>

</head>

<c:set var="cookie" value='${cookie.logincookie.value}'/>
<c:url var="interest" value='member/interest'/>
<c:url var="favorites" value='member/favorites'/>
<c:url var="myPage" value='member/myPage'/>
<c:url var="admin" value='admin/report'/>
<c:url var="login" value='member/login'/>
<c:url var="main" value='main'/>

<body>
	<div>
		<div id="main-title"><!-- 검색창&로고 -->
			<div class="header-container">
				<span id="logo" class="center"><a href="${contextPath}/main"><img src="${contextPath}/resources/img/alltoons_logo.png" alt="AllToons"></a></span>
				<div id="searchBar" class="center" class="wrap">
					<form action="${contextPath }/main/webtoonSearch" method="POST">
							<input type="text" name="search" class="searchIn" size="50" placeholder="원하는 웹툰을 찾아보세요 :)" value="${search}" required >
							<button type="submit" class="searchBtn">
								<ion-icon name="search"></ion-icon>
							</button>
					</form>
				</div>
			</div>
		</div>
	</div>	
 
</body>
</html>