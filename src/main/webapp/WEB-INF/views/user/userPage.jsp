<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=
Gugi&display=swap"
	rel="stylesheet">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>mypage</title>
<script src="${pageContext.request.contextPath }/JS/mypage.js"></script>
<link href="/CSS/styleMypage.css" rel="stylesheet">
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
				<a onclick="location.href='main'"><i class="fas fa-home"></i></a> <span
					class="head3"><i class="far fa-caret-square-down"></i></span>
			</div>
			<nav class="head2">
				<ul>
					<li><a onclick="location.href='about'">CLVOER</a></li>
					<li><a onclick="location.href='clover/member/qr/write'">MY
							QR</a></li>
					<li><a onclick="location.href='clover/member/order'">ORDER</a></li>
					<li><a onclick="location.href='clover/member/board/list'">FIND
							& FOUND</a></li>
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
		<div href class="container">
			<h2>내정보</h2>
			<%-- 글 목록 --%>
			<div id="list" style="width:1000px">
				<%-- header 헤더 --%>
				<div class="d01">
					<div class="left" id="pageinfo"></div>
					<div class="right" id="pageRows"></div>
				</div>
				<div class="clear"></div>

				<br>
				<%-- 목록 --%>
				<form id="frmList" name="frmList">
					<div id="container1_table">
						<table>
							<thead>
								<th>아이디</th>
								<th>이름</th>
								<th>이메일</th>
								<th>주소</th>
								<th>휴대폰번호</th>
							</thead>
							<tbody>
							</tbody>
						</table>
					</div>
				</form>
				<br> <br>


			</div>
			<div class="clear"></div>

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