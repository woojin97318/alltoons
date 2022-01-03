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
<script type="text/javascript">
/* 무한스크롤 */
var start =101;
var limit=200;
function appendList(){
	console.log("스크롤 내려옴")
	console.log("스크롤 내려옴"+start)
	console.log("스크롤 내려옴"+limit)
	$.ajax({
		url : "${contextPath}/admin/webtoonDeletePaging",
		type : "POST",
		dataType : "json",
		data : {
			start: start, limit: limit
		},
		success : function(webtoonAllList) {
			console.log("성공")
			insertList(webtoonAllList);
			start = start +100
			limit = limit +100
			
		},error:function(request,status,error){
			console.log("실패")
		    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);}
	})
}
/* append */
function insertList(webtoonAllList){
	let html="";
	$.each(webtoonAllList,function(index,dto){
		//html += "<a href='${contextPath}/webtoon/webtooninfo?webtoonNum="+ dto.webtoonNum+"'><section class='webtoon-result-box'>"
		html += "<tr>"
		if(dto.webtoonImage == 'default_image.png'){
			html += "<td><div class='webtoonImage'><img src='${contextPath}/resources/img/webtoon/default_image.png' alt='선택된 이미지가 없습니다' /></div></td>"
		}else{
			html += "<td><div class='webtoonImage'><img src='${contextPath}/thumbnail?webtoonImage="+dto.webtoonImage+"' alt='썸네일이 존재' /></div></td>"
		}
		html += "<th><button onclick=\"location.href='${contextPath }/admin/webtoonModify?webtoonNum="+dto.webtoonNum+"'\">수정</button></th>"
		html += "<th>"+dto.webtoonNum+"</th>"
		html += "<td><a href='${contextPath }/webtoon/webtooninfo?webtoonNum="+dto.webtoonNum+"'>"+dto.webtoonTitle+"</a></td>"
		html += "<td>"+dto.webtoonWriter+"</td>"
		html += "<th><input type='button' name='delete_btn' onclick=\"location.href='${contextPath }/admin/deleteWebtoon?webtoonNum="+dto.webtoonNum+"&imageFileName="+dto.webtoonImage+"'\" class='x-box'></th>"
		html += "</tr>"
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
  const { clientHeight, scrollTop, scrollHeight } = e.target.scrollingElement
  if(clientHeight + scrollTop >= scrollHeight) {
  	appendList()
  	}
	}, 200));
</script>
<style type="text/css">
.webtoonImage{/*div에 주는 속성*/
	width: 50px;
	height: 50px;
	overflow: hidden;
}

.webtoonImage > img {/*div안에 img 속성*/
	max-width: 50px;
	object-fit: cover;
}

td {
	max-width: 100px;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
	text-align: center;
}
</style>

<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	var page = 1;
	
	function change() {
		const btnName = document.getElementById('select');
		const select = '삭제';
		const cancel = '취소';
		if (btnName.value == cancel) {
			btnName.value = select;
		} else {
			btnName.value = cancel;
		}
	}

	function on() {
		$().show();
	}

	function off() {
		$().hide();
	}

	function btnActive()  {
		const btn = document.getElementById('delete_btn');
		btn.disabled = false;
	}

	function btnDisabled()  {
		const btn = document.getElementById('delete_btn');
		btn.disabled = true;
	}
</script>
<title>작품 삭제</title>
</head>

<body>
	<header><!-- 어드민 페이지 헤더 -->
		<c:import url="./adminHeader.jsp">
			<c:param name="tag" value="웹툰 삭제"></c:param>
		</c:import><!-- value에 카테고리명을 넣어주세요 -->
	</header>

