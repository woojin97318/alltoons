<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로필 사진 수정</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=yes,maximum-scale=1.0, minimum-scale=1.0" />
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	function readURL(input) {
		var file = input.files[0]
		console.log(file)
		if (file != '') {
			var reader = new FileReader();
			reader.readAsDataURL(file);
			reader.onload = function(e) {
				$('#userImage').attr('src', e.target.result);
			}
		}
	}
</script>
</head>
<body>
	<div align="center">
		<h3>프로필 사진 수정</h3>
		<form action="${contextPath }/member/userImageModifyPage" method="post"
			enctype="multipart/form-data">
			<img id="userImage" width="100px" height="100px"
				src="${contextPath }/member/userImageView?file=${userInfo.userImage}"/><br>
			<input type="hidden" name="userEmail" value="${userInfo.userEmail}">
			<input type="file" onchange="readURL(this);" name="file"><br>
			<button type="button" onclick="location.href='${contextPath}/member/userImageDefault?userEmail=${userInfo.userEmail }'">
				기본 이미지로 변경
			</button><br>
			<input type="submit" value="수정하기">
		</form>
	</div>
</body>
</html>