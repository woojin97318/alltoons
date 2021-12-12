<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 페이지</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
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

	function authChk() {
		var authKey = $("#authKey").val();
		var authForm = {
			key : authKey
		}
		$.ajax({
			url : "chkKey",
			type : "GET",
			data : authForm,
			contentType : "application/json; charset=utf-8",
			success : function() {
				console.log("인증 성공")
				alert('인증에 성공했습니다.')
			},
			error : function() {
				alert('인증키가 일치하지 않습니다.')
			}
		})
	}

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
					<td><input type="file" onchange="readURL(this);" name="userImage"></td>
				</tr>
				<tr>
					<td>이메일*</td>
					<td><input type="text" id="emailText" name="email" autofocus
						autocomplete="off" required placeholder="이메일을 입력해주세요" /></td>
				</tr>

				<tr>
					<td></td>
					<td><button type="button" onclick="sendmail()">이메일 전송</button></td>
				</tr>
				<tr>
					<td colspan="2">인증번호 <input type="text" id="authKey">
						<button type="button" onclick="authChk()">인증하기</button>
					</td>
				</tr>
				<tr>
					<td></td>
				</tr>
				<tr>
					<td>비밀번호*</td>
					<td><input type="password" name="userPassword"
						placeholder="비밀번호"></td>
				</tr>
				<tr>
					<td>비밀번호확인</td>
					<td><input type="password" name="chkPassword"
						placeholder="비밀번호"></td>
				</tr>
				<tr>
					<td><input type="submit" value="가입하기"></td>
				</tr>
			</table>
		</form>
		<!--
		<form action="/sendMail/auth" id="joinForm" method="post">
			<fieldset>
				<legend class="screen_out"> 회원가입 폼</legend>
				 				<div class="box email">
					<label for="email">이메일</label> <input type="text" id="emailText"
						name="email" autofocus autocomplete="off" required />
				</div>
				<div class="box btn">
					<button type="button" onclick="sendmail()" class="btn join">
						이메일 전송</button>
				</div> 
			</fieldset>
		</form>
		-->
	</div>
</body>
</html>