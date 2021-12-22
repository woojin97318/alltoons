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
				$('#platformChange').html(data.list); 
				$('#nameKor').html(data.kor_name); 
				nowGenre=data.nowGenre;
		}
	}
});
</script>
<script type="text/javascript">
var total_list =""; 
nowGenre=null;
function genreChange(genre) {
	var sort = document.getElementById("webtoonSort");
	var sortValue = sort.options[sort.selectedIndex].value;
	console.log(genre)
	$.ajax({
		url : "${contextPath}/webtoon/genreSort",
		type : "POST",
		dataType : "json",
		data : {
			webtoonGenre : genre,sort: sortValue
		},
		success : function(genreView) {
			nowGenre=genre;
			console.log(genreView);
			insertGenre(genreView);
		},error:function(request,status,error){
		    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);}
	})
};
function insertGenre(genreView){
	let html="";
	let g_name=null;
	html += "<table border=1>";
	var i=0; var j=3;
	$.each(genreView,function(index,webtoonList){
		g_name=webtoonList.webtoonGenreKor
		nowGenre=webtoonList.webtoonGenre
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
		html += "<label>"+webtoonList.webtoonWriter+"</label>	</a></td>"
		if(i%j == j-1){
			html += "</tr>"	
		}
		i += 1;
	});html += "</table>"
	$("#platformChange").html(html);
	total_list +=html;
	$("#nameKor").html(g_name); 
	history.replaceState({list:total_list,kor_name: g_name,nowGenre:nowGenre},'', '${contextPath}/webtoon/genreWebtoon##');
	total_list="";
}
</script>
<script type="text/javascript">/* 정렬ajax */
function sort(){
	var sort = document.getElementById("webtoonSort");
	var sortValue = sort.options[sort.selectedIndex].value;
	if(nowGenre == null){
		nowGenre="g1";
	}
	$.ajax({
		url: "${contextPath}/webtoon/genreSort",
		type: "POST",
		data: {sort: sortValue, webtoonGenre: nowGenre},
		success : function(genreView){
			insertGenre(genreView);
		},
		error:function(request,status,error){
		    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		    }
			
	})  
}
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
					<li><button	class="listBtn" onclick="genreChange('g9')">순정</button></li>
					<li><button	class="listBtn" onclick="genreChange('g10')">감성</button></li>
					<li><button	class="listBtn" onclick="genreChange('g11')">스릴러</button></li>
					<li><button	class="listBtn" onclick="genreChange('g12')">시대극</button></li>
					<li><button	class="listBtn" onclick="genreChange('g13')">스포츠</button></li>
					<li><button	class="listBtn" onclick="genreChange('g14')">로맨스</button></li>
					<li><button	class="listBtn" onclick="genreChange('g15')">무협</button></li>
					<li><button	class="listBtn" onclick="genreChange('g16')">소년</button></li>
				</ul>
			</nav>
		</div>
	</header>
	<label id="nameKor">${genreView[0].webtoonGenreKor }</label><!-- 장르 명 뜸 -->
	<select name="webtoonSort" id="webtoonSort" onchange="sort()" >
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
	</div>
</div>
</body>
</html>