<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<script type="text/javascript">
	function sendmail() {
		var userEmail = $("#emailText").val();
		var form = {
			email : userEmail
		}
		$.ajax({
			url : "sendmail", //"ajax",
			type : "GET",
			data : form,
			dataType : "json",
			contentType : "application/json; charset=utf-8",
			success : function(result) {
				$("#authTimer").text(result.email + "인증 타이머 시작")
				console.log("메일 전송 성공")
				alert('메일함을 확인해주세요')

			},
			error : function() {
				alert('메일 전송 실패')
			}
		})
	}
</script>
</head>
<body>
	<div align="center">
		<h3>비밀번호 찾기</h3>
		<div class="box email">
			<form action="findpassword">
				<label for="email">이메일</label> <input type="text" id="emailText"
					name="email" autofocus autocomplete="off" required />
				<button type="button" onclick="sendmail()" class="btn join">이메일
					전송</button>
			</form>
		</div>

	</div>
</body>
</html>