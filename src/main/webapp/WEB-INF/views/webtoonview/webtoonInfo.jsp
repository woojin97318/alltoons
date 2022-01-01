<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=yes,maximum-scale=1.0, minimum-scale=1.0" />
<title>작품 상세페이지</title>
<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/mainStyle.css">
<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/btnStyle.css">
<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/tableStyle.css">
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
		width: 100%;
	}

	.webtooninfo-img {
		width: 200px;
		height: 200px;
		overflow: hidden;
		display: inline-block;
	}

	.webtooninfo-content {
		padding: 20px;
	}

	.webtooninfo-img .thumbnail {
		width: 200px;
		height: 200px;
		object-fit: cover;
		border-radius: 10px;
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
	
	.td {
		width: 50px;
	}

	.profil {
		width: 50px;
		height: 50px;
		border-radius: 100%;
	}

	textarea {
		padding: 10px;
		resize: none;
		border: none;
		background: var(--grayML);
		border-radius: 5px;
	}

	textarea:focus {
		background: var(--grayL);
	}
	
	.relative{
		position: relative;
	}
	
	th div textarea, th div button {
		vertical-align: middle;
	}
	
	.width-100 {
		width: 100%;
	}

	.content-box {
		padding: 15px;
		background-color: var(--grayML);
	}

	.my-review-box, .review-box {
		position: relative;
	}

</style>
</head>

<body>
	<header>
		<c:import url="../default/header.jsp"/>
		<c:import url="../default/menu.jsp"/>
	</header>

	<div class="container">
		<div class="webtooninfo-img-content" style="margin: 0 20px 50px 20px;">
		<h1>작품 상세 페이지</h1>
		<table>
			<tr style="height: 250px;">
				<td style="width: 200px;">
					<!--썸네일-->
					<div class="webtooninfo-img">
						<c:choose>
							<c:when test="${webtoonDate.webtoonImage=='default_image.png'}">
								<img class="thumbnail"
								src="${contextPath}/resources/img/webtoon/default_image.png"
								alt="선택된 이미지가 없습니다">
							</c:when>
							<c:otherwise>
								<img class="thumbnail"
								src="${contextPath }/thumbnail?webtoonImage=${webtoonDate.webtoonImage}"
								alt="썸네일 존재">
							</c:otherwise>
						</c:choose>
						<!--하트,별-->
						<section class="heart-star-icon">
							<img src="" onclick="interestClick()" id="interest"><span id="icount">${intesrestCount }</span>
							<img src="" onclick="favoritesClick()" id="favorites"><span id="fcount">${favoritesCount }</span>
						</section>
					</div>
				</td>
				<td>
					<div class="webtooninfo-content">
						<!--제목-->
						<h2>${webtoonDate.webtoonTitle}</h2>
						<b><label class="godic-font">작가명</label></b><br>
						<label class="small-font">${webtoonDate.webtoonWriter }</label> 
					</div>
				</td>
			</tr>
		</table>
		</div>

		<hr class="hr-dashed">

		<table>
			<tr>
				<td class="td-padding">
					<section id="platform">
						<b>
							<label class="title-result" style="position: relative; top:10px; margin-right: 10px;">
							웹툰 보러가기
							<span style="position: relative; bottom:5px;">👉</span>
							</label>
						</b>
						<!--웹툰 플랫폼 이름-->
						<c:forEach var="list" items="${platformList}">
							<button class="platform-btn" onclick="location.href='${list.webtoonLink}'">
								<img class="platform-img"
									src="${contextPath}/resources/img/webtoon/logo/${list.platformName}.png"
									onclick="location.href='${list.webtoonLink}'"><br>
								${list.platformNameKor }
								<%-- ${list.platformName } --%>
							</button>
						</c:forEach>
					</section>
				</td>
			</tr>
		</table>

		<!--원작이 있을 경우-->
		<c:if test="${originList[0].webtoonOriginalLink !='nan'}">
			<hr>
			<table>
				<td class="td-padding">
					<b><label class="title-result" style="position: relative; top:10px; margin-right: 10px;">원작 소설 보러가기!</label></b><br>
					<section id="platform">
						<!--원작 플랫폼 이름-->
						<c:forEach var="origin" items="${originList }">
							<span>
								<button class="platform-btn" onclick="location.href='${origin.webtoonOriginalLink}'" >
								<img class="platform-img"
									src="${contextPath}/resources/img/webtoon/logo/${origin.originalPlatform}.png"
									onclick="location.href='${origin.webtoonOriginalLink}'"><br>
									${origin.originalPlatformKor }
									<%-- ${origin.originalPlatform} --%>
								</button>
							</span>
						</c:forEach>
					</section>
				</td>
			</table>
		</c:if>

		<hr class="hr-dashed">

		<div style="padding: 20px;">
			<label class="title-result"><b>작품 소개글</b></label><br>
			<section class="content-box">
				<label class="godic-font">${webtoonDate.webtoonContent }</label>
			</section>
		</div>
		
		<table>
			<tr><td><hr></td></tr>
			<tr><th>${reviewCnt }개의 리뷰가 존재합니다.</th></tr>
			<tr><td><hr></td></tr>
			<c:choose>
				<c:when test="${myReview == 'n' }">
					<tr><th>리뷰 작성을 원하시면 로그인이 필요합니다.</th></tr>
				</c:when>
				<c:otherwise>
					<c:choose>
						<c:when test="${myReview == null }">
							<tr>
								<th>
									<form action="${contextPath }/webtoon/review/reviewInsert" method="post">
										<input type="hidden" name="webtoonNum" value="${webtoonDate.webtoonNum }">
										<input type="hidden" name="userEmail" value="${user }">
										<div class="table-center">
											<textarea rows="5" cols="30" name="reviewContent" placeholder="친절한 리뷰를 달아주세요:)"></textarea>
											<button class="small-btn-blue-white" type="submit" value="작성">작성하기</button>
										</div>
									</form>
								</th>
							</tr>
						</c:when>
						<c:otherwise>
							<tr>
								<th>내가 작성한 리뷰</th>
							</tr>
							<tr>
								<td>
									<section class="my-review-box">
										<b>${myReview.reviewContent }</b><br>
										<label class="small-font">작성 시간 : ${myReview.reviewTime }</label>
										<button class="review-inner-btn"
											onclick="location.href='${contextPath}/webtoon/review/myReviewDel?reviewNum=${myReview.reviewNum }&webtoonNum=${webtoonDate.webtoonNum }'">
											삭제
										</button>
									</section>
								</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</c:otherwise>
			</c:choose>
			<tr>
				
			</tr>
			<c:choose>
				<c:when test="${reviewCnt == 0 }">
					<tr>
						<td><hr></td>
						<th style="color: gray;">
							아직 작성된 리뷰가 없습니다.<br>
							여러분의 소중한 리뷰를 달아주세요!
						</th>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach var="review" items="${reviewList }">
						<tr>
							<td>
								<section class="review-box">
									<img class="profil" src="${contextPath }/member/userImageView?file=${review.userImage }">
									<script>mailCut('${review.userEmail }')</script><br>
									<c:if test="${user != null }">
										<button class="review-inner-btn" title="신고하기" 
											onclick="location.href='${contextPath}/webtoon/report?reviewNum=${review.reviewNum }&webtoonNum=${webtoonDate.webtoonNum }'">
											신고하기
										</button>
									</c:if>
								</section>
							</td>
						</tr>
						<tr><td>${review.reviewContent }</td></tr>
						<tr><td>${review.reviewTime }</td></tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</table>
	<hr>
	<footer>
		<c:import url="../default/footer.jsp"/>
	</footer>
</div>
</body>
</html>