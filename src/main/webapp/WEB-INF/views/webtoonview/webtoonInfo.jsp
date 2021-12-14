<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<%@  taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=yes,maximum-scale=1.0, minimum-scale=1.0" />
<title>작품 상세페이지</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	<c:choose>
		<c:when test="${fn:contains(favoritesDTO.interest,'T')}">
			interest_on();
		</c:when>
		<c:otherwise>
			interest_off();
		</c:otherwise>
	</c:choose>
	
	<c:choose>
	<c:when test="${fn:contains(favoritesDTO.favorites,'T')}">
		favorties_on();
	</c:when>
	<c:otherwise>
		favorties_off();
	</c:otherwise>
</c:choose>
});

function interest_on(){
	document.getElementById("interest").src="resources/img/webtoon/interest_on.png";
}
function interest_off(){
	document.getElementById("interest").src="resources/img/webtoon/interest_off.png";
}
function favorties_on(){
	document.getElementById("favorites").src="resources/img/webtoon/favorties_on.png";
}
function favorties_off(){
	document.getElementById("favorites").src="resources/img/webtoon/favorties_off.png";
}
</script>
<script type="text/javascript">/* 관심 */
	function interestClick(){
		$.ajax({
			url: "interestClick",
			type: "GET",
			data: {
				webtoonNum: "${webtoonDate.webtoonNum}",
				userEmail: "${user}"
			},
			success : function(cnt){
				$("#icount").text(cnt)
				i_onOff()
			},
			error: function(){alert("실패")}
		})
	}
	function i_onOff(){
		$.ajax({
			url: "i_onOff",
			type: "GET",
			data: {
				webtoonNum: "${webtoonDate.webtoonNum}",
				userEmail: "${user}"
			},
			success : function(onoff){
				if(onoff=="T"){
					console.log(onoff);
					interest_on()
				}else{
					console.log(onoff);
					interest_off()
				}
			},error: function(){alert("하트 실패")}
		})
	}	
</script>
<script type="text/javascript">/* 즐겨찾기 */
	function favoritesClick(){
		$.ajax({
			url: "favoritesClick",
			type: "GET",
			data: {
				webtoonNum: "${webtoonDate.webtoonNum}",
				userEmail: "${user}"
			},
			success : function(cnt){
				$("#fcount").text(cnt)
				f_onOff()
			},
			error: function(){alert("실패")}
		})
	}
	function f_onOff(){
		$.ajax({
			url: "f_onOff",
			type: "GET",
			data: {
				webtoonNum: "${webtoonDate.webtoonNum}",
				userEmail: "${user}"
			},
			success : function(onoff){
				if(onoff=="T"){
					console.log(onoff);
					favorties_on()
				}else{
					console.log(onoff);
					favorties_off()
				}
			},error: function(){alert("별 실패")}
		})
	}	
</script>
</head>
<body>	


<h1>작품 상세 페이지</h1>
	<div style="display: flex;">
		<div >
			<c:choose>
				<c:when test="${webtoonList.webtoonImage=='default_image'}">
					<img id="webtoonImage" src="resources/resources/default_image.jpg"
						width=100 height=100 alt="선택된 이미지가 없습니다" />
				</c:when>
				<c:otherwise>
					<img id="webtoonImage"
						src="${contextPath }/thumbnail?webtoonImage=${webtoonDate.webtoonImage}"
						width=100 height=100 alt="썸네일이 존재" />
				</c:otherwise>
			</c:choose>
			<img src="" width="20"height="20" onclick="interestClick()" id="interest"><label id="icount">${intesrestCount }</label>
			<img src="" width="20"height="20" onclick="favoritesClick()" id="favorites"><label id="fcount">${favoritesCount }</label>
		</div>
		<div>
			${webtoonDate.webtoonTitle}<br>
			
			<b>작가명</b><br>
			${webtoonDate.webtoonWriter }
		
		<c:choose>
			<c:when test="${linkCount == 1}">
			<br>
				<button type="button" onclick="location.href='${platformList[0].getWebtoonLink()}'">보 러 가 기</button>
				</div>
			</div>
			</c:when>
			<c:otherwise>
				</div>
				</div>
					<b>보러가기</b>
					<c:forEach var="list" items="${platformList}">
						<img src="resources/img/webtoon/logo/${list.platformName}.png" width="30" height="30" onclick="location.href='${list.webtoonLink}'">
						<%-- <button type="button" onclick="location.href='${list.webtoonLink}'" >${list.platformName }</button> --%>
					</c:forEach>
			</c:otherwise>
		</c:choose>
	
	<br>
	<c:if test="${originList[0].webtoonOriginalLink !='nan' }">
		<b>이 작품은 소설이 존재해요!</b><br>
		<c:forEach var="origin" items="${originList }">
			<img src="resources/img/webtoon/logo/${origin.originalPlatform}.png" width="30" height="30" onclick="location.href='${origin.webtoonOriginalLink}'">
			<%-- <button type="button" onclick="location.href='${origin.webtoonOriginalLink}'" >${origin.originalPlatform}</button> --%>
		</c:forEach>
	</c:if>
	<br>
	<b>작품 소개글</b><br>
	<label>${webtoonDate.webtoonContent }</label>
	<hr>
	<b>리뷰 ${reviewCnt }개</b>
	<br>
	<table>
		<c:choose>
			<c:when test="${myReview != null }">
				<tr>
					<td>
						<img src="${contextPath }/member/userImageView?file=${myReview.userImage}"
							width="100px" height="100px">
					</td>
					<th>
						${myReview.userEmail }
					</th>
					<td>
						<button type="button" onclick="location.href=''">
							삭제
						</button>
					</td>
				</tr>
				<tr>
					<td colspan="3">
						${myReview.reviewContent }
					</td>
				</tr>
				<tr>
					<td colspan="3">
						작성 시간 : ${myReview.reviewTime }
					</td>
				</tr>
			</c:when>
			<c:otherwise>
				<tr>
					<td>
						<img src="${contextPath }/member/userImageView?file=${myReview.userImage}"
							width="100px" height="100px">
					</td>
					<th colspan="2">
						${user}
					</th>
				</tr>
				<tr>
					<td colspan="3">
						<form action="" method="post">
							<input type="hidden" name="userEmail" value="${user }">
							<input type="hidden" name="webtoonNum" value="webtoonDate.webtoonNum">
							<textarea rows="5" cols="20" name="reviewContent"></textarea>
						</form>
					</td>
				</tr>
			</c:otherwise>
		</c:choose>
		<tr>
			<td colspan="3">
				<hr>
			</td>
		</tr>
	</table>
	<table>
		<c:choose>
			<c:when test="${reviewList == null }">
				<tr>
					<td colspan="3">
						리뷰가 없습니다
					</td>
				</tr>
			</c:when>
			<c:choose>
				<c:forEach var="review" items="${reviewList }">
					<tr>
						<td>
							<img src="${contextPath }/member/userImageView?file=${review.userImage }"
								width="100px" height="100px">
						</td>
						<td>
							${review.userEmail }
						</td>
						<td>
							<button type="button" onclick="location.href=''">
								신고
							</button>
						</td>
					</tr>
					<tr>
						<td colspan="3">
							${review.reviewContent }
						</td>
					</tr>
					<tr>
						<td colspan="3">
							${review.reviewTime }
						</td>
					</tr>
					<tr>
						<td colspan="3">
							<hr>
						</td>
					</tr>
				</c:forEach>
			</c:choose>
		</c:choose>
	</table>
</body>
</html>