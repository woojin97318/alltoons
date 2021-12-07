<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=yes,maximum-scale=1.0, minimum-scale=1.0" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	/* webtoonTitle */
	$(function(){
		$(document).on('keyup', '#webtoonTitle', function(e){
		    var webtoonName = $(this).val();
		    $('#webtoonTitle_cnt').text(getBytes(webtoonName)+'/50');    
		});$('#webtoonTitle').keyup();
	});
	
	function getBytes(str){
	    var cnt = 0;
	    for(var i =0; i<str.length;i++) {
	        cnt += (str.charCodeAt(i) >128) ? 2 : 1;
	    }
	    return cnt;
	}
	
	/* webtoonContent */
	$(function(){
		$(document).on('keyup', '#webtoonContent', function(e){
		    var webtoonContent = $(this).val();
		    $('#webtoonContent_cnt').text(getBytes(webtoonContent)+'/500');    
		});$('#webtoonContent').keyup();
	});
	
	function getBytes(str){
	    var cnt = 0;
	    for(var i =0; i<str.length;i++) {
	        cnt += (str.charCodeAt(i) >128) ? 2 : 1;
	    }
	    return cnt;
	}
	/* //const 사용시 변수 재할당, 재선언 불가능
	const add_box = () =>{
		const platform_link = document.getElementById("platform_link");
		const newP = document.createElement('p');
		consol.log("innerHTMl전")
		newP.innerHTML = "<select name='platformName'><option value='naver'>네이버</option> <option value='kakaoWebtoon'>카카오웹툰</option>	<option value='kakaoPage'>카카오페이지</option>	<option value='bomtoon'>봄툰</option>	<option value='lezhin'>레진</option>	<option value='toptoon'>탑툰</option>	<option value='mrblue'>리디북스</option><option value='ridibooks'>탑툰</option>	</select><input type='text' name='webtoonLink' placeholder='웹툰 링크'><input type='button' value='-' onclick='remove(this)'>	";
		consol.log("innerHTMl후")
		platform_link.appenChild(newP);
		consol.log("appenChild후")
	}
	const remove = (obj)=>{
		document.getElementById('platform_link').removeChild(obj.parentNode);
	} */
	
	function readURL(input) {
	      var file = input.files[0] //파일에 대한 정보
	      console.log(file)
	      if (file != '') {
	         var reader = new FileReader();
	         reader.readAsDataURL(file); //파일의 정보를 토대로 파일을 읽고 
	         reader.onload = function (e) { // 파일 로드한 값을 표현한다
	          //e : 이벤트 안에 result값이 파일의 정보를 가지고 있다.
	           $('#webtoonImage').attr('src', e.target.result);
	          }
	      }
	  }  
</script>

<title>작품 추가</title>
</head>
<body>
	<h1>작품 추가</h1>
	<form action="${contextPath}/webtoonUpload" method="post" enctype="multipart/form-data">
		<div style="display: flex;">
			<div>
				<img id="webtoonImage" src="default_image.png" width=100 height=100 alt="선택된 이미지가 없습니다" />
			</div>
			<div>
				<!-- <label id="image_name">default image</label><br> -->
				<input type="file" name="webtoon_Image" onchange="readURL(this);" /> 
			</div>
		</div>
		<br>
		<div class="webtoonName_wrap">
			<b>작품제목</b>
			<textarea rows="1" cols="30" id="webtoonTitle" name="webtoonTitle"></textarea>
			<span id="webtoonTitle_cnt"></span>
		</div>
		<br> 
		<b>작가명</b><input type="text" name="webtoonWriter" placeholder="글작가/그림작가"><br>
		
		<b>링크</b> 
		<div id="box">
			<button onclick="add_textbox">+</button> <br> 
			<select name="platformName" id="platformName">
				<option value="naver">네이버</option>
				<option value="kakaoWebtoon">카카오웹툰</option>
				<option value="kakaoPage">카카오페이지</option>
				<option value="bomtoon">봄툰</option>
				<option value="lezhin">레진</option>
				<option value="toptoon">탑툰</option>
				<option value="mrblue">리디북스</option>
				<option value="ridibooks">탑툰</option>
			</select> 
			
			<input type="text" name="webtoonLink" id="webtoonLink" placeholder="웹툰 링크"> 
		</div>
		<br>
		<b>장르</b><br>
			<input type="checkbox" name="webtoonGenre" value="g1">에피소드 &ensp; 
			<input type="checkbox" name="webtoonGenre" value="g2">옴니버스 &ensp; 
			<input type="checkbox" name="webtoonGenre" value="g3">스토리 &ensp; 
			<input type="checkbox" name="webtoonGenre" value="g4">일상 &ensp; <br>
			<input type="checkbox" name="webtoonGenre" value="g5">개그 &ensp; 
			<input type="checkbox" name="webtoonGenre" value="g6">판타지 &ensp; 
			<input type="checkbox" name="webtoonGenre" value="g7">액션 &ensp; 
			<input type="checkbox" name="webtoonGenre" value="g8">드라마 &ensp; <br>
			<input type="checkbox" name="webtoonGenre" value="g9">순정 &ensp; 
			<input type="checkbox" name="webtoonGenre" value="g10">감성 &ensp; 
			<input type="checkbox" name="webtoonGenre" value="g11">스릴러 &ensp; 
			<input type="checkbox" name="webtoonGenre" value="g12">시대극 &ensp; <br>
			<input type="checkbox" name="webtoonGenre" value="g13">스포츠 &ensp; 	<br>
		
		<b>원작 링크</b><br>
		<select name="originalPlatform" id="originalPlatform">
				<option value="nan" selected>없음</option>
				<option value="naver">네이버</option>
				<option value="kakaoWebtoon">카카오웹툰</option>
				<option value="kakaoPage">카카오페이지</option>
				<option value="bomtoon">봄툰</option>
				<option value="lezhin">레진</option>
				<option value="toptoon">탑툰</option>
				<option value="mrblue">리디북스</option>
				<option value="ridibooks">탑툰</option>
		</select> 
		<input type="text" name="webtoonOriginalLink" id="webtoonOriginalLink" placeholder="웹툰 원작 링크" ><br> 
		<b>세부설명</b><br>
		<div class="webtoonContent_wrap">
			<textarea rows="5" cols="45" name="webtoonContent"id="webtoonContent"></textarea> 
			<span id="webtoonContent_cnt"></span><br>
		</div>
			
		<input type="submit" value="작품 추가">
	</form>

</body>
</html>