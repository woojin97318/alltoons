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
	$(document).ready(function(){//페이지 들어왔을때 작동
		
		<c:forEach items="${linkList}" var="platformlist">
			var newP = document.createElement('span');
			var platform='';
			switch('${platformlist.getPlatformName()}'){
			case 'naver':platform='네이버';break;
			case 'kakaoWebtoon':platform='카카오웹툰';break;
			case 'kakaoPage':platform='카카오페이지';break;
			case 'bomtoon':platform='봄툰';break;
			case 'lezhin':platform='레진';break;
			case 'toptoon':platform='탑툰';break;
			case 'mrblue':platform='미스터블루';break;
			case 'ridibooks':platform='리디북스';break;
			}
			html = '';
			html += '<select name="platformName" id="platformName">'
			html += '<option value="'+"${platformlist.getPlatformName()}"
			html +=	' selected">'+platform+'</option>'
			html += '<option value="naver">네이버</option>'
			html += '<option value="kakaoWebtoon">카카오웹툰</option>'
			html += '<option value="kakaoPage">카카오페이지</option>'
			html += '<option value="bomtoon">봄툰</option>'
			html += '<option value="lezhin">레진</option>'
			html += '<option value="toptoon">탑툰</option>'
			html += '<option value="mrblue">미스터블루</option>'
			html += '<option value="ridibooks">리디북스</option>'
			html += '</select> ';
			html += '<input type="text" name="webtoonLink" id="webtoonLink" placeholder="웹툰 링크" value="'+"${platformlist.getWebtoonLink()}"+'"> '
			html += '<br>'
			newP.innerHTML = html;
			box.appendChild(newP);
	</c:forEach>
	});

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
	function readURL(input) {
	      var file = input.files[0] 
	      console.log(file)
	      if (file != '') {
	         var reader = new FileReader();
	         reader.readAsDataURL(file); 
	         reader.onload = function (e) { 
	           $('#webtoonImage').attr('src', e.target.result);
	          }
	      }
	  }  
	var cnt=0;
	function add_link(){
		var newP = document.createElement('span');
		
		var html = '';
		cnt += 1;
		
		html += '<select name="platformName" id="platformName">'
		html += '<option value="naver">네이버</option>'
		html += '<option value="kakaoWebtoon">카카오웹툰</option>'
		html += '<option value="kakaoPage">카카오페이지</option>'
		html += '<option value="bomtoon">봄툰</option>'
		html += '<option value="lezhin">레진</option>'
		html += '<option value="toptoon">탑툰</option>'
		html += '<option value="mrblue">미스터블루</option>'
		html += '<option value="ridibooks">리디북스</option>'
		html += '</select> ';
		html += '<input type="text" name="webtoonLink" id="webtoonLink" placeholder="웹툰 링크"> '
		html += '<br>'
		newP.innerHTML = html;
		box.appendChild(newP);
	}
</script>
<link rel="stylesheet" href="resources/css/webtoonUpload.css">
<title>작품 수정</title>
</head>
<body>
	<h1>작품 수정</h1>
	<form action="${contextPath}/webtoonModify" method="post" enctype="multipart/form-data">
		<div style="display: flex;">
			<div>
				<img id="webtoonImage" src="resources/resources/default_image.png" width=100 height=100 alt="선택된 이미지가 없습니다" />
			</div>
			<div>
				<!-- <label id="image_name">default image</label><br> -->
				<input type="file" name="webtoon_Image" onchange="readURL(this);" /> 
			</div>
		</div>
		<br>
		<div class="webtoonName_wrap">
			<b>작품제목</b>
			<textarea rows="1" cols="30" id="webtoonTitle" name="webtoonTitle">${webtoonList.webtoonTitle }</textarea>
			<span id="webtoonTitle_cnt"></span>
		</div>
		<br> 
		<b>작가명</b><input type="text" name="webtoonWriter" placeholder="글작가/그림작가" value="${webtoonList.webtoonWriter }"><br>
		
		<b>링크</b> <button type="button" onclick="add_link()">+</button> <br>
		
		<div id="box">
			<%-- <c:forEach var="platformlist" items="${linkList }">
				<select name="platformName" id="platformName"> 
					<option value="naver">네이버</option>		
					<option value="kakaoWebtoon">카카오웹툰</option>	
					<option value="kakaoPage">카카오페이지</option>
					<option value="bomtoon">봄툰</option>
					<option value="lezhin">레진</option>
					<option value="toptoon">탑툰</option>
					<option value="mrblue">미스터블루</option>
					<option value="ridibooks">리디북스</option>
				</select> 
				
				<input type="text" id="webtoonLink" name="webtoonLink" placeholder="웹툰 링크" value="${platformlist.getWebtoonLink()}"> <br>
			</c:forEach> --%>
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
		<c:choose>
			<c:when test="${webtoonList.originalPlatform == 'nan' }">
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
				<input type="text" name="webtoonOriginalLink" id="webtoonOriginalLink" placeholder="웹툰 원작 링크" value="${webtoonList.webtoonOriginalLink }"><br> 
			</c:when>
				<c:otherwise>
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
					<input type="text" name="webtoonOriginalLink" id="webtoonOriginalLink" placeholder="웹툰 원작 링크" value="${webtoonList.webtoonOriginalLink }" ><br> 
				
			</c:otherwise>
		</c:choose>
		<b>세부설명</b><br>
		<div class="webtoonContent_wrap">
			<textarea rows="5" cols="45" name="webtoonContent"id="webtoonContent">${webtoonList.webtoonContent }</textarea> 
			<span id="webtoonContent_cnt"></span><br>
		</div>
		<input type="submit" value="작품 수정">
	</form>

</body>
</html>