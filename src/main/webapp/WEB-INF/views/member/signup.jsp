<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 페이지</title>
<script type="text/javascript">
function emailAuth(){
	location.href = ${contextPath}/sendMail
}

function chkSignUp(){
	if($("#email")== null){
		console.log("#email")
		alert('이메일을 입력해주세요')
	}
}
</script>
</head>
<body>
	<c:import url="${contextPath }/defualt/header" />
	<div align="center">
		<form id="signupform" action="signUp" method="post">

			<table>
				<tr>
					<th rowspan="2">이메일*</th>
					<td><input type="text" id="email" placeholder="이메일을 입력해주세요">
				</tr>
				<tr>
					<td><input type="button" onclick="emailAuth()"
						value="이메일 인증하기"><label>인증 타이머</label></td>
				</tr>

				<tr>
					<th rowspan="3">비밀번호*</th>
				</tr>
				<tr>
					<td><input type="text" id="inputPwd" placeholder="비밀번호"></td>
				</tr>
				<tr>
					<td><input type="text" id="chkPwd" placeholder="비밀번호 확인"></td>
				</tr>
				<tr>
					<td></td>
					<td>8자 이상 입력해주세요.</td>
				</tr>
				<tr>
					<td></td>

					<td>*는 반드시 입력해야 하는 정보입니다.</td>
				</tr>
				<tr>
					<td colspan="3"><input type="submit" onclick="chkSignUp()"
						value="가입하기"></td>
				</tr>
			</table>
		</form>

	</div>
	<c:import url="${contextPath }/defualt/header" />

</body>
</html>