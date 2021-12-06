<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function signup(){
		
	}
</script>
</head>
<body>
	<c:import url="${contextPath }/defualt/header" />
	<div align="center">
		<form id="signUp" action="signUp" method="post">

			<table>
				<tr>
					<th>아이디*</th>
					<td><input type="text" id="inputId" placeholder="ID를 입력해주세요"></td>
					<td><input type="button" id="idChk" value="중복 확인"></td>
				</tr>
				<tr>
					<td>ID는 한 번 가입하며 변경이 불가능합니다.</td>
				</tr>

				<tr>
					<th>닉네임*</th>
					<td><input type="text" id="inputNick" placeholder="내용을 입력해주세요"></td>
					<td><input type="button" id="nickChk" value="중복 확인"></td>
				</tr>
				<tr>
					<th colspan="3">비밀번호*</th>
					<td><input type="text" id="inputPwd" placeholder="비밀번호"></td>
					<td><input type="text" id="chkPwd" placeholder="비밀번호 확인"></td>
					<td>8자 이상 입력해주세요.</td>
				</tr>
				<tr>
					<th colspan="2">이메일*</th>
					<td><input type="text" id="email" placeholder="이메일을 입력해주세요">
				</tr>
				<tr>
					<td><input type="button" onclick="emailAuth()" value="이메일 인증하기"></td>
				</tr>
				<tr>
					<td>*는 반드시 입력해야 하는 정보입니다.</td>
				</tr>
				<tr>
					<td rowspan="3"><input type="submit" onclick="signup()"
						value="가입하기"></td>
				</tr>
			</table>
		</form>

	</div>
	<c:import url="${contextPath }/defualt/header" />

</body>
</html>