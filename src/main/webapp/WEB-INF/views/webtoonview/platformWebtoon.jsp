<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AllToons platform</title>
<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/sort_nameStyle.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=yes,maximum-scale=1.0, minimum-scale=1.0" />
<script type="text/javascript">
$(document).ready(function(){
		if(location.hash){ 
			var data = history.state; 
			if(data){ 
				$('#platformChange').html(data.list); 
				$("#nameKor").html(data.kor_name);
				nowPlatform=data.nowPlatform;
		}
	}
});
</script>
<script type="text/javascript">
	var total_list =""; 
	nowPlatform=null;//플랫폼 버튼 미선택시
	let p_name=null;
	/* 플랫폼 선택시 ajax로 데이터변경 *//* 플랫폼 선택시 결과물을 받아오는 메소드 */
	function platformChange(platform) {
		var sort = document.getElementById("webtoonSort");
		var sortValue = sort.options[sort.selectedIndex].value;
		$.ajax({
			url : "${contextPath}/webtoon/sort",
			type : "POST",
			dataType : "json",
			data : {
				platformName : platform,sort: sortValue
			},
			success : function(platformView) {
				nowPlatform=platform;
				insertPlatform(platformView);
			},error:function(request,status,error){
			    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);}
		})
	};
	function insertPlatform(platformView){//출력문
		$("#platformChange").html("")
		let html="";
		html += "<table border=1>";
		var i=0; var j=3;
		$.each(platformView,function(index,webtoonList){
			nowPlatform=webtoonList.platformName;
			p_name =webtoonList.platformNameKor;
			if(i%j ==0){
				html += "<tr>"
			}
			html += "<td><a href='${contextPath}/webtoon/webtooninfo?webtoonNum="+ webtoonList.webtoonNum+"'>"
			if(webtoonList.webtoonImage == 'default_image.png'){
				html += "<img id='webtoonImage' src='${contextPath}/resources/img/webtoon/default_image.png' width=200 height=200 alt='no image' />"
			}else{
				html += "<img id='webtoonImage' src='${contextPath}/thumbnail?webtoonImage="+webtoonList.webtoonImage+"'width=200 height=200 alt='this has image' />"
			}
			html += "<br>"
			html += "<label>"+webtoonList.webtoonTitle+"</label><br>" 
			html += "<label>"+webtoonList.webtoonWriter+"</label></a></td>"
			if(i%j == j-1){
				html += "</tr>"	
			}
			i += 1;
		});html += "</table>"
		$("#platformChange").html(html)
		total_list +=html;
		$("#nameKor").html(p_name);
		history.replaceState({list:total_list,kor_name:p_name,nowPlatform:nowPlatform},'', '${contextPath}/webtoon/platformWebtoon##');
		total_list="";
	}
	
</script>
<script type="text/javascript">/* 정렬ajax *//* 지속유지필요 */
function sort(){
	var start = 1;
	var limit = 15;
	console.log("정렬시 플랫폼 상황: "+nowPlatform)
	var sort = document.getElementById("webtoonSort");
	var sortValue = sort.options[sort.selectedIndex].value;
	if(nowPlatform == null){
		nowPlatform="naver";
	}
	$.ajax({
		url: "${contextPath}/webtoon/paging_sort",
		type: "POST",
		data: {sort: sortValue, platformName: nowPlatform,
			start: start, limit: limit},
		success : function(platformView){
			insertList(platformView);
		},
		error:function(request,status,error){
		    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		    }
	})  
}
</script>
<script type="text/javascript">

