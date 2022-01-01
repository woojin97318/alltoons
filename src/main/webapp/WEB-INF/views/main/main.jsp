<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"content="width=device-width, initial-scale=1.0, user-scalable=yes,	maximum-scale=1.0, minimum-scale=1.0" />
<link rel="stylesheet" type="text/css"	href="${contextPath}/resources/css/mainStyle.css">
<title>AllToons</title>
<script type="text/javascript">
/* 무한스크롤 */
var start =31;
var limit=45;
function appendList(){
	console.log("스크롤 내려옴")
	console.log("스크롤 내려옴"+start)
	console.log("스크롤 내려옴"+limit)
	$.ajax({
		url : "${contextPath}/main",
		type : "POST",
		dataType : "json",
		data : {
			start: start, limit: limit
		},
		success : function(popularView) {
			console.log("성공")
			insertList(popularView);
			start = start +15
			limit = limit +15
			
		},error:function(request,status,error){
			console.log("실패")
		    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);}
	})
}

/* append */
function insertList(popularView){
	let html="";
	$.each(popularView,function(index,webtoonList){
		html += "<a href='${contextPath}/webtoon/webtooninfo?webtoonNum="+ webtoonList.webtoonNum+"'><section class='webtoon-result-box'>"
		if(webtoonList.webtoonImage == 'default_image.png'){
			html += "<section class='webtoonImg'><img id='webtoonImage' src='${contextPath}/resources/img/webtoon/default_image.png' alt='선택된 이미지가 없습니다' /></section>"
		}else{
			html += "<section class='webtoonImg'><img id='webtoonImage' src='${contextPath}/thumbnail?webtoonImage="+webtoonList.webtoonImage+"' alt='썸네일이 존재' /></section>"
		}
		html += "<section class='webtoon-result-title'>"
		html += "<label class='title-result pointer'>"+webtoonList.webtoonTitle+"</label><br>" 
		html += "<label class='small-font pointer'>"+webtoonList.webtoonWriter+"</label><br>" 
		html += "<label class='xsmall-font pointer'>"+webtoonList.platformName
		if(webtoonList.platformNum !=0){
			html += " 외 "+webtoonList.platformNum+"곳 </label><br>"
		}else{
			"</label><br>" 
		}
		html += "</section></section></a>"
	});
	$("#paging").append(html)
}

/* 스크롤 감지 */
function debounce(callback, limit = 100) {
	  let timeout;
	  return function (...args) {
	    clearTimeout(timeout);
	    timeout = setTimeout(() => {
	      callback.apply(this, args);
	    }, limit);
	  };
	}

	
	// ===== 무한 스크롤 (스크롤 이벤트) =====
	document.addEventListener("scroll", debounce(e => {
  // clientHeight : 웹 브라우저 창의 높이
  // scrollTop : 현재 스크롤된 부분의 맨 위의 높이
  // scrollHeight : 문서의 총 높이 (= 스크롤의 총 높이)
  // 스크롤의 마지막에 도달 : clientHeight + scrollTop >= scrollHeight
  const { clientHeight, scrollTop, scrollHeight } = e.target.scrollingElement
  if(clientHeight + scrollTop >= scrollHeight) {
  	appendList()
  	}
	}, 200));
</script>
</head>

<body style="margin-top: -80px;">
	<header>
		<c:import url="../default/header.jsp"/>
		<c:import url="../default/menu.jsp"/>
	</header>
	<div style="padding-top: 70px;" class="container">
		<h2>전체보기 [ 인기순 ]</h2>
		<div class="webtoon-result" id="paging">
			<c:forEach items="${popularPage }" var="webtoonList">
				<section class="webtoon-result-box" onclick="location.href='${contextPath}/webtoon/webtooninfo?webtoonNum=${webtoonList.webtoonNum}'">
					<c:choose>
						<c:when test="${webtoonList.webtoonImage=='default_image'||webtoonList.webtoonImage=='default_image.png'}">
							<section class="webtoonImg">
								<img id="webtoonImage" src="resources/img/webtoon/default_image.png" alt="선택된 이미지가 없습니다" />
							</section>
						</c:when>
						<c:otherwise>
							<section class="webtoonImg">
								<img id="webtoonImage" src="${contextPath }/thumbnail?webtoonImage=${webtoonList.webtoonImage}" alt="썸네일이 존재" />
							</section>
							</c:otherwise>
					</c:choose>
					<section class="webtoon-result-title">
						<label class="title-result pointer">${webtoonList.webtoonTitle}</label><br>
						<label class="small-font pointer">${webtoonList.webtoonWriter}</label><br>
						<label class="xsmall-font pointer">
							${webtoonList.platformName} 
							<c:if test="${webtoonList.platformNum !=0}"> 외 ${webtoonList.platformNum}곳</c:if>
						</label>
					</section>
				</section>
			</c:forEach>
		</div>
	</div>
	<footer>
		<c:import url="../default/footer.jsp"/>
	</footer>
</body>
</html>