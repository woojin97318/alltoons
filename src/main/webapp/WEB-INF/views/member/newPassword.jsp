<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=yes,maximum-scale=1.0, minimum-scale=1.0" />
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<script type="text/javascript">
	function passwordChk() {
		var reg = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;
		var userPw = $("#newUserPw").val();
		var chkPw = $("#newUserPwChk").val();
		var modify = document.modify;
		if (chkPw == userPw) {
			if (false === reg.test(userPw)) {
				console.log(userPw);
				alert('비밀번호는 8자 이상이어야 하며, 숫자/대문자/소문자/특수문자를 모두 포함해야 합니다.');
			} else {
				alert('비밀번호 변경 성공')
				modify.submit();
			}

		} else {
			console.log(userPw);
			console.log(chkPw);
			
			alert('비밀번호가 일치하지 않습니다');
		}
	}
</script>
</head>
<body>
	<div align="center">
		<h3>비밀번호 변경</h3>
		<form name="modify" action="newPasswordChk" method="post">
			새 비밀번호<br> <input type="password" name="newUserPw"
				id="newUserPw" placeholder="새 비밀번호"><br> 새 비밀번호 확인<br>
			<input type="password" name="newUserPwChk" id="newUserPwChk"
				placeholder="새 비밀번호 확인"><br> <input type="button"
				onclick="passwordChk()" value="비밀번호 변경하기">
		</form>
	</div>
</body>
</html>