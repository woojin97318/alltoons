<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AllToons genre</title>
<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/sort_nameStyle.css">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=yes,maximum-scale=1.0, minimum-scale=1.0" />
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
		if(location.hash){ 
			var data = history.state; 
			if(data){ 
				$('#platform_Change').html(data.list); 
				$('#nameKor').html(data.kor_name); 
				nowGenre=data.nowGenre;
				sortValue=data.sortValue;
				$("#webtoonSort").val(sortValue).attr("selected","selected")
				window.scrollTo({top:0, left:0, behavior:'auto'});
		}
	}
});
</script>
<script type="text/javascript">
var total_list =""; 
var nowGenre=null;
/* 장르선택 */
function genreChange(genre) {
	window.scrollTo({top:0, left:0, behavior:'auto'});
	var sort = document.getElementById("webtoonSort");
	var sortValue = sort.options[sort.selectedIndex].value;
	console.log(genre)
	start = 1;
	limit = 15;
	$.ajax({
		url : "${contextPath}/webtoon/genre_Sort",
		type : "POST",
		dataType : "json",
		data : {
			webtoonGenre : genre,sort: sortValue
		},
		success : function(genreView) {
			nowGenre=genre;
			console.log(genreView);
			insertGenre(genreView);
			start +=15
			limit +=15
		},error:function(request,status,error){
		    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);}
	})
};

/* 정렬ajax */
 function sort_webtoon(){
	 window.scrollTo({top:0, left:0, behavior:'auto'});
	start = 1;
	limit = 15;
	sort = document.getElementById("webtoonSort");
	sortValue = sort.options[sort.selectedIndex].value;
	console.log("현 장르 위치"+nowGenre)
	console.log("현 정렬 위치"+sortValue)
	if(nowGenre == null){
		nowGenre="g1";
	}
	$.ajax({
		url: "${contextPath}/webtoon/genre_Sort",
		type: "POST",
		data: {sort: sortValue, webtoonGenre: nowGenre,
			start: start, limit: limit},
		success : function(genreView){
			insertGenre(genreView);
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
		if(nowGenre == null){
			nowGenre="g1";
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
		console.log("스크롤 내려옴"+sortValue)
		$.ajax({
			url : "${contextPath}/webtoon/genre_Sort",
			type : "POST",
			dataType : "json",
			data : {
				webtoonGenre : nowGenre, sort: sortValue, 
				start: start, limit: limit
			},
			success : function(genreView) {
				if(genreView.size ==15)console.log("15개는 아님")
				console.log("성공")
				insertList(genreView);
				start = start +15
				limit = limit +15
				
			},error:function(request,status,error){
				console.log("실패")
			    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);}
		})
	}
</script>
<script type="text/javascript">
/* http출력문 */
function insertGenre(genreView){
	let html="";
	let g_name=null;
	$.each(genreView,function(index,webtoonList){
		g_name=webtoonList.webtoonGenreKor
		nowGenre=webtoonList.webtoonGenre
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
	$("#platform_Change").html(html);
	total_list +=html;
	$("#nameKor").html(g_name); 
	console.log("장르이름"+g_name)
	history.replaceState({list:total_list,kor_name: g_name,nowGenre:nowGenre,sortValue: sortValue},'', '${contextPath}/webtoon/genreWebtoon##');
	total_list="";
}
/* append */
function insertList(genreView){
	let html="";
	var i=0; var j=3;
	$.each(genreView,function(index,webtoonList){
		nowGenre=webtoonList.webtoonGenre;
		g_name=webtoonList.webtoonGenreKor
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
	<c:import url="../default/moveTopBtn.jsp"/>
	<header>
		<c:import url="../default/header.jsp"/>
		<c:import url="../default/menu.jsp"/>
		<c:import url="./header/webtoonHeader.jsp">
			<c:param name="tag" value="장르 별 웹툰"/>
		</c:import>
		<div class="scrollBtn">
			<nav>
				<ul>
					<li><button	class="listBtn" onclick="genreChange('g1')">에피소드</button></li>
					<li><button	class="listBtn" onclick="genreChange('g2')">옴니버스</button></li>
					<li><button	class="listBtn" onclick="genreChange('g3')">스토리</button></li>
					<li><button	class="listBtn" onclick="genreChange('g4')">일상</button></li>
					<li><button	class="listBtn" onclick="genreChange('g5')">개그</button></li>
					<li><button	class="listBtn" onclick="genreChange('g6')">판타지</button></li>
					<li><button	class="listBtn" onclick="genreChange('g7')">액션</button></li>
					<li><button	class="listBtn" onclick="genreChange('g8')">드라마</button></li>
					<!-- <li><button	class="listBtn" onclick="genreChange('g9')">순정</button></li> -->
					<li><button	class="listBtn" onclick="genreChange('g10')">감성</button></li>
					<li><button	class="listBtn" onclick="genreChange('g11')">스릴러</button></li>
					<li><button	class="listBtn" onclick="genreChange('g12')">시대극</button></li>
					<li><button	class="listBtn" onclick="genreChange('g13')">스포츠</button></li>
					<li><button	class="listBtn" onclick="genreChange('g14')">로맨스</button></li>
					<li><button	class="listBtn" onclick="genreChange('g15')">무협</button></li>
					<li><button	class="listBtn" onclick="genreChange('g16')">소년</button></li>
					<li><button	class="listBtn" onclick="genreChange('g17')">BL</button></li>
					<li><button	class="listBtn" onclick="genreChange('g18')">백합</button></li>
					<li><button	class="listBtn" onclick="genreChange('g19')">미스터리</button></li>
					<li><button	class="listBtn" onclick="genreChange('g20')">학원</button></li>
				</ul>
			</nav>
		</div>
	</header>
	
	<div style="padding-top: 70px;" class="container">
		<h2>플랫폼 별 웹툰</h2>
		<label id="nameKor">${genreView[0].webtoonGenreKor }</label><!-- 플랫폼 명 뜸 -->
		<select name="webtoonSort" id="webtoonSort" onchange="sort_webtoon()" >
			<option value="nameAsc">제목 오름차순</option>
			<option value="nameDesc">제목 내림차순</option>
			<option value="viewCount">조회수 순</option>
			<option value="popularity">인기순</option>
		</select>
		<div class="webtoon-result" id="platform_Change">
			<c:forEach items="${genreView }" var="webtoonList">
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
	
	<%-- 
	<label id="nameKor">${genreView[0].webtoonGenreKor }</label><!-- 장르 명 뜸 -->
	<select name="webtoonSort" id="webtoonSort" onchange="sort_webtoon()" >
		<option value="nameAsc">제목 오름차순</option>
		<option value="nameDesc">제목 내림차순</option>
		<option value="viewCount">조회수 순</option>
		<option value="popularity">인기순</option>
	</select>
	
 <c:set var="i" value="0" />
 <c:set var="j" value="3" /><!-- 가로 n개씩 -->
 <div id="platformChange">
		<table border=1>
			<c:forEach items="${genreView }" var="webtoonList">
				<c:if test="{i%j == 0}">
					<tr>
				</c:if>
				<td><a
					href="${contextPath}/webtoon/webtooninfo?webtoonNum=${webtoonList.webtoonNum}">
						<c:choose>
							<c:when
								test="${webtoonList.webtoonImage=='default_image'||webtoonList.webtoonImage=='default_image.png'}">
								<img id="webtoonImage"
									src="${contextPath }/webtoon/resources/img/webtoon/default_image.png"
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
	</div> --%>
</div>
</body>
</html>