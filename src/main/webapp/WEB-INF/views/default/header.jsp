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
<script type="text/javascript">

(function(){
	if (${sessionScope.user == null}) {
		console.log('null');
	}else{
		console.log('login');
		console.log('${sessionScope.user}');
		console.log('${sessionScope.admin}');
	}
}());

function TOmyPage(obj, page) {
	if(${sessionScope.user != null}){
		window.location.href=page;
	}else{
		login();
	}
}

function login(){
	alert("로그인 후 이용 가능합니다.");
	window.location.href = 'member/login';
}

function showId(id){
	document.getElementById(id).style.display ='block';
}

function hideId(id){
	document.getElementById(id).style.display ='none';
}

</script>

<title>header</title>

<style type="text/css">
.center {position:absolute;top:50%;left:50%;transform: translate(-50%,-50%);}/*정가운데*/
.center1{display:flex;justify-content:center;}
#logo{transform:translate(-50%,-150%);}

input::-webkit-input-placeholder {
padding:5px;
color:#335999;
font-weight: bold;
}
input:-ms-input-placeholder {
color:#335999;
}
textarea::-webkit-input-placeholder {
color:#335999;
}
textarea:-ms-input-placeholder {
color:#335999;
}

#searchBar{
transform:translate(-50%,10%);}
.searchIn{
height:30px;
border: 3px solid rgb(0,119,255);
}
.searchIn:focus{
box-shadow:0px 0px 5px 2px rgb(0,119,255);}

.searchBtn{/*검색버튼*/

}
#menu1{
list-style: none;
position:relative;
top:-50px;
left: 90px;
}
#menu2{
list-style: none;
position:relative;

left: 90px;
}
#main-menu{
	padding: 10% 0;
	width: 300px;
	height: 100%;
	position:relative;
	top:0px;
	left: 0;
	border-radius: 10px;
	background-color:rgb(174, 209, 255);
	transform:translateX(-300px);
}
.wrap{
}

#menuBtn {order: 2; width:50px;height:50px;position:absolute;top:50%;left:30px;transform:translate(10%,-50%);border-radius:100%;}
input[id="menuicon"] {display:none;}
input[id="menuicon"] + label {display:block;width:30px;height:30px;position:relative;cursor:pointer;}
input[id="menuicon"] + label span {display:block;position:absolute;width:100%;height:4px;border-radius:30px;background:white;transition:all .35s;}
input[id="menuicon"] + label span:nth-child(1) {top:10%;}
input[id="menuicon"] + label span:nth-child(2) {top:50%;transform:translateY(-50%);} /* 비슷하게 사용할 수 있는 style top:calc(50% - 2.5px); margin-top:-2.5px;*/
input[id="menuicon"] + label span:nth-child(3) {bottom:10%;}
input[id="menuicon"]:checked + label span:nth-child(1) {top:50%;transform:translateY(-50%) rotate(45deg);}
input[id="menuicon"]:checked + label span:nth-child(2) {opacity:0;}
input[id="menuicon"]:checked + label span:nth-child(3) {bottom:50%;transform:translateY(50%) rotate(-45deg);}

#menuBtn:hover ~ #main-menu{

}


</style>

</head>
<c:set var="cookie" value='${cookie.logincookie.value}'/>
<c:url var="interest" value='member/interest'/>
<c:url var="favorties" value='member/favorites'/>
<c:url var="myPage" value='member/myPage'/>
<c:url var="admin" value='admin/report'/>
<c:url var="login" value='member/login'/>
<c:url var="main" value='main'/>

<body>
<div>

   <div id="main-title"><!-- 검색창&로고 -->
   <span id="logo" class="center"><a href="${main }">AllToons</a></span>
      <div id="searchBar" class="center" class="wrap">
         <form action="${contextPath }/webtoonSearch" method="POST">
            <input type="text" name="search" class="searchIn" size="40" placeholder="원하는 웹툰을 찾아보세요 :)" value="${search}" required >
            <input type="submit" class="searchBtn" value="검색">
         </form>
      </div>
   </div>
	

   <div id="main-menu"><!-- 메뉴창 -->
      
         <ul id="menu1">
         	<li><h3>메뉴</h3></li>
            <li><a href="${contextPath}/webtoon/platformWebtoon?platformName=naver">플랫폼별 웹툰</a></li>
            <li><a href="${contextPath}/webtoon/genreWebtoon?webtoonGenre=g1">장르별 웹툰</a></li>
            
            <li id="inter"><a interest="onclick=interest" href="javascript:TOmyPage(this, '${interest }');">관심목록</a></li>
	        <li id="fav"><a favorties="onclick=favorties" href="javascript:TOmyPage(this, '${favorties }');">즐겨찾기</a></li>
	        <c:if test="${user != null}">
		        <li id="mypg"><a myPage="onclick=myPage" href="javascript:TOmyPage(this, '${myPage }');">마이 페이지</a></li>
	        </c:if>
	     </ul>
         <ul id="menu2">
          	<c:if test="${division == 'admin'}">
			   <li><a id="admin" href="${contextPath }/admin/report">관리자 페이지</a></li>
	        </c:if>
            <c:choose>
               <c:when test="${sessionScope.user != null}">
                   <li><a href="${contextPath}/member/logout">로그아웃</a></li>
               </c:when>
               <c:otherwise>
                  <li><a href="${contextPath}/member/login">로그인</a></li>
               </c:otherwise>
            </c:choose>
         </ul>
      
   </div>

	<div id="menuBtn"><!-- 메뉴버튼 -->
	   <div class="center">
		   <input type="checkbox" id="menuicon">
		   <label for="menuicon">
			   <span></span>
			   <span></span>
			   <span></span>
		   </label>
	   </div>
	</div>
</div>

<script type="text/javascript">

$('#menuBtn').click(function(){
	if($('#menuicon').prop("checked")){
		$('#main-menu').css({"transform":"translateX(-70px)"});
		$('#main-menu').css({"transition":"all .4s"});
	}else{
		$('#main-menu').css({"transform":"translateX(-300px)"});
		$('#main-menu').css({"transition":"all .4s"});
	}
})

<!-- $('#main-menu').hide(); 
$('#menuBtn').click(function(){
	if($('#menuicon').prop("checked")){
		$('#main-menu').slideDown();
	}else{
		$('#main-menu').slideUp();
	}
})

-->
</script>
</body>
</html>