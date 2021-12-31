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
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=yes,maximum-scale=1.0, minimum-scale=1.0" />
<link rel="stylesheet" type="text/css"	href="${contextPath}/resources/css/mainStyle.css">
<script type="text/javascript">
$(document).ready(function(){
		if(location.hash){ 
			var data = history.state; 
			if(data){ 
				$('#platform_Change').html(data.list); 
				$("#nameKor").html(data.kor_name);
				nowPlatform=data.nowPlatform;
				sortValue=data.sortValue;
				$("#webtoonSort").val(sortValue).attr("selected","selected")
		}
	}
});
</script>
<script type="text/javascript">
	var total_list =""; 
	nowPlatform=null;//플랫폼 버튼 미선택시
	let p_name=null;
	var sortValue =null;
	/* 플랫폼 클릭시 */
	function platformChange(platform) {
		console.log("플랫폼 버튼 작동")
		sort = document.getElementById("webtoonSort");
		sortValue = sort.options[sort.selectedIndex].value;
		window.scrollTo({top:0, left:0, behavior:'auto'});
		start = 1;
		limit = 15;
		$.ajax({
			url : "${contextPath}/webtoon/paging_sort",
			type : "POST",
			dataType : "json",
			data : {
				platformName : platform,sort: sortValue
			},
			success : function(platformView) {
				nowPlatform=platform;
				start +=15
				limit +=15
				insertPlatform(platformView);
			},error:function(request,status,error){
			    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);}
		})
	};
	
	/* 정렬문 */
	function sort_webtoon(){
		window.scrollTo({top:0, left:0, behavior:'auto'});
		start = 1;
		limit = 15;
		sort = document.getElementById("webtoonSort");
		sortValue = sort.options[sort.selectedIndex].value;
		console.log("정렬시 정렬 상황: "+sortValue)
		if(nowPlatform == null){
			nowPlatform="naver";
		}
		$.ajax({
			url: "${contextPath}/webtoon/paging_sort",
			type: "POST",
			data: {sort: sortValue, platformName: nowPlatform,
				start: start, limit: limit},
			success : function(platformView){
				
				start +=15
				limit +=15
				console.log("html")
				insertPlatform(platformView);
			},
			error:function(request,status,error){
			    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			    }
		})  
	}
	
	
	/* 무한스크롤 */
	
	var start =1;
	var limit=15;
	function appendList(){
		if(nowPlatform == null){
			nowPlatform="naver";
		}
		if(start ==1){
			start +=15
			limit +=15
		}
		sort = document.getElementById("webtoonSort");
		sortValue = sort.options[sort.selectedIndex].value;
		console.log("스크롤 내려옴")
		console.log("스크롤 내려옴"+start)
		console.log("스크롤 내려옴"+limit)
		$.ajax({
			url : "${contextPath}/webtoon/paging_sort",
			type : "POST",
			dataType : "json",
			data : {
				platformName : nowPlatform,sort: sortValue, 
				start: start, limit: limit
			},
			success : function(platformView) {
				if(platformView.size ==15)console.log("15개는 아님")
				console.log("성공")
				nowPlatform=platform;
				insertList(platformView);
				start = start +15
				limit = limit +15
				
			},error:function(request,status,error){
				console.log("실패")
			    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);}
		})
	}
</script>
<script type="text/javascript">
/* html출력문 */
function insertPlatform(platformView){
	$("#platform_Change").html("")
	let html="";
	$.each(platformView,function(index,webtoonList){
		nowPlatform=webtoonList.platformName;
		p_name =webtoonList.platformNameKor;
		
		html += "<a href='${contextPath}/webtoon/webtooninfo?webtoonNum="+ webtoonList.webtoonNum+"'><section class='webtoon-result-box'>"
		if(webtoonList.webtoonImage == 'default_image.png'){
			html += "<section class='webtoonImg'><img id='webtoonImage' src='${contextPath}/resources/img/webtoon/default_image.png' alt='선택된 이미지가 없습니다' /></section>"
		}else{
			html += "<section class='webtoonImg'><img id='webtoonImage' src='${contextPath}/thumbnail?webtoonImage="+webtoonList.webtoonImage+"' alt='썸네일이 존재' /></section>"
		}
		html += "<section class='webtoon-result-title'>"
		html += "<label>"+webtoonList.webtoonTitle+"</label><br>" 
		html += "<label class='small-font'>"+webtoonList.webtoonWriter+"</label><br>" 
		html += "</section></section></a>"
	});
	$("#platform_Change").html(html)
	total_list +=html;
	$("#nameKor").html(p_name);
	history.replaceState({list:total_list,kor_name:p_name,nowPlatform:nowPlatform, sortValue: sortValue},'', '${contextPath}/webtoon/platformWebtoon##');
	total_list="";
}

/* append */
function insertList(platformView){
	let html="";
	$.each(platformView,function(index,webtoonList){
		nowPlatform=webtoonList.platformName;
		p_name =webtoonList.platformNameKor;
		html += "<a href='${contextPath}/webtoon/webtooninfo?webtoonNum="+ webtoonList.webtoonNum+"'><section class='webtoon-result-box'>"
		if(webtoonList.webtoonImage == 'default_image.png'){
			html += "<section class='webtoonImg'><img id='webtoonImage' src='${contextPath}/resources/img/webtoon/default_image.png' alt='선택된 이미지가 없습니다' /></section>"
		}else{
			html += "<section class='webtoonImg'><img id='webtoonImage' src='${contextPath}/thumbnail?webtoonImage="+webtoonList.webtoonImage+"' alt='썸네일이 존재' /></section>"
		}
		html += "<section class='webtoon-result-title'>"
		html += "<label>"+webtoonList.webtoonTitle+"</label><br>" 
		html += "<label class='small-font'>"+webtoonList.webtoonWriter+"</label><br>" 
		html += "</section></section></a>"
	});
	$("#platform_Change").append(html)
}
</script>

<script type="text/javascript">/* 스크롤 감지 */
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
<body>
	<header>
		<c:import url="../default/header.jsp"/>
		<c:import url="../default/menu.jsp"/>
		
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
	
	<div style="padding-top: 70px;" class="container">
		<h2>플랫폼 별 웹툰</h2>
		<label id="nameKor">${platformView[0].platformNameKor }</label><!-- 플랫폼 명 뜸 -->
		<select name="webtoonSort" id="webtoonSort" onchange="sort_webtoon()" >
			<option value="nameAsc">제목 오름차순</option>
			<option value="nameDesc">제목 내림차순</option>
			<option value="viewCount">조회수 순</option>
			<option value="popularity">인기순</option>
		</select>
		<div class="webtoon-result" id="platform_Change">
			<c:forEach items="${platformView }" var="webtoonList">
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
						<label class="title-result">${webtoonList.webtoonTitle}</label><br>
						<label class="small-font">${webtoonList.webtoonWriter}</label><br>
					</section>
				</section>
			</c:forEach>
		</div>
	</div>
</body>
</html>