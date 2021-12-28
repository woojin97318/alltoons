<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>paging test</title>
</head>
<script type="text/javascript">
	function selChange() {
		var sel = document.getElementById('cntPerPage').value;
		location.href = "${contextPath}/pagingList?nowPage=${paging.nowPage}&cntPerPage="
				+ sel;
	}
</script>
<div id="outter">
	<div>
		<select id="cntPerPage" name=sel onchange="selChange()">
			<option value="5">
				<c:if test="${paging.cntPerPage == 5 }">selected</c:if>>5줄 보기
			</option>
			<option value="10">
				<c:if test="${paging.cntPerPage == 5 }">selected</c:if>>10줄 보기
			</option>
			<option value="15">
				<c:if test="${paging.cntPerPage == 5 }">selected</c:if>>15줄 보기
			</option>
			<option value="20">
				<c:if test="${paging.cntPerPage == 5 }">selected</c:if>>20줄 보기
			</option>
		</select>
	</div>
	<table border="1">
		<c:forEach items="${webtoonList }" var="webtoonList">
			<tr>
				<td><a
					href="${contextPath }/webtoon/webtooninfo?webtoonNum=${webtoonList.webtoonNum}">
						<c:choose>
							<c:when
								test="${webtoonList.webtoonImage=='default_image'||webtoonList.webtoonImage=='default_image.png' }">
								<img id="webtoonImage"
									src="resources/img/webtoon/default_image.png" width=200
									height=200 alt="선택된 이미지가 없습니다" />
							</c:when>
							<c:otherwise>
								<img id="webtoonImage"
									src="${contextPath }/thumbnail?webtoonImage=${webtoonList.webtoonImage}"
									width=200 height=200 alt="썸네일이 존재" />
							</c:otherwise>
						</c:choose> <br> <label>${webtoonList.webtoonTitle }</label><br> <label>${webtoonList.webtoonWriter }</label><br>
						<label>${webtoonList.platformName }</label> <c:if
							test="${webtoonList.platformNum != 0 }">
							<label> 외 ${webtoonList.platformNum }곳</label>
						</c:if>
				</a></td>
			</tr>
		</c:forEach>
	</table>
	<div style="display: block; text-align: center;">
		<c:if test="${paging.startPage != 1 }">
			<a
				href="${contextPath }/pagingList?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
		</c:if>
		<c:forEach begin="${paging.startPage }" end="${paging.endPage }"
			var="p">
			<c:choose>
				<c:when test="${p == paging.nowPage }">
					<b>${p }</b>
				</c:when>
				<c:when test="${p != paging.nowPage }">
					<a href="${contextPath }/pagingList?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
				</c:when>
			</c:choose>
		</c:forEach>
		<c:if test="${paging.endPage != paging.lastPage }">
		<a href = "${contextPath }/pagingList?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
		</c:if>
	</div>
</div>

<body>

</body>
</html>