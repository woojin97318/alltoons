<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=yes,maximum-scale=1.0, minimum-scale=1.0" />
<title>회원가입 페이지</title>
<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/mainStyle.css">
<link rel="stylesheet" type="text/css"	href="${contextPath}/resources/css/loginStyle.css">
<link rel="stylesheet" type="text/css"	href="${contextPath}/resources/css/btnStyle.css">
<style type="text/css">
	.login-box {
		padding: 20px;
		width: 80%;
		position: relative;
	}

	.container {
		max-width: 500px;
	}

	.profil-img {
		display: block;
		width: 50px;
		height: 50px;
	}

	.login-btn {
		width: 70%;
		max-width: 300px;
		margin: 20px 0 10px 0;
	}

	th, td {
		padding: 5px 0;
	}


</style>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	var authResult = false;

	function chkInfo() {

		var authKey = $("#authKey").val();
		var join = document.join;
		//비밀번호 유효성 검사
		var reg = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;
		var pw = $("#userPassword").val();
		var pwChk = $("#chkPassword").val();

		var email = $("#userEmail").val();
		if (authResult == false) {
			alert("인증을 진행해주세요");
		} else {
			if (email == "") {
				alert("이메일을 입력해주세요!");
			} else {
				if (pw == "") {
					alert("비밀번호를 입력해주세요!");
				} else {
					if (pwChk == "") {
						alert('비밀번호 확인란을 입력해 주세요!');
					} else {
						if (false === reg.test(pw)) {
							alert('비밀번호는 8자 이상이어야 하며, 숫자/대문자/소문자/특수문자를 모두 포함해야 합니다.');
						} else {
							if (pw != pwChk) {
								alert('비밀번호가 일치하지 않습니다!');
							} else {
								console.log("성공");
								join.submit();
							}
						}

					}
				}

			}
		}

	}

	function sendmail() {
        var userEmail = $("#userEmail").val();
        var form = {
            email : userEmail
        }

        //이메일 유효성 검사
        var chkForm = /^([\w-]+(?:.[\w-]+))@((?:[\w-]+.)\w[\w-]{0,66}).([a-z]{2,6}(?:.[a-z]{2})?)$/i;
        if(userEmail === ""){
            alert('이메일을 입력해주세요!');
        }else{
            if (false === chkForm.test(userEmail)) {
                alert('이메일 형식이 아닙니다!');
                //이메일 전송 시도 X
            } else {
                $.ajax({
                    url : "sendmail", //"ajax",
                    type : "GET",
                    data : form,
                    dataType : "json",
                    contentType : "application/json; charset=utf-8",
                    success : function(result) {
                        console.log("메일 전송 성공")
                        alert('메일함을 확인해주세요')

                    },
                    error : function() {
                        alert('메일 전송 실패')
                    }
                })
            }
        }

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
			dataType : "json",
			contentType : "application/json; charset=utf-8",
			success : function(result) {
				if (result == true) {
					authResult = result;
					console.log(authResult);
					alert('인증 성공');
				} else {
					alert('인증 실패');
				}
			},
			error : function() {
				alert("통신 실패")
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

<body class="body-color">
	<c:import url="../default/menu.jsp"/>
<div class="container" align="center">
	<div align="center" class="login-box">
		<form name="join" action="signupform" method="post" enctype="multipart/form-data">
			<table>
				<tr>
					<!--프로필 이미지-->
					<td>
						<img class="profil-img" id="img" src="${contextPath }/resources/img/member/default_image.png" />
					</td>
				</tr>
				<tr>
					<td>프로필 사진</td>
					<td>
						<label class="nomal-gray-blue-btn" for="file">파일 선택</label>
						<input id="file" class="hidden" type="file" onchange="readURL(this);" name="userImage">
					</td>
				</tr>
				<tr>
					<td>이메일*</td>
					<td>
						<input type="text" id="userEmail" name="userEmail" autofocus autocomplete="off" required placeholder="이메일을 입력해주세요" />
						<br>
						<button class="nomal-gray-blue-btn" type="button" onclick="sendmail()">
							이메일 전송
						</button>
					</td>
				</tr>
				<tr>
					<td>
						인증번호
					</td>
					<td>
						<input type="text" id="authKey" placeholder="인증번호" autofocus autocomplete="off" required>
						<br>
						<button class="nomal-gray-blue-btn" type="button" onclick="authChk()">
							인증하기
						</button>
					</td>
				</tr>
				<tr>
					<td>
						비밀번호*
					</td>
					<td>
						<input type="password" name="userPassword" id="userPassword" placeholder="비밀번호" autofocus autocomplete="off" required>
					</td>
				</tr>
				<tr>
					<td>
						비밀번호 확인
					</td>
					<td>
						<input type="password" name="chkPassword" id="chkPassword" placeholder="비밀번호 확인" autofocus autocomplete="off" required>
					</td>
				</tr>
			</table>
			<input class="login-btn" type="button" onclick="chkInfo()" value="가입하기">
		</form>
	</div>
</div>
</body>
</html>