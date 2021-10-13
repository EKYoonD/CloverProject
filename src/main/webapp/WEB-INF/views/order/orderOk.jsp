<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
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
<title>주문 확인</title>

<link href="/CSS/styleOrder.css" rel="stylesheet">
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
<section class="container13">
<div class="order_div_success">
		<h2>주문 확인</h2>
		
		<br><br>
			주문 정보가 입력 되었습니다. <br>
			<br><br>
			<div style=" padding: 30px 15px; border-radius: 15px; margin: auto; width:700px; background-color: lightgrey;">
			<table class="success">
			<tr>
				<th>주문번호</th>
				<th>:</th>
				<th>${info[0].partner_order_id }</th>
			</tr>
			<tr>
				<th>수령인</th>
				<th>:</th>
				<th>${info[0].order_Rec}</th>
			</tr>
			<tr>
				<th>연락처</th>
				<th>:</th>
				<th>${info[0].order_Phone}</th>
			</tr>
			<tr>	
				<th>상품수량</th>
				<th>:</th>
				<th>${info[0].quantity}</th>
			</tr>
			<tr>
				<th>결제금액</th>
				<th>:</th>
				<th>${info[0].total_amount}</th>
			</tr>
			<tr>
				<th>주소</th> 
				<th>:</th>
				<th>${info[0].address}</th>
			</tr>
			</table>
			</div>
		<br>
<br>		

<form method="POST" name='aaa' action="../../clover/member/kakaoPay">

<input type="hidden" name="partner_order_id" type="text" value="${dto.partner_order_id}" />
<button class="button">결제하기</button>
<input type="button" onclick="location.href='../../../clover/member/qr/qrlist'" class="button" value="취소"/>
</form>
</div>
</section>
<%-- 위에서 필요한 트랜잭션이 마무리 되면 페이지 만들어주기 
<c:choose>
	<c:when test="${result == 0 }">
		<script>
			alert("주문 실패");
			history.back();  
		</script>	
	</c:when>
	<c:otherwise>
		<script>
			alert("주문 성공, 결제 페이지로 이동합니다.");
			document.forms['aaa'].submit();	
		</script>	
	</c:otherwise>
</c:choose>
--%>

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
		<br> <br>
	</footer>
</body>
</html>