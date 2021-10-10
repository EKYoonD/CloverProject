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
<link href="https://fonts.googleapis.com/css2?family=Gugi&display=swap"
	rel="stylesheet">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Admin</title>

<link href="/CSS/styleAdmin.css" rel="stylesheet">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<h1>관리자 페이지</h1>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<div>
	<form name='frm2' action="/clover/admin/userlist" method="get">
		<input type="submit" value="유저정보">
	</form>
	<form name='frm2' action="/clover/admin/qrlist" method="get">
		<input type="submit" value="QR정보">
	</form>
	<form name='frm2' action="/clover/admin/boardlist" method="get">
		<input type="submit" value="게시판정보">
	</form>
	<form name='frm2' action="/clover/admin/orderlist" method="get">
		<input type="submit" value="주문정보">
	</form>
</div>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<!--footer-->
<footer>
	<div class="container">
		<div class="foot1">
			<h2>CLVOER</h2>
			<p>
				Web Address : <a href="https://katieyoon-the-developer.tistory.com/">https://katieyoon-the-developer.tistory.com/</a>
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