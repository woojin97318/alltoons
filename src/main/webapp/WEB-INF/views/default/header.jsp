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

<style type="text/css">
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
#main-title{
	height:100px;
	background-color:rgba(111, 173, 255, 0.56);
	backdrop-filter: blur(8px);
}
#main-menu{
	overflow: hidden;
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

#menu-Btn {order: 2; width:50px;height:50px;position:absolute;top:50%;left:30px;transform:translate(10%,-50%);border-radius:100%;}
input[id="menuicon"] {display:none;}
input[id="menuicon"] + label {display:block;width:30px;height:30px;position:relative;cursor:pointer;}
input[id="menuicon"] + label span {display:block;position:absolute;width:100%;height:4px;border-radius:30px;background:white;transition:all .35s;}
input[id="menuicon"] + label span:nth-child(1) {top:10%;}
input[id="menuicon"] + label span:nth-child(2) {top:50%;transform:translateY(-50%);} /* 비슷하게 사용할 수 있는 style top:calc(50% - 2.5px); margin-top:-2.5px;*/
input[id="menuicon"] + label span:nth-child(3) {bottom:10%;}
input[id="menuicon"]:checked + label span:nth-child(1) {top:50%;transform:translateY(-50%) rotate(45deg);}
input[id="menuicon"]:checked + label span:nth-child(2) {opacity:0;}
input[id="menuicon"]:checked + label span:nth-child(3) {bottom:50%;transform:translateY(50%) rotate(-45deg);}



</style>

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
   <span id="logo" class="center"><a href="${contextPath}/main">AllToons</a></span>
      <div id="searchBar" class="center" class="wrap">
         <form action="${contextPath }/main/webtoonSearch" method="POST">
            <input type="text" name="search" class="searchIn" size="40" placeholder="원하는 웹툰을 찾아보세요 :)" value="${search}" required >
            <input type="submit" class="searchBtn" value="검색">
         </form>
      </div>
   </div>
</div>	
 


</body>
</html>