<div class="container">
	<div class="searchBar body">
		<form action="${contextPath }/admin/webtoonDelete" method="POST">
			<input type="text" name="search" size="20" placeholder="검색어 입력" required >
			<input type="submit" value="검색">
		</form>
	</div>
	
	<c:if test="${search != null }">
		<label><b>" ${search } "</b>에 대한 검색 결과 입니다.</label><br>
	</c:if>

	<hr>

	<h2>제목명</h2>
		<table border="1">
			<tr class="table-top">
				<th>썸네일</th>
				<th>수정</th>
				<th>번호</th>
				<th>제목</th>
				<th>작가명</th>
				<th>삭제</th>
			</tr>
			<c:choose>
				<c:when test="${titleList == null }">
					<tr>
						<td colspan="6">데이터가 없습니다.</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach var="dto" items="${titleList }">
					<tr>
						<!--웹툰 썸네일-->
						<c:choose>
							<c:when test="${dto.webtoonImage eq 'default_image.png'}">
								<th>
									<div class="webtoonImage">
										<img src="${contextPath }/resources/img/webtoon/default_image.png">
									</div>
								</th>
							</c:when>
							<c:otherwise>
								<td>
									<div class="webtoonImage">
										<img src="${contextPath }/thumbnail?webtoonImage=${dto.webtoonImage }">
									</div>
								</td>
							</c:otherwise>
						</c:choose>
						<!--수정버튼-->
						<th>
							<button onclick="location.href='${contextPath }/admin/webtoonModify?webtoonNum=${dto.webtoonNum}'">
								수정
							</button>
						</th>
						<!--식별번호-->
						<th>${dto.webtoonNum }</th>
						<!--제목-->
						<td>
							<a href="#" onclick="location.href='${contextPath }/webtoon/webtooninfo?webtoonNum=${dto.webtoonNum}'">
								${dto.webtoonTitle }
							</a>
						</td>
						<!--작가명-->
						<td>${dto.webtoonWriter }</td>
						<!--삭제버튼-->
						<th>
							<input type="button" name="delete_btn" onclick="location.href='${contextPath }/admin/deleteWebtoon?webtoonNum=${dto.webtoonNum}&imageFileName=${dto.webtoonImage}'" class="x-box">
						</th>
					</tr>
				</c:forEach>
				</c:otherwise>
			</c:choose>
		</table>
		
		<h2>작가명</h2>
		<table border="1">
			<tr class="table-top">
				<th>썸네일</th>
				<th>수정</th>
				<th>번호</th>
				<th>제목</th>
				<th>작가명</th>
				<th>삭제</th>
			</tr>
			<c:choose>
				<c:when test="${writerList == null }">
					<tr>
						<td colspan="6">데이터가 없습니다.</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach var="dto" items="${writerList }">
						<tr>
						<!--웹툰 썸네일-->
						<c:choose>
							<c:when test="${dto.webtoonImage eq 'default_image.png'}">
								<th>
									<div class="webtoonImage">
										<img src="${contextPath }/resources/img/webtoon/default_image.png">
									</div>
								</th>
							</c:when>
							<c:otherwise>
								<td>
									<div class="webtoonImage">
										<img src="${contextPath }/thumbnail?webtoonImage=${dto.webtoonImage }">
									</div>
								</td>
							</c:otherwise>
						</c:choose>
						<!--수정버튼-->
						<th>
							<button onclick="location.href='${contextPath }/admin/webtoonModify?webtoonNum=${dto.webtoonNum}'">
								수정
							</button>
						</th>
						<!--식별번호-->
						<th>${dto.webtoonNum }</th>
						<!--제목-->
						<td>
							<a href="#" onclick="location.href='${contextPath }/webtoon/webtooninfo?webtoonNum=${dto.webtoonNum}'">
								${dto.webtoonTitle }
							</a>
						</td>
						<!--작가명-->
						<td>${dto.webtoonWriter }</td>
						<!--삭제버튼-->
						<th>
							<input type="button" name="delete_btn" onclick="location.href='${contextPath }/admin/deleteWebtoon?webtoonNum=${dto.webtoonNum}&imageFileName=${dto.webtoonImage}'" class="x-box">
						</th>
					</tr>
				</c:forEach>
				</c:otherwise>
			</c:choose>
		</table>
		
		<h2>전체</h2>
		<table border="1" id="paging">
			<tr class="table-top">
				<th>썸네일</th>
				<th>수정</th>
				<th>번호</th>
				<th>제목</th>
				<th>작가명</th>
				<th>삭제</th>
			</tr>
			<c:choose>
				<c:when test="${webtoonAllList.size() == 0 }">
					<tr>
						<th colspan="6">저장 데이터가 없습니다.</th>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach var="dto" items="${webtoonAllList }">
					<tr>
						<!--웹툰 썸네일-->
						<c:choose>
							<c:when test="${dto.webtoonImage eq 'default_image.png'}">
								<th>
									<div class="webtoonImage">
										<img src="${contextPath }/resources/img/webtoon/default_image.png">
									</div>
								</th>
							</c:when>
							<c:otherwise>
								<td>
									<div class="webtoonImage">
										<img src="${contextPath }/thumbnail?webtoonImage=${dto.webtoonImage }">
									</div>
								</td>
							</c:otherwise>
						</c:choose>
						<!--수정버튼-->
						<th>
							<button onclick="location.href='${contextPath }/admin/webtoonModify?webtoonNum=${dto.webtoonNum}'">
								수정
							</button>
						</th>
						<!--식별번호-->
						<th>${dto.webtoonNum }</th>
						<!--제목-->
						<td>
							<a href="#" onclick="location.href='${contextPath }/webtoon/webtooninfo?webtoonNum=${dto.webtoonNum}'">
								${dto.webtoonTitle }
							</a>
						</td>
						<!--작가명-->
						<td>${dto.webtoonWriter }</td>
						<!--삭제버튼-->
						<th>
							<input type="button" name="delete_btn" onclick="location.href='${contextPath }/admin/deleteWebtoon?webtoonNum=${dto.webtoonNum}&imageFileName=${dto.webtoonImage}'" class="x-box">
						</th>
					</tr>
				</c:forEach>
				</c:otherwise>
			</c:choose>
		</table>
</div>
</body>
</html>