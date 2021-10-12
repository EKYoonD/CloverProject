<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gugi&display=swap"
	rel="stylesheet">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>main</title>

<link href="/CSS/styleAbout.css" rel="stylesheet" type='text/css'>
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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

	<!-- 컨텐츠A -->
	<section class="conA">
		<div class="container explanation">
			<!-- 히어로 이미지 -->
			<h2 style="font-size: 40px">CLOVER는 여러분의 가족이 최우선입니다</h2>
			<p>CLOVER는 우리가족찾기 QR 서비스를 통해 여러분들이 소중한 가족을 잃었을 때, 가족을 최대한 빠른 시간에
				찾을 수 있도록 최고의 서비스를 제공합니다. 가족을 잃어버렸을 때의 막막함, CLOVER에서
				해결해드리겠습니다.</p>
		</div>
	</section>

	<!-- 컨텐츠B -->
	<section class="conB">
		<div style="width: 100%; height: auto;" class="container">
			<!-- 개요 (이이콘 + 텍스트) -->
			<div class="text">
				<h2>부모님 찾기 QR</h2>
				<img style="width: 100%; height: auto; border-radius: 30px;"
					src="/img/family_mom2.jpg"> <br> <br>
				<p>사랑하는 부모님 QR 만들기</p>
				<a onclick="location.href='clover/member/qr/write'"> GO <span
					class="fa fa-chevron-right"></span>
				</a>
			</div>

			<div class="text">
				<h2>내 아이 찾기 QR</h2>
				<img style="width: 100%; height: auto; border-radius: 30px;"
					src="/img/family_child2.jpg"> <br> <br>
				<p>귀여운 우리집 꼬맹이 QR 만들기</p>
				<a onclick="location.href='clover/member/qr/write2'">GO <span
					class="fa fa-chevron-right"></span>
				</a>
			</div>

			<div class="text">
				<h2>반려동물 찾기 QR</h2>
				<img style="width: 100%; height: auto; border-radius: 30px;"
					src="/img/family_dog2.jpg"> <br> <br>
				<p>우리 집 막내 QR 만들기</p>
				<a onclick="location.href='clover/member/qr/write3'">GO <span
					class="fa fa-chevron-right"></span>
				</a>
			</div>
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