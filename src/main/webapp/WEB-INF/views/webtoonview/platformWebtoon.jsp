<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=yes,maximum-scale=1.0, minimum-scale=1.0" />
<script type="text/javascript">
	nowPlatform="naver";//플랫폼 버튼 미선택시
	/* 플랫폼 선택시 ajax로 데이터변경 *//* 플랫폼 선택시 결과물을 받아오는 메소드 */
	function platformChange(platform) {
		var sort = document.getElementById("webtoonSort");
		var sortValue = sort.options[sort.selectedIndex].value;
		console.log(sortValue)
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
	function insertPlatform(platformView){
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
	}
	
</script>
<script type="text/javascript">/* 정렬ajax *//* 지속유지필요 */
function sort(){
	var sort = document.getElementById("webtoonSort");
	var sortValue = sort.options[sort.selectedIndex].value;
	console.log(nowPlatform)
	console.log(sortValue)
	if(nowPlatform == null){
		nowPlatform="naver";
	}
	console.log(nowPlatform);
	$.ajax({
		url: "${contextPath}/webtoon/sort",
		type: "POST",
		data: {sort: sortValue, platformName: nowPlatform},
		success : function(platformView){
			insertPlatform(platformView);
		},
		error:function(request,status,error){
		    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		    }
			
	})  
}
</script>
</head>
<body>
	<header>
		<!-- 어드민 페이지 헤더 -->
		<c:import url="./header/webtoonHeader.jsp">
			<c:param name="tag" value="플랫폼 별 웹툰"></c:param>
		</c:import>
		<div class="scrollBtn">
			<nav>
				<ul>
					<li><button class="listBtn" onclick="platformChange('naver')">네이버</button>	</li>
					<li><button class="listBtn" onclick="platformChange('kakaoWebtoon')">카카오웹툰</button></li>
					<li><button class="listBtn" onclick="platformChange('kakaoPage')">카카오페이지</button>	</li>
					<li><button class="listBtn" onclick="platformChange('bomtoon')">봄툰</button>	</li>
					<li><button class="listBtn" onclick="platformChange('lezhin')">레진코믹스</button></li>
					<li><button class="listBtn" onclick="platformChange('toptoon')">탑툰</button>	</li>
					<li><button class="listBtn" onclick="platformChange('mrblue')">미스터블루</button>	</li>
					<li><button class="listBtn" onclick="platformChange('ridibooks')">리디북스</button></li>
				</ul>
			</nav>
		</div>
	</header>
	
	<select name="webtoonSort" id="webtoonSort" onchange="sort()" >
		<option value="nameAsc">제목 오름차순</option>
		<option value="nameDesc">제목 내림차순</option>
		<option value="views">조회수 순</option>
		<option value="popularity">인기순</option>
	</select>
	
	<c:set var="i" value="0" />
	<c:set var="j" value="3" />
	<!-- 가로 n개씩 -->
	<div id="platformChang">
		<table border=1>
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