var platform='naver';
var start =16;
var limit=30;
function appendList(){
	var sort = document.getElementById("webtoonSort");
	var sortValue = sort.options[sort.selectedIndex].value;
	//var sortValue = 'nameAsc';
	console.log("스크롤 내려옴")
	$.ajax({
		url : "${contextPath}/webtoon/paging_sort",
		type : "POST",
		dataType : "json",
		data : {
			platformName : platform,sort: sortValue, 
			start: start, limit: limit
		},
		success : function(platformView) {
			console.log("성공")
			nowPlatform=platform;
			insertList(platformView);
			if(start == 1){
				console.log("여기")
				start +=15
				limit +=15
			}else{
				start = start +15
				limit = limit +15
			}
			
		},error:function(request,status,error){
			console.log("실패")
		    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);}
	})
}
function insertList(platformView){
	let html="";
	var i=0; var j=3;
	$.each(platformView,function(index,webtoonList){
		nowPlatform=webtoonList.platformName;
		p_name =webtoonList.platformNameKor;
		if(i%j ==0){
			html += "<tr>"
		}
		html += "<td><a href='${contextPath}/webtoon/webtooninfo?webtoonNum="+ webtoonList.webtoonNum+"'>"
		if(webtoonList.webtoonImage == 'default_image.png'){
			html += "<img id='webtoonImage' src='${contextPath}/resources/img/webtoon/default_image.png' width=200 height=200 alt='no image' />"
		}else{
			html += "<img id='webtoonImage' src='${contextPath}/thumbnail?webtoonImage="+webtoonList.webtoonImage+"'width=200 height=200 alt='this has image' />"
		}
		html += "<br>"
		html += "<label>"+webtoonList.webtoonTitle+"</label><br>" 
		html += "<label>"+webtoonList.webtoonWriter+"</label></a></td>"
		if(i%j == j-1){
			html += "</tr>"	
		}
		i += 1;
	});
	$("#platform_Change").append(html)
}


function debounce(callback, limit = 100) {
	  let timeout;
	  return function (...args) {
	    clearTimeout(timeout);
	    timeout = setTimeout(() => {
	      callback.apply(this, args);
	    }, limit);
	  };
	}

	//appendList();
	
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
<body>
	<c:import url="../default/moveTopBtn.jsp"/>
	<header>
		<c:import url="../default/header.jsp"/>
		<c:import url="../default/menu.jsp"/>
		<!-- 어드민 페이지 헤더 -->
		<c:import url="./header/webtoonHeader.jsp">
			<c:param name="tag" value="플랫폼 별 웹툰"></c:param>
		</c:import>
		<div class="scrollBtn">
			<nav>
				<ul id="platform">
					<li><button class="listBtn" id="naver" onclick="platformChange('naver')">네이버</button>	</li>
					<li><button class="listBtn" id="kakaoWebtoon" onclick="platformChange('kakaoWebtoon')">카카오웹툰</button></li>
					<li><button class="listBtn" id="kakaoPage" onclick="platformChange('kakaoPage')">카카오페이지</button>	</li>
					<li><button class="listBtn" id="bomtoon" onclick="platformChange('bomtoon')">봄툰</button>	</li>
					<li><button class="listBtn" id="lezhin" onclick="platformChange('lezhin')">레진코믹스</button></li>
					<li><button class="listBtn" id="mrblue" onclick="platformChange('mrblue')">미스터블루</button>	</li>
					<li><button class="listBtn" id="ridibooks" onclick="platformChange('ridibooks')">리디북스</button></li>
				</ul>
			</nav>
		</div>
	</header>
	<label id="nameKor">${platformView[0].platformNameKor }</label><!-- 플랫폼 명 뜸 -->
	<select name="webtoonSort" id="webtoonSort" onchange="sort()" >
		<option value="nameAsc"selected="selected">제목 오름차순</option>
		<option value="nameDesc">제목 내림차순</option>
		<option value="viewCount">조회수 순</option>
		<option value="popularity">인기순</option>
	</select>
	<c:set var="i" value="0" />
	<c:set var="j" value="3" />
	<!-- 가로 n개씩 -->
	<div id="platformChange">
		<table border=1 id="platform_Change">
			<c:forEach items="${platformView }" var="webtoonList">
				<c:if test="{i%j == 0}">
					<tr>
				</c:if>
				<td><a
					href="${contextPath}/webtoon/webtooninfo?webtoonNum=${webtoonList.webtoonNum}">
						<c:choose>
							<c:when
								test="${webtoonList.webtoonImage=='default_image'||webtoonList.webtoonImage=='default_image.png'}">
								<img id="webtoonImage"
									src="${contextPath }/resources/img/webtoon/default_image.png"
									width=200 height=200 alt="선택된 이미지가 없습니다" />
							</c:when>
							<c:otherwise>
								<img id="webtoonImage"
									src="${contextPath }/thumbnail?webtoonImage=${webtoonList.webtoonImage}"
									width=200 height=200 alt="썸네일이 존재" />
							</c:otherwise>
						</c:choose> <br> <label>${webtoonList.webtoonTitle}</label><br> <label>${webtoonList.webtoonWriter}</label>
				</a></td>
				<c:if test="${i%j == j-1}">
					</tr>
				</c:if>
				<c:set var="i" value="${i+1}" />
			</c:forEach>
		</table>
	</div>
</body>
</html>