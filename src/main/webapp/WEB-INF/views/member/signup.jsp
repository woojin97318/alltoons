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
<script type="text/javascript">
	function sendmail() {
		$.ajax({
			url : "sendmail", //"ajax",
			type : "GET",
			success : function(data) {
				$("#emailText").text(data)
				console.log("메일 전송 성공")
			},
			error : function() {
				alert('통신 실패')
			}
		})
	}
	//
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
		<form action="signupform" method="post" enctype="multipart/form-data">
			<table>
				<tr>
					<td colspan="2"><img id="img" src="#" alt="your image"
						width="100px" height="100px" /></td>
				</tr>
				<tr>
					<td>이미지</td>
					<td><input type="file" onchange="readURL(this);" name="file"></td>
				</tr>
				<tr>
					<td>이메일*</td>
					<td><input type="text" id="emailText" name="userEmail"
						placeholder="이메일을 입력해주세요"></td>
				</tr>
				<tr>
					<td></td>
					<td>
						<button type="button" id="emailCheck" onclick="sendmail()">인증번호
							받기</button>
					</td>
				</tr>
				<tr>
					<td colspan="2">인증번호 <input type="text"
						id="certificationNumber">
						<button id="certificationBtn" onclick="">인증하기</button>
					</td>
				</tr>
				<tr>
					<td>
						<!-- <input type="hidden" id="certificationYN" value="false">
 -->
					</td>
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