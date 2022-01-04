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
<title>비밀번호 찾기</title>
<link rel="stylesheet" type="text/css"   href="${contextPath}/resources/css/mainStyle.css">
<link rel="stylesheet" type="text/css"   href="${contextPath}/resources/css/loginStyle.css">
<style type="text/css">
	.login-btn {
		margin-top: 20px;
	}
</style>
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
               alert('존재하지 않는 이메일입니다.');
            }
         })

      }
   }
</script>
</head>
<body class="body-color">
   <c:import url="../default/menu.jsp"/>
   <div class="flex-container">
      <div align="center" class="white-box shadow box-center">
         <div class="email center">
            <h2>비밀번호 찾기</h2>
            <form action="findpassword">
               <label>전송 받을 이메일 주소를 적어주세요.</label>
               <br>
               <span>👇</span>
               <input type="text" id="userEmail" name="userEmail" autofocus autocomplete="off" required />
               <button class="login-btn" type="button" onclick="sendmail()">
                  이메일 전송
               </button>
            </form>
         </div>
      </div>
   </div>
</body>
</html>