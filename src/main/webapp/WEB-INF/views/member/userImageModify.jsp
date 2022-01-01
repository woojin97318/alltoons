<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=yes,maximum-scale=1.0, minimum-scale=1.0" />
<title>프로필 사진 수정</title>
<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/mainStyle.css">
<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/fontStyle.css">
<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/btnStyle.css">
<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/img_or_webtoon_Style.css">
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
<style type="text/css">
	.mypage-profil {
		width: 100px;
		height: 100px;
		margin: 5px;
	}

	.input-file-btn {
		padding: 5px 25px;
		background-color: var(--skyblue);
		border-radius: 30px;
		color: white;
		cursor: pointer;
		margin-bottom: 50px;
	}

	.input-file-btn:hover {
		background-color: var(--skyblueD);
	}

	.gray-btn {
		position: relative;
		top: 80px;
	}
</style>
</head>
<body>
	<header>
		<div class="head">
			<h1 align="center" style="position:relative; top:5px;">마이페이지</h1>
		</div>
	</header>
	<c:import url="../default/menu.jsp"/>
	<div align="center" class="mypage-container">
		<h2>프로필 이미지 수정</h2>
		<form action="${contextPath }/member/userImageModifyPage" method="post" enctype="multipart/form-data">
			<section>
				<img class="mypage-profil" id="userImage"
					src="${contextPath }/member/userImageView?file=${userInfo.userImage}"/><br>
				<span style="display: block;">
					<label class="input-file-btn" for="file">사진 선택</label>
				</span><br>
			</section>
			
			<input type="hidden" name="userEmail" value="${userInfo.userEmail}">
			<input type="file" id="file" name="file" class="hidden" onchange="readURL(this);">
			<button onclick="location.href='${contextPath}/member/userImageDefault?userEmail=${userInfo.userEmail }'">
				기본 이미지로 변경
			</button><br>
			<button class="gray-btn" type="submit" value="수정 완료"><b>수정 완료</b></button>
			
		</form>
	</div>
</body>
</html>