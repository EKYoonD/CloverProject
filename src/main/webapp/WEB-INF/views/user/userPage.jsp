<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<title>MyPage</title>
<!-- 스타일, js 라이브러리 -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/CSS/styleMyPage.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://kit.fontawesome.com/bb29575d31.js"></script>
<script>
	$(function() {
		$('.head3').click(function() {
			$('.head2').slideToggle();
		})
	})
</script>
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
		<div class="container">
			<input type="hidden" name="userid" id="userid" value="${list.id }" />
			<h2 style="font-size: 35px;">PERSONAL INFORMATION</h2>
			<br>
			<br>
			<br>
			<br>
			<table>
				<tr>
					<th>이름</th>
					<td>${list.name }</td>
				</tr>
				<tr>
					<th>아이디</th>
					<td>${list.id }</td>
				</tr>
				<tr>
					<th>주소</th>
					<td>${list.address }</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td>${list.email }</td>
				</tr>
				<tr>
					<th>휴대폰번호</th>
					<td>${list.phone }</td>
				</tr>
				<tr>
					<th>수정하기</th>
					<td>
						<button
							onclick="location.href='../member/userupdate?id=${list.id}'"
							class="button">수정</button>
					</td>
				</tr>
			</table>
		</div>
		<!--  -->
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