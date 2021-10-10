<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

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

<link href="/CSS/styleQr.css" rel="stylesheet">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>글작성</title>
<script src="${pageContext.request.contextPath }/ckeditor/ckeditor.js"></script>
</head>

<body>
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
					<li><a onclick="location.href='../qr'">MY QR</a></li>
					<li><a onclick="location.href='../qr/qrlist'">ORDER</a></li>
					<li><a onclick="location.href='../board/list'">FIND &
							FOUND</a></li>
					<sec:authorize access="isAnonymous()">

						<a href="<c:url value="/login2" />" id="loginOut">LOGIN</a>

					</sec:authorize>
					<sec:authorize access="isAuthenticated()">

						<a href="<c:url value="/mypage" />" id="MyPage">MYPAGE</a>
						<a href="<c:url value="/logout" />" id="logOut">LOGGOUT</a>

					</sec:authorize>
					<sec:authorize access="hasRole('ROLE_ADMIN')">
						<a href="<c:url value="clover/admin/main" />" id="admin">ADMIN</a>
					</sec:authorize>
				</ul>
			</nav>
		</div>
	</header>
	<section class="container1">
		<div class="container4">
			<h2>QR</h2>
			<br> <img
				src="qrcode/이름: ${list[0].name }%0A	
				종류 :${list[0].category}%0A
				나이:${list[0].age }%0A
				주소: ${list[0].address }%0A
				보호자 연락처: ${list[0].phone }%0A
				내용:${list[0].content }  " />





			<br> <br> <br> <br> <br> <br> <br><br>
			<button onclick="location.href='update?uid=${list[0].uid }'"
				class="blue_button1">수정하기</button>
			<button onclick="location.href='download'" class="blue_button1">다운로드</button>
			<button onclick="location.href='../order?uid=${param.uid}'"
				class="blue_button1">주문하기</button>
			<button onclick="location.href='/main'" class="blue_button1">메인</button>
			<!-- <button onclick="location.href='write'">신규등록</button>-->
			<!--  <button onclick="location.href='qrlist'">목록</button>-->
		</div>
	</section>
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
















