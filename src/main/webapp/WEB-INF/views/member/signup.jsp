<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 페이지</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body>
	<div align="center">
		<form action="signupform" method="post">
			<table>
				<tr>
					<td>이미지</td>
					<td><input type="text" name="userImage"></td>
				</tr>

				<tr>
					<td>이메일*</td>
					<td><input type="text" name="userEmail"
						placeholder="이메일을 입력해주세요"></td>
				</tr>
				<tr>
					<td>비밀번호*</td>
					<td><input type="password" name="userPassword"
						placeholder="비밀번호"></td>
				</tr>
				<tr>
					<td><input type="submit" value="가입하기"></td>
				</tr>

			</table>
		</form>

	</div>

</body>
</html>