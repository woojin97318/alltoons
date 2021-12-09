<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로필 사진 수정</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				$('#img').attr('src', e.target.result);
			}
			reader.readAsDataURL(input.files[0]);
		}
	}
</script>
</head>
<body>
	<div align="center">
		<h3>프로필 사진 수정</h3>
		<form action="${contextPath }/member/userImageModifyPage" method="post"
			enctype="multipart/form-data">
			<img id="img" src="#" alt="your image" width="100px" height="100px" /><br>
			<input type="hidden" name="userEmail" value="${userInfo.userEmail}">
			<input type="file" onchange="readURL(this);" name="file"><br>
			<input type="submit" value="수정하기">
		</form>
		<hr>
		프로필 사진 삭제 방법<br>
		이미지 선택을 하지 않은 상태에서 수정하기 버튼을 클릭
	</div>
</body>
</html>