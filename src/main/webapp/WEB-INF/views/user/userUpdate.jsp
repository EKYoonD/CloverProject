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
		<div class="container4">
	<!--header-->
	<div id="memberupdatediv">
		
			<h2>회원정보수정</h2>
		
		<br> <br>
		<form name="frm" action="/clover/member/userupdateok" method="POST"
			onsubmit="return checks()">
			<table>
				<tr>
					<td>아이디</td>
					<td><input type="text" name="id" id="id"
						value = ${list.id } class="input-box login"
						style="ime-mode: disable;" disabled/><br></td>
					<td><input type="hidden" name="idChk" value="N"></td>
						
							

				</tr>
				
				<tr>
					<td>이름</td>
					<td><input type="text" name="name" id="name" 
						value = ${list.name } /><br></td>
				</tr>
				<tr>
					<td>주소</td>
					<td><input type="text" name="address" id="address"
						value = ${list.address } /></td>
				</tr>
				<tr>
					<td>이메일</td>
					<td><input type="text" name="email" id="email"
						value =${list.email } /></td>
				</tr>
				<tr>
					<td>휴대폰번호</td>
					<td><input type="text" name="phone" id="phone"
						value = ${list.phone } /></td>
				</tr>
			</table>
			<br> <br> <br> <br>
			<div id="memberpdate">
				<button type="submit" value="수정">수정</button>
			</div>
		</form>
		<br>
		</div>
		<!--<input type="hidden" name="userid" id="userid" value="${list.id }" />-->
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












