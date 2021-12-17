<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=yes,maximum-scale=1.0, minimum-scale=1.0" />
<script type="text/javascript">
function genreChange(genre) {
	console.log(genre)
	$.ajax({
		url : "${contextPath}/webtoon/genreWebtoon",
		type : "POST",
		dataType : "json",
		data : {
			webtoonGenre : genre
		},
		success : function(platformView) {
			console.log(platformView);
			let html="";
			html += "<table border=1>";
			var i=0; var j=3;
			$.each(platformView,function(index,webtoonList){
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
			$("#platformChang").html(html)
		},error:function(request,status,error){
		    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);}
	})
};
</script>
</head>
<body>
	<header>
		<!-- 어드민 페이지 헤더 -->
		<c:import
			url="./header/webtoonHeader.jsp">
			<c:param name="tag" value="장르 별 웹툰"></c:param>
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
				</ul>
			</nav>
		</div>
	</header>
 <c:set var="i" value="0" />
 <c:set var="j" value="3" /><!-- 가로 n개씩 -->
 <div id="platformChang">
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