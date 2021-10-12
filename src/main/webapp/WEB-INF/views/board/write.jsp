<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>

<%-- validation 실패시 --%>
<c:if test="${not empty ERROR }">
	<script>
		alert("등록 실패 " + "${ERROR}");
	</script>
</c:if>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gugi&display=swap"
	rel="stylesheet">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>main</title>

<link href="/CSS/styleWrite.css" rel="stylesheet">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>글작성</title>
<script src="${pageContext.request.contextPath }/ckeditor/ckeditor.js"></script>
<script>
	$(function() {
		$('.head3').click(function() {
			$('.head2').slideToggle();
		})
	})
</script>
</head>

<body>

	<div id="body-wrapper" style="min-height: 100%; padding-bottom: 300px;">

		<!--header-->
		<header>
			<div class="container">
				<div class="head1">
					<a onclick="location.href='../../../../main'"><i
						class="fas fa-home"></i></a> <span class="head3"><i
						class="far fa-caret-square-down"></i></span>
				</div>
				<nav class="head2">
					<ul>
						<li><a onclick="location.href='../../../../about'">CLVOER</a></li>
						<li><a
							onclick="location.href='../../../clover/member/qr/write'">MY
								QR</a></li>
						<li><a
							onclick="location.href='../../../clover/member/qr/qrlist'">ORDER</a></li>
						<li><a
							onclick="location.href='../../../clover/member/board/list'">FIND
								& FOUND</a></li>
						<sec:authorize access="isAnonymous()">
							<a href="<c:url value="/login2" />" id="loginOut">LOGIN</a>
						</sec:authorize>
						<sec:authorize access="isAuthenticated()">
							<a href="<c:url value="../../../clover/member/mypage" />"
								id="MyPage">MYPAGE</a>
						</sec:authorize>
						<sec:authorize access="hasRole('ROLE_ADMIN')">
							<a href="<c:url value="../../../clover/admin/main" />" id="admin">ADMIN</a>
						</sec:authorize>
						<sec:authorize access="isAuthenticated()">
							<a href="<c:url value="/logout" />" id="logOut">LOGGOUT</a>
						</sec:authorize>
					</ul>
				</nav>
			</div>
		</header>
		<section class="container1">
			<div class="container contents">
				<h2>글작성</h2>
				<form name="frm" action="writeOk" method="post"
					onsubmit="return chkSubmit()">
					카테고리: <select class="select" id="category" name="category"
						style="width: 170px;">
						<option value="부모님" selected>부모님</option>
						<option value="아이">아이</option>
						<option value="반려동물">반려동물</option>
					</select> <br> 제목: <input type="text" name="subject"
						value="${w.subject }" /><br> <br> 내용:<br>
					<div class="contentscon">
						<div class="context" style="width: 500px; margin: auto">
							<textarea name="content" id='content'>${w.content }</textarea>
							<script type="text/javascript">
								CKEDITOR
										.replace(
												'content',
												{
													allowedContent : true, // HTML 태그 자동삭제 방지설정
													width : '1000px',
													height : '200px',
													filebrowserUploadUrl : '${pageContext.request.contextPath}/upload/image'
												});
							</script>
						</div>
					</div>

					<br> <br> 마지막으로 본 장소 :
					<h5>지도를 움직이면서 잃어버린 위치를 정확하게 표시해주세요</h5>
					<!-- TODO -->
					<div class="container contents" style="background-color: grey">
						<div id="map"
							style="width: 1000px; height: 350px; background-color: grey"
							class="map contents">
							<div id="clickLatlng"></div>

							<input type="hidden" name="latitude" id="latitude" value="" /> <input
								type="hidden" name="longitude" id="longitude" value="" />

							<script type="text/javascript"
								src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2389d39ea90c7f8eac5210a7bd81bee9"></script>
							<script>
								var mapContainer = document
										.getElementById('map'), // 지도를 표시할 div 
								mapOption = {
									center : new kakao.maps.LatLng(37.123125,
											127.123124), // 지도의 중심좌표
									level : 12
								// 지도의 확대 레벨
								};

								var map = new kakao.maps.Map(mapContainer,
										mapOption); // 지도를 생성합니다

								// 지도를 클릭한 위치에 표출할 마커입니다
								var marker = new kakao.maps.Marker({
									// 지도 중심좌표에 마커를 생성합니다 
									position : map.getCenter()
								});
								// 지도에 마커를 표시합니다
								marker.setMap(map);

								// 지도에 클릭 이벤트를 등록합니다
								// 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
								kakao.maps.event
										.addListener(
												map,
												'click',
												function(mouseEvent) {

													// 클릭한 위도, 경도 정보를 가져옵니다 
													var latlng = mouseEvent.latLng;

													// 마커 위치를 클릭한 위치로 옮깁니다
													marker.setPosition(latlng);

													var message = '클릭한 위치의 위도는 '
															+ latlng.getLat()
															+ ' 이고, ';
													message += '경도는 '
															+ latlng.getLng()
															+ ' 입니다';

													var resultDiv = document
															.getElementById('clickLatlng');
													resultDiv.innerHTML = message;

													latitude = latlng.getLat()
													longitude = latlng.getLng()

													document
															.getElementById('latitude').value = latitude
													document
															.getElementById('longitude').value = longitude

												});
							</script>
						</div>
					</div>

					<br> <br> <input type="hidden" name="userid" id="userid"
						value="${w.userid }" /> <input type="submit" value="등록" />
				</form>
				<br>
				<button type="button" onclick="location.href = 'list'">목록으로</button>
				<br> <br>
			</div>
		</section>

	</div>
	<!--footer-->
	<footer>
		<div class="container">
			<div class="foot1">
				<h2>CLVOER</h2>
				<p>
					Web Address : <a
						href="https://katieyoon-the-developer.tistory.com/">https://katieyoon-the-developer.tistory.com/</a>
				</p>
			</div>
			<div class="foot2"></div>
			<nav class="foot3">
				<div>
					<h3>HELP</h3>
					<ul>
						<li><a href="#">Administrator</a></li>
						<li><a href="#">Frequently Asked Question(s)</a></li>
						<li><a href="#">Direct Calls</a></li>
					</ul>
				</div>

			</nav>
		</div>
	</footer>

</body>
</html>
















