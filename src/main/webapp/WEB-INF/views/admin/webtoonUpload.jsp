<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=yes,
			maximum-scale=1.0, minimum-scale=1.0" />
<title>작품 추가</title>
<link rel="stylesheet" href="${contextPath}/resources/css/webtoonUpload.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		$(document).on('keyup', '#webtoonName', function(e){
		    var webtoonName = $(this).val();
		    $('#webtoonName_cnt').text(getBytes(webtoonName)+'/50');    
		});$('#webtoonName').keyup();
	});
	
	 
	function getBytes(str){
	    var cnt = 0;
	    for(var i =0; i<str.length;i++) {
	        cnt += (str.charCodeAt(i) >128) ? 2 : 1;
	    }
	    return cnt;
	}
</script>
</head>
<body>
	<h1>작품 추가</h1>
	<form>
		<div style="display: flex;">
			<div>
				<img src="" alt="이미지">
			</div>
			<div>
				<label id="image_name">default image</label><br>
				<button>이미지 삽입</button>
			</div>
		</div>
	<br>
		<div class="webtoonName_wrap">
			<b>작품제목</b>
			<textarea rows="3" cols="30" id="webtoonName" name="webtoonName"></textarea>
			<span id="webtoonName_cnt"></span>
		</div>
		<br> <b>작가명<b></b><input type="text" placeholder="글작가/그림작가"><br>
			<b>링크</b>
			<button>+</button> <br> <select>
				<option value="naver">네이버</option>
				<option value="kakaoWebtoon">카카오웹툰</option>
				<option value="kakaoPage">카카오페이지</option>
				<option value="bomtoon">봄툰</option>
				<option value="lezhin">레진</option>
				<option value="toptoon">탑툰</option>
				<option value="mrblue">리디북스</option>
				<option value="ridibooks">탑툰</option>
		</select> <input type="text" placeholder="웹툰 링크"> <br> <b>세부설명</b><br>
			<textarea rows="5" cols="50"></textarea> <br>
			<input type="submit" value="작품 추가">
	</form>

</body>
</html>