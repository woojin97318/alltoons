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

<header>
		<c:import url="./adminHeader.jsp">
			<c:param name="tag" value="작품 삭제"></c:param>
		</c:import>
</header>
	
<body>
	
	
	<div class="searchBar">
		<form action="${contextPath }/delete" method="POST">
			<input type="text" name="search" size="20" placeholder="검색어 입력" required >
			<input type="submit" value="검색">
		</form>
	</div>
	
	<c:if test="${search != null }">
		<label><b>" ${search } "</b>에 대한 검색 결과 입니다.</label><br>
	</c:if>
	<!-- 
	<button onclick="btnActive()">삭제</button>
	<button onclick="btnDisabled()">취소</button>
	<button id="delete_btn">테스트</button>
	 -->
	<hr>
	<div>
	<h2>제목명</h2>
		<table border="1">
			<tr class="table-top">
				<th>썸네일</th>
				<th>번호</th>
				<th>제목</th>
				<th>작가명</th>
				<th>삭제</th>
			</tr>
			<c:choose>
				<c:when test="${titleList == null }">
					<tr>
						<td colspan="5">데이터가 없습니다.</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach var="dto" items="${titleList }">
					<tr>
						<c:choose>
							<c:when test="${dto.webtoonImage eq 'default_image' || dto.webtoonImage eq 'default_image.png'||dto.webtoonImage eq 'default_image.jpg'}">
								<td><div class="webtoonImage"><img src="${contextPath }/resources/default_image.png"></div></td>
							</c:when>
							<c:otherwise>
								<td><div class="webtoonImage"><img src="${contextPath }/resources/img/webtoon_image/${dto.webtoonImage }"></div></td>
							</c:otherwise>
						</c:choose>
						
						<th>${dto.webtoonNum }</th>
						<td>${dto.webtoonTitle }</td>
						<td>${dto.webtoonWriter }</td>
						<th><input type="button" name="delete_btn" onclick="location.href='deleteWebtoon?webtoonNum=${dto.webtoonNum}&imageFileName=${dto.webtoonImage}'" class="x-box"></th>
					</tr>
				</c:forEach>
				</c:otherwise>
			</c:choose>
		</table>
		
		
		
		<h2>작가명</h2>
		<table border="1">
			<tr class="table-top">
				<th>썸네일</th>
				<th>번호</th>
				<th>제목</th>
				<th>작가명</th>
				<th>삭제</th>
			</tr>
			<c:choose>
				<c:when test="${writerList == null }">
					<tr>
						<td colspan="5">데이터가 없습니다.</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach var="dto" items="${writerList }">
					<tr>
						<c:choose>
							<c:when test="${dto.webtoonImage eq 'default_image' || dto.webtoonImage eq 'default_image.png'||dto.webtoonImage eq 'default_image.jpg'}">
								<td><div class="webtoonImage"><img src="${contextPath }/resources/default_image.png"></div></td>
							</c:when>
							<c:otherwise>
								<td><div class="webtoonImage"><img src="${contextPath }/resources/img/webtoon_image/${dto.webtoonImage }"></div></td>
							</c:otherwise>
						</c:choose>
						
						<th>${dto.webtoonNum }</th>
						<td>${dto.webtoonTitle }</td>
						<td>${dto.webtoonWriter }</td>
						<th><input type="button" name="delete_btn" onclick="location.href='deleteWebtoon?webtoonNum=${dto.webtoonNum}&imageFileName=${dto.webtoonImage}'" class="x-box"></th>
					</tr>
				</c:forEach>
				</c:otherwise>
			</c:choose>
		</table>
		
		
		
		<h2>전체</h2>
		<table border="1">
			<tr class="table-top">
				<th>썸네일</th>
				<th>번호</th>
				<th>제목</th>
				<th>작가명</th>
				<th>삭제</th>
			</tr>
			<c:choose>
				<c:when test="${webtoonAllList.size() == 0 }">
					<tr>
						<th colspan="5">저장 데이터가 없습니다.</th>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach var="dto" items="${webtoonAllList }">
					<tr>
						<c:choose>
							<c:when test="${dto.webtoonImage eq 'default_image' || dto.webtoonImage eq 'default_image.png'||dto.webtoonImage eq 'default_image.jpg'}">
								<th><div class="webtoonImage"><img src="${contextPath }/resources/default_image.png"></div></th>
							</c:when>
							<c:otherwise>
								<td><div class="webtoonImage"><img src="${contextPath }/resources/img/webtoon_image/${dto.webtoonImage }"></div></td>
							</c:otherwise>
						</c:choose>
						<th>${dto.webtoonNum }</th>
						<td>${dto.webtoonTitle }</td>
						<td>${dto.webtoonWriter }</td>
						<th><input type="button" name="delete_btn" onclick="location.href='deleteWebtoon?webtoonNum=${dto.webtoonNum}&imageFileName=${dto.webtoonImage}'" class="x-box"></th>
					</tr>
				</c:forEach>
				</c:otherwise>
			</c:choose>
		</table>
	</div>
</body>
</html>