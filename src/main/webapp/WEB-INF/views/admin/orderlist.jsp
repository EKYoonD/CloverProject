<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gugi&display=swap"
	rel="stylesheet">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<title>ADMIN USERS</title>

<!-- 스타일, js 라이브러리 -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/CSS/styleList.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://kit.fontawesome.com/bb29575d31.js"></script>
<script src="${pageContext.requd2">
					<ul>
						<li><a oest.contextPath }/JS/orderboard.js"></script>
</head>
<body>
	<div id="body-wrapper"
		style="min-height: 100%; padding-bottom: 300px; padding-top: 10px">
		<!--header-->
		<header>
			<div class="container">
				<div class="head1">
					<a onclick="location.href='../../../../main'"><i
						class="fas fa-home"></i></a> <span class="head3"><i
						class="far fa-caret-square-down"></i></span>
				</div>
				<nav class="heanclick="location.href='../../../../about'">CLVOER</a></li>
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
		<br> <br> <br> <br> <br>
		<section class="container1">
			<div class="container">
				<h2 style="font-size: 40px;">ADMINISTER ORDER INFORMATION</h2>
				<%-- 글 목록 --%>
				<div id="list">
					<%-- header 헤더 --%>
					<div class="d01">
						<div class="left" id="pageinfo"></div>
						<div class="right" id="pageRows"></div>
					</div>
					<div class="clear"></div>
					<br>
					<%-- 목록 --%>
					<form id="frmList" name="frmList">
						<table>
							<thead>
								<th></th>
								<th>주문 고유번호</th>
								<th>수령자</th>
								<th>수령자 핸드폰 번호</th>
								<th>주문 수량</th>
								<th>총 금액</th>
								<th>수령 주소지</th>
								<th>QR 옵션</th>
								<th>주문한 QR 일련번호</th>
								<th>주문한 사람 아이디</th>
							</thead>
							<tbody>
							</tbody>

						</table>
					</form>
					<br> <br>
					<%-- bottom 버튼 --%>
					<div class="d01">
						<div class="left"></div>
						<div class="right">
							<button style="border-radius: 10px" type="button" id="btnDel"
								class="btn danger">주문 삭제 (취소)</button>
						</div>
					</div>

				</div>
				<div class="clear"></div>

				<%-- [페이징] --%>
				<div class="center">
					<ul class="pagination" id="pagination"></ul>
				</div>

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


















