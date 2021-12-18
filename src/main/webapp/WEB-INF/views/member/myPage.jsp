<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<meta name="viewport"content="width=device-width, initial-scale=1.0, user-scalable=yes,maximum-scale=1.0, minimum-scale=1.0" />
</head>
<body>
	<div align="center">
		<h3>마이페이지</h3>
		<img src="${contextPath }/member/userImageView?file=${userInfo.userImage}"
			width="100px" height="100px"><br>
		<button type="button" onclick="location.href='${contextPath}/member/userImageModify'">
			프로필 사진 수정
		</button><br>
		이메일 : ${userInfo.userEmail }<br>
		<button type="button" onclick="location.href='${contextPath}/member/pwModify'">
			비밀번호 변경
		</button>
		<hr>
		<a href="${contextPath }/member/interest">관심 웹툰 ${interest }개</a><br>
		<a href="${contextPath }/member/favorites">즐겨찾기 웹툰 ${favorites }개</a><br>
		<a href="${contextPath }/member/myReview">내가 작성한 리뷰</a><br>
		<a href="${contextPath }/member/memberDelete">회원 탈퇴하기</a>
	</div>
</body>
</html>