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

<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	function back(){ 
		IF( document.referrer ){
			location.href = document.referrer;
		}
	};
</script>

<title>admin header</title>

</head>
<body>
	<div class="menu-title">
		<c:out value="${param.tag }"></c:out>
	</div>
	
	<button id="backBtn" onclick="back()" type="button"></button><br>
	<div class="scrollBtn">
		<nav>
			<ul>
				<li><a href="${contextPath}/admin/report"><button class="listBtn">
				신고 확인</button></a></li>
				<li><a href="${contextPath}/admin/webtoonUpload"><button class="listBtn">
				작품 업로드</button></a></li>
				<li><a href="${contextPath}/admin/webtoonDelete"><button class="listBtn">
				작품 수정 및 삭제</button></a></li>
			</ul>
		</nav>
	</div>
	<a href="${contextPath}/main"><input type="button" class="mainBtn"></a>
</body>
</html>