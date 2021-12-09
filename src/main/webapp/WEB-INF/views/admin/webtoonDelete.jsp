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
.webtoonImage{
	max-width: 50px;
	overflow: hidden;
}
.webtoonImage > img {
	max-height: 50px;
	object-fit: cover;
	transform: translate(-15%, 0);
}
</style>

<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	function change() {
		const btnName = document.getElementById('select');
		const select = '선택';
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
</script>
<title>작품 삭제</title>
</head>
<body>
	<c:import url="./adminHeader.jsp" />
	
	<div class="searchBar">
		<form action="${contextPath }/delete" method="POST">
			<input type="text" name="search" size="20" placeholder="검색어 입력" required >
			<input type="submit" value="검색">
		</form>
	</div>
	검색어 >> ${search }<br>
	
	<div>
	<h1>제목명</h1>
		<table border="1">
			<tr>
				<th>썸네일</th>
				<th>식별번호</th>
				<th>제목</th>
				<th>작가명</th>
				<th>삭제</th>
			</tr>
			<c:choose>
				<c:when test="${titleList.size() == 0 }">
					<tr>
						<th colspan="5">저장 데이터가 없습니다.</th>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach var="dto" items="${titleList }">
					<tr>
						<td><div class="webtoonImage"><img src="https://shared-comic.pstatic.net/thumb/webtoon/783862/thumbnail/thumbnail_IMAG06_338076d7-ac93-4014-9613-60e8a82db8d4.jpg"></div>${dto.webtoonImage }</td>
						<td>${dto.webtoonNum }</td>
						<td>${dto.webtoonTitle }</td>
						<td>${dto.webtoonWriter }</td>
						<td><input type="button" onclick="location.href='deleteWebtoon?webtoonNum=${dto.webtoonNum}'" class="x-box"></td>
					</tr>
				</c:forEach>
				</c:otherwise>
			</c:choose>
		</table>
		
		<hr>
		
		<h1>작가명</h1>
		<table border="1">
			<tr>
				<th>썸네일</th>
				<th>식별번호</th>
				<th>제목</th>
				<th>작가명</th>
				<th>삭제</th>
			</tr>
			<c:choose>
				<c:when test="${writerList.size() == 0 }">
					<tr>
						<th colspan="5">저장 데이터가 없습니다.</th>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach var="dto" items="${writerList }">
					<tr>
						<td><div class="webtoonImage"><img src="${dto.webtoonImage }"></div></td>
						<td>${dto.webtoonNum }</td>
						<td>${dto.webtoonTitle }</td>
						<td>${dto.webtoonWriter }</td>
						<td><input type="button" onclick="location.href='deleteWebtoon?webtoonNum=${dto.webtoonNum}'" class="x-box"></td>
					</tr>
				</c:forEach>
				</c:otherwise>
			</c:choose>
		</table>
		
		<hr>
		
		<h1>전체</h1>
		<table border="1">
			<tr>
				<th>썸네일</th>
				<th>식별번호</th>
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
						<td><div class="webtoonImage"><img src="${dto.webtoonImage }"></div></td>
						<td>${dto.webtoonNum }</td>
						<td>${dto.webtoonTitle }</td>
						<td>${dto.webtoonWriter }</td>
						<td><input type="button" onclick="location.href='deleteWebtoon?webtoonNum=${dto.webtoonNum}'" class="x-box"></td>
					</tr>
				</c:forEach>
				</c:otherwise>
			</c:choose>
		</table>
	</div>
</body>
</html>