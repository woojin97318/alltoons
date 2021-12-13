<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<%@  taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=yes,maximum-scale=1.0, minimum-scale=1.0" />
<title>작품 상세페이지</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	<c:choose>
		<c:when test="${fn:contains(favoritesDTO.interest,'T')}">
			interest_on();
		</c:when>
		<c:otherwise>
			interest_off();
		</c:otherwise>
	</c:choose>
	
	<c:choose>
	<c:when test="${fn:contains(favoritesDTO.favorites,'T')}">
		favorties_on();
	</c:when>
	<c:otherwise>
		favorties_off();
	</c:otherwise>
</c:choose>
});

function interest_on(){
	document.getElementById("interest").src="resources/resources/interest_on.png";
}
function interest_off(){
	document.getElementById("interest").src="resources/resources/interest_off.png";
}
function favorties_on(){
	document.getElementById("favorites").src="resources/resources/favorties_on.png";
}
function favorties_off(){
	document.getElementById("favorites").src="resources/resources/favorties_off.png";
}
</script>
<script type="text/javascript">/* 관심 */
	function interestClick(){
		$.ajax({
			url: "interestClick",
			type: "GET",
			data: {
				webtoonNum: "${webtoonDate.webtoonNum}",
				userEmail: "1234"
			},
			success : function(cnt){
				$("#icount").text(cnt)
				i_onOff()
			},
			error: function(){alert("실패")}
		})
	}
	function i_onOff(){
		$.ajax({
			url: "i_onOff",
			type: "GET",
			data: {
				webtoonNum: "${webtoonDate.webtoonNum}",
				userEmail: "1234"
			},
			success : function(onoff){
				if(onoff=="T"){
					console.log(onoff);
					interest_on()
				}else{
					console.log(onoff);
					interest_off()
				}
			},error: function(){alert("하트 실패")}
		})
	}	
</script>
<script type="text/javascript">/* 즐겨찾기 */
	function favoritesClick(){
		$.ajax({
			url: "favoritesClick",
			type: "GET",
			data: {
				webtoonNum: "${webtoonDate.webtoonNum}",
				userEmail: "1234"
			},
			success : function(cnt){
				$("#fcount").text(cnt)
				f_onOff()
			},
			error: function(){alert("실패")}
		})
	}
	function f_onOff(){
		$.ajax({
			url: "f_onOff",
			type: "GET",
			data: {
				webtoonNum: "${webtoonDate.webtoonNum}",
				userEmail: "1234"
			},
			success : function(onoff){
				if(onoff=="T"){
					console.log(onoff);
					favorties_on()
				}else{
					favorties_off()
				}
			},error: function(){alert("별 실패")}
		})
	}	
</script>
</head>
<body>	


<h1>작품 상세 페이지</h1>
	<div style="display: flex;">
		<c:choose>
			<c:when test="${webtoonList.webtoonImage=='default_image'}">
				<img id="webtoonImage" src="resources/resources/default_image.jpg"
					width=100 height=100 alt="선택된 이미지가 없습니다" />
			</c:when>
			<c:otherwise>
				<img id="webtoonImage"
					src="${contextPath }/thumbnail?webtoonImage=${webtoonDate.webtoonImage}"
					width=100 height=100 alt="썸네일이 존재" />
			</c:otherwise>
		</c:choose>
		<div>
			${webtoonDate.webtoonTitle}<br>
			<img src="" width="20"height="20" onclick="interestClick()" id="interest"><label id="icount">${intesrestCount }</label><br>
			<img src="" width="20"height="20" onclick="favoritesClick()" id="favorites"><label id="fcount">${favoritesCount }</label><br>
			<b>작가명</b><br>
			${webtoonDate.webtoonWriter }
		</div>
	</div>
	<b>보러가기</b>
	<c:forEach var="list" items="${platformList}">
		<button type="button" onclick="location.href='${list.webtoonLink}'" >${list.platformName }</button>
	</c:forEach>
	<br>
	<c:if test="${originList[0].webtoonOriginalLink !='nan' }">
		<b>이 작품은 소설이 존재해요!</b><br>
		<c:forEach var="origin" items="${originList }">
			<button type="button" onclick="location.href='${origin.webtoonOriginalLink}'" >${origin.originalPlatform}</button>
		</c:forEach>
	</c:if>
	<br>
	<b>작품 소개글</b><br>
	<label>${webtoonDate.webtoonContent }</label>
</body>
</html>