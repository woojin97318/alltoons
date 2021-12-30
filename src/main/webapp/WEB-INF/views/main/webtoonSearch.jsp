<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<c:set var="defaultImg" value='${contextPath }/resources/img/webtoon/default_image.png'/>
<c:set var="thumbnail" value='${contextPath }/thumbnail?webtoonImage='/>
<c:set var="webtooninfo" value='${contextPath }/webtoon/webtooninfo?webtoonNum='/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>작품 검색</title>

<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/adminStyle.css">
<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/mainStyle.css">

<script src="https://kit.fontawesome.com/cb838848a9.js" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">

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
				html += '<div class="webtoon-result">';

				$.each(webtoonList,function(index, list){
					if(!webtoonList){
						console.log('비어있음');
						html += '<label class="centered">데이터가 없습니다.</label>';
					}else{
						html += '<section class="webtoon-result-box" onclick="location.href='+'${webtooninfo}'+list.webtoonNum+'">';
							if(list.webtoonImage == 'default_image.png') {
								html += '<section class="webtoonImg"><img alt="썸네일X" src="${defaultImg}"></section>';
							}else{
								html += '<section class="webtoonImg"><img alt="썸네일O" src="${thumbnail}'+list.webtoonImage+'"></section>';
							}
							html += '<section class="webtoon-result-title">';
								html += '<label class="title-result">'+list.webtoonTitle+'</label><br>';
								html += '<label class="small-font">'+list.webtoonWriter+'</label><br>';
								html += '<label class="small-font">'+list.platformName+'</label>';
							html += '</section>';
						html += '</section>';
					}
				});

				html += '</div>';
				$("#changeList").html(html);
				console.log('ajax성공');
			},
			error:function(request,request,error){
				console.log('ajax실패');
				console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);}
		});
	};
</script>

<style type="text/css">
	@media all and (min-width:320px){ 
		.webtoon-result-box {
			float: left;
			margin: 10px;
			width: 120px;
			height: 150px;
			padding: 10px;
			cursor: pointer;
		}

		.webtoonImg img {
			width: 70px;
			height: 70px;
		}
	}

	.container {
    min-width: 320px;
		max-width: 768px;
		height: auto;
    margin: 20px auto;
    margin-top: 30px;
		background: white;
	}

	hr {
		height: 2px;
    border: 0 none;
    color: var(--grayL);
    background-color: var(--grayL);
		width: 95%;
		text-align: center;
	}

</style>
</head>

<body style="padding-top: 70px;">
	<header>
		<c:import url="../default/header.jsp"/>
	</header>
	<c:import url="../default/menu.jsp"/>

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
			<div id="changeList">
				<div class="webtoon-result">
					<c:choose>
						<c:when test="${titleList == null }">
								<label class="centered">데이터가 없습니다.</label> 
						</c:when>
						<c:otherwise>
							<c:forEach var="dto" items="${titleList }">
								<section class="webtoon-result-box" onclick="location.href='${webtooninfo}${dto.webtoonNum}'">
									<c:choose>
										<c:when test="${dto.webtoonImage eq 'default_image.png'}">
											<section class="webtoonImg"><img alt="썸네일X" src="${defaultImg}"></section>
										</c:when>
										<c:otherwise>
											<section class="webtoonImg"><img alt="썸네일O" src="${thumbnail}${dto.webtoonImage }"></section>
										</c:otherwise>
									</c:choose>
									<section class="webtoon-result-title">
										<label class="title-result pointer">${dto.webtoonTitle }</label><br>
										<label class="small-font pointer">${dto.webtoonWriter }</label><br>
										<label class="xsmall-font pointer">${dto.platformName }</label>
									</section>
								</section>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
		<span><i class="fad fa-comment-smile reverse blue"></i></span>
		<section class="center1">더 이상 데이터가 없습니다.</section>
		<a href="#top" class="center1"><button>top</button></a>
	</div>
	<footer>
		<c:import url="../default/footer.jsp"/>
	</footer>
</body>
</html>