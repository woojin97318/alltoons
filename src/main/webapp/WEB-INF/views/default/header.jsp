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

</head>
<c:set var="cookie" value='${cookie.logincookie.value}'/>
<c:url var="interest" value='member/interest'/>
<c:url var="favorties" value='member/favorites'/>
<c:url var="myPage" value='member/myPage'/>
<c:url var="admin" value='admin/adminPage'/>
<c:url var="login" value='member/login'/>

<body>
   <div id="main-title">
      AllToons
      <div id="searchBar">
         <form action="${contextPath }/webtoonSearch" method="POST">
            <input type="text" name="search" size="20" placeholder="검색어 입력" value="${search}" required >
            <input type="submit" value="검색">
         </form>
      </div>
   </div>
   <button onclick="" id="menuBtn"></button>
   <div class="main-menu">
      <nav>
         <ul id="menu1">
         	<li><h3>메뉴</h3></li>
            <li><a href="${contextPath}/webtoon/platformWebtoon?platformName=naver">플랫폼별 웹툰</a></li>
            <li><a href="${contextPath}/webtoon/genreWebtoon?webtoonGenre=g1">장르별 웹툰</a></li>
            
            <li id="inter"><a interest="onclick=interest" href="javascript:TOmyPage(this, '${interest }');">관심목록</a></li>
	        <li id="fav"><a favorties="onclick=favorties" href="javascript:TOmyPage(this, '${favorties }');">즐겨찾기</a></li>
	        <c:if test="${sessionScope.user != null}">
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
      </nav>
   </div>
</body>
</html>