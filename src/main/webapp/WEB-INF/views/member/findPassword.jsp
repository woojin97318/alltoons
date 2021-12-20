<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=yes,maximum-scale=1.0, minimum-scale=1.0" />
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	function sendmail() {
		var userEmail = $("#userEmail").val();
		var chkForm = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
		var form = {
			email : userEmail
		}
		if (false === chkForm.test(userEmail)) {
			alert('이메일 형식이 아닙니다!')
		} else {

			$.ajax({
				url : "userfindchk",
				data : form,
				dataType : "json",
				contentType : "application/json; charset=utf-8",
				success : function(result) {
					console.log(result);
					if (result == false) {
						alert('존재하지 않는 이메일입니다.');
					} else {
						$.ajax({
							url : "findpwdmail", //"ajax",
							type : "GET",
							data : form,
							dataType : "json",
							contentType : "application/json; charset=utf-8",
							success : function(result01) {
								console.log(userEmail)
								console.log("메일 전송 성공")
								alert('메일로 임시비밀번호가 전송 되었습니다.')
								location.href = "${contextPath}/member/login"
							},
							error : function() {
								alert('메일 전송 실패')
							}
						})
					}
				},
				error : function() {
					alert('서버 에러');
				}
			})

		}
	}
</script>
</head>
<body>
	<div align="center">
		<h3>비밀번호 찾기</h3>
		<div class="box email">
			<form action="findpassword">
				<label>이메일</label> <input type="text" id="userEmail"
					name="userEmail" autofocus autocomplete="off" required />
				<button type="button" onclick="sendmail()">이메일 전송</button>
			</form>
		</div>

	</div>
</body>
</html>