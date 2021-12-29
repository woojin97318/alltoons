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
<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/mainStyle.css">
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
	document.getElementById("interest").src="${contextPath}/resources/img/webtoon/interest_on.png";
}

function interest_off(){
	document.getElementById("interest").src="${contextPath}/resources/img/webtoon/interest_off.png";
}

function favorties_on(){
	document.getElementById("favorites").src="${contextPath}/resources/img/webtoon/favorties_on.png";
}

function favorties_off(){
	document.getElementById("favorites").src="${contextPath}/resources/img/webtoon/favorties_off.png";
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
				error: function(){
					if(confirm("로그인시 이용가능합니다. 로그인하시겠습니까?")){
						location.href='../member/login';
					}
				}
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
			},error: function(){
				if(confirm("로그인시 이용가능합니다. 로그인하시겠습니까?")){
					location.href='../member/login';
				}
			}
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
<script>
window.onpageshow = function(event) {
    if (event.persisted) {
        document.location.reload();
    }
};
</script>
<script>/*리뷰 작성자 이메일 모자이크*/
function mailCut(mail) {
	const str = mail;
	document.write(str.substring(0, 5) + '****');
};
</script>
<style type="text/css">
	.webtooninfo-img-content {

	}

	.webtooninfo-img {
		width: 200px;
		height: 200px;
		overflow: hidden;
		display: inline;
	}

	.webtooninfo-content {
		padding: 10%;
	}

	.webtooninfo-img > .thumbnail {
		width: 200px;
		height: 200px;
		object-fit: cover;
	}

	#platform{
		display: flex;
		cursor: pointer;
	}

	.platform-img {
		width: 30px; 
		height: 30px;
	}

	.heart-star-icon {
			position: absolute;
	}

	#interest, #favorites {
		margin-right: 5px;
		width: 20px;
		height: 20px;
	}
	
	table {
		width: 100%;
	}

	.td {
		width: 50px;
	}

	.profil {
		width: 50px;
		height: 50px;
	}

</style>
</head>
<body>
	<header>
		<c:import url="../default/header.jsp"/>
		<c:import url="../default/menu.jsp"/>
	</header>

<div class="container">
	<h1>작품 상세 페이지</h1>
		<div class="webtooninfo-img-content">
			<!--썸네일-->
			<div class="webtooninfo-img">
				<c:choose>
					<c:when test="${webtoonDate.webtoonImage=='default_image.png'}">
						<img class="thumbnail"
						src="${contextPath}/resources/img/webtoon/default_image.png"
						alt="선택된 이미지가 없습니다" />
					</c:when>
					<c:otherwise>
						<img class="thumbnail"
						src="${contextPath }/thumbnail?webtoonImage=${webtoonDate.webtoonImage}"
						alt="썸네일 존재" />
					</c:otherwise>
				</c:choose>
				<!--하트,별-->
				<section class="heart-star-icon">
					<span id="icount"></span><img src="" onclick="interestClick()" id="interest">${intesrestCount }</span>
					<span id="fcount"></span><img src="" onclick="favoritesClick()" id="favorites">${favoritesCount }</span>
				</section>
			</div>
			<div class="webtooninfo-content">
				<h2>${webtoonDate.webtoonTitle}</h2><br>
				<h4><b>작가명</b>${webtoonDate.webtoonWriter }</h4><br>
			</div>
		</div>

	<b><label class="title-result">보러가기</label></b>

	<div id="platform">
	<c:forEach var="list" items="${platformList}">
		<div>
			<img class="platform-img"
				src="${contextPath}/resources/img/webtoon/logo/${list.platformName}.png"
				onclick="location.href='${list.webtoonLink}'"><br>
				${list.platformNameKor }
			<%-- <button type="button" onclick="location.href='${list.webtoonLink}'" >${list.platformName }</button> --%>
		</div>
	</c:forEach>
	</div>

	<c:if test="${originList[0].webtoonOriginalLink !='nan'}">
		<b><label class="title-result">원작 소설 보러가기!</label></b>
		<br>
		<div id="platform">
			<c:forEach var="origin" items="${originList }">
				<div>
					<img class="platform-img"
						src="${contextPath}/resources/img/webtoon/logo/${origin.originalPlatform}.png"
						onclick="location.href='${origin.webtoonOriginalLink}'"><br>
						${origin.originalPlatformKor }
					<%-- <button type="button" onclick="location.href='${origin.webtoonOriginalLink}'" >${origin.originalPlatform}</button> --%>
				</div>
			</c:forEach>
		</div>
   </c:if>

	 <hr>

   <label class="title-result"><b>작품 소개글</b></label><br>
   <label>${webtoonDate.webtoonContent }</label>

	<table>
		<tr><td colspan="3"><hr></td></tr>
		<tr><th colspan="3">${reviewCnt }개의 리뷰</th></tr>
		<tr><td colspan="3"><hr></td></tr>
		<c:choose>
			<c:when test="${myReview == 'n' }">
				<tr><th colspan="3">리뷰 작성은 로그인이 필요합니다</th></tr>
			</c:when>
			<c:otherwise>
				<c:choose>
					<c:when test="${myReview == null }">
						<tr><th colspan="3">리뷰 작성</th></tr>
						<tr>
							<td colspan="2">
								<form action="${contextPath }/webtoon/review/reviewInsert" method="post">
									<input type="hidden" name="webtoonNum" value="${webtoonDate.webtoonNum }">
									<input type="hidden" name="userEmail" value="${user }">
									<textarea rows="5" cols="20" name="reviewContent"></textarea>
							</td>
							<td>
									<input type="submit" value="작성">
								</form>
							</td>
						</tr>
					</c:when>
					<c:otherwise>
						<tr>
							<th colspan="2">내가 작성한 리뷰</th>
							<td>
								<button type="button" onclick="location.href='${contextPath}/webtoon/review/myReviewDel?reviewNum=${myReview.reviewNum }&webtoonNum=${webtoonDate.webtoonNum }'">
									삭제
								</button>
							</td>
						</tr>
						<tr><td colspan="3">${myReview.reviewContent }</td></tr>
						<tr><td colspan="3">작성 시간 : ${myReview.reviewTime }</td></tr>
					</c:otherwise>
				</c:choose>
			</c:otherwise>
		</c:choose>
		<tr><td colspan="3"><hr></td></tr>
		<c:choose>
			<c:when test="${reviewList.isEmpty() }">
				<tr><th colspan="3">작성된 리뷰가 없습니다</th></tr>
			</c:when>
			<c:otherwise>
				<c:forEach var="review" items="${reviewList }">
					<tr>
						<td class="td">
							<section class="profil">
							<img src="${contextPath }/member/userImageView?file=${review.userImage }"
								width="50px" height="50px">
							</section>
						</td>
						<th><script>mailCut('${review.userEmail }')</script></th>
						<td class="td">
							<c:if test="${user != null }">
								<button type="button" onclick="location.href='${contextPath}/webtoon/report?reviewNum=${review.reviewNum }&webtoonNum=${webtoonDate.webtoonNum }'">
									신고
								</button>
							</c:if>
						</td>
					</tr>
					<tr><td colspan="3">${review.reviewContent }</td></tr>
					<tr><td colspan="3">${review.reviewTime }</td></tr>
					<tr><td colspan="3"><hr></td></tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>
</div>
<footer>
	<c:import url="../default/footer.jsp"/>
</footer>
</body>
</html>