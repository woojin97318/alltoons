<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/adminStyle.css">
<!-- 
<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/mainStyle.css">
 -->
<style type="text/css">
</style>

<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	var page = 1;
	var btn = [{name : '제목명', value:'titleList'},{name : '작가명', value:'writerList'}];
	$.each(btn, function(index, el){
		console.log('el:', index, el);
		console.log('name:', el.name,'/value:',el.value);
	});
	
	function searchResult(view, name, search){
		search = search.trim();
		console.log(view);
		$("#result").html(name);
		$.ajax({
			url : '${contextPath}/main/webtoonSearch/result?search='+search+'&view='+view,
			type : "POST",
			dataType : "json",
			success : function(webtoonList) {
					console.log(webtoonList);
					let html="";
					html +='<div id="changeList">'
					+'<table border="1">'
					+'<tr class="table-top">'
					+'<th>썸네일</th>'
					+'<th>장르</th>'
					+'<th>제목</th>'
					+'<th>작가명</th>'
					+'<th>플랫폼</th>'
					+'</tr>';
					$.each(webtoonList,function(index, list){
					if(!webtoonList){
						console.log('비어있음');
						html += '<tr><td colspan="5">데이터가 없습니다.</td></tr>';
					}else{
						html += '<tr>';
						if(list.webtoonImage == 'default_image.png'){
							html += '<td><div class="webtoonImage"><img src="${defaultImg}"></div></td>';
						}else{
							html += '<td><div class="webtoonImage"><img src="${thumbnail}'+list.webtoonImage+'"></div></td>';
						}
						html += '<td>'+list.webtoonGenre+'</td>';
						html += '<th><a href="#" onclick="location.href='+'${webtooninfo}'+list.webtoonNum+'">'
									+list.webtoonTitle+'</a></th>';
						html += '<td>'+list.webtoonWriter+'</td>';
						html += '<td class="platform">'+list.platformName+'</td>';
						html += '</tr>';
					}
				});
				$("#changeList").html(html);
				console.log('ajax성공');
			},
			error:function(request,request,error){
				console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);}
		});
	};
</script>
<style>
	.centered {
		position: absolute;
		left: 50%; 
		transform: translateX(-50%);
	}
	hr {
		height : 1px;
		border: 0;
	}
	.container {
    min-width: 320px;
		max-width: 768px;
		height: auto;
    margin: 20px auto;
    margin-top: 30px;
    background-color: lightblue;
	}
	.webtoon-result {
		z-index: 1;
	}
	.webtoon-result-box {
		float: left;
		margin: 10px;
		width: 150px;
		height: 200px;
		padding: 15px;
		cursor: pointer;
		background-color: aqua;
	}
	.webtoonImg {
		padding: auto;
	}
	.webtoonImg img {
		width: 100px;
		height: 100px;
	}
	.title-result {
		font-size: 20px;
	}
	.small-font {
		font-size: 15px;
	}
</style>
<title>작품 검색</title>
</head>
	<header>
		<c:import url="../default/menu.jsp"/>
		<c:import url="../default/header.jsp"/>
	</header>
	<c:import url="../default/moveTopBtn.jsp"/>

<c:set var="defaultImg" value='${contextPath }/resources/img/webtoon/default_image.png'/>
<c:set var="thumbnail" value='${contextPath }/thumbnail?webtoonImage='/>
<c:set var="webtooninfo" value='${contextPath }/webtoon/webtooninfo?webtoonNum='/>

<body style="padding-top: 70px;">
<div class="container">
	<div class="scrollBtn">
		<nav>
			<ul>
				<li><button class="listBtn" id="title" onclick="searchResult('titleList', '제목명','${search }')">제목</button></li>
				<li><button class="listBtn" id="writer" onclick="searchResult('writerList','작가명','${search }')">작가</button></li>
			</ul>
		</nav>
	</div>
	<input id="top" type="hidden" value="top">

	<c:if test="${search != null }">
		<label><b>" ${search } "</b>에 대한 검색 결과 입니다.</label><br>
	</c:if>
	
	<hr>
	
	<div>
	<h2 id="result">제목명</h2>
	<!--
		<div class="centered webtoon-result">
			<c:choose>
				<c:when test="${titleList == null }">
						<label class="centered">데이터가 없습니다.</label> 
				</c:when>
				<c:otherwise>
					<c:forEach var="dto" items="${titleList }">
						<section class="webtoon-result-box" onclick="location.href='${webtooninfo}${dto.webtoonNum}'">
							<c:choose>
								<c:when test="${dto.webtoonImage eq 'default_image.png'}">
									<section class="webtoonImg"><img src="${defaultImg}"></section>
								</c:when>
								<c:otherwise>
									<section class="webtoonImg"><img src="${thumbnail}${dto.webtoonImage }"></section>
								</c:otherwise>
							</c:choose>
							<section>
								<label class="title-result">${dto.webtoonTitle }</label><br>
								<label class="small-font">${dto.webtoonWriter }</label><br>
								<label class="small-font">${dto.platformName }</label>
							</section>
						</section>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</div>
	-->
		<div id="changeList">
		<table border="1">
			<tr class="table-top">
				<th>썸네일</th>
				<th>장르</th>
				<th>제목</th>
				<th>작가명</th>
				<th>플랫폼</th>
			</tr>
			<c:choose>
				<c:when test="${titleList == null }">
						<tr><td colspan="5">데이터가 없습니다.</td></tr>
				</c:when>
				<c:otherwise>
					<c:forEach var="dto" items="${titleList }">
					<tr>
						<c:choose>
							<c:when test="${dto.webtoonImage eq 'default_image.png'}">
								<th><div class="webtoonImage"><img src="${defaultImg}"></div></th>
							</c:when>
							<c:otherwise>
								<td><div class="webtoonImage"><img src="${thumbnail}${dto.webtoonImage }"></div></td>
							</c:otherwise>
						</c:choose>
						<td>${dto.webtoonGenre }</td>
						<th><a href="#" onclick="location.href='${webtooninfo}${dto.webtoonNum}'">${dto.webtoonTitle }</a></th>
						<td>${dto.webtoonWriter }</td>
						<td class="platform">${dto.platformName }</td>
					</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</div>
		</table>
	</div>
	
	<section class="center1">더 이상 데이터가 없습니다.</section>
	<a href="#top" class="center1"><button>top</button></a>
</div>
</body>
</html>