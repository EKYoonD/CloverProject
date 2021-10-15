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
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Gugi&display=swap"
	rel="stylesheet">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>main</title>

<link href="/CSS/styleWriteNotice.css" rel="stylesheet">
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
				<h2 h2 style="font-size: 35px">공지사항 작성</h2>
				<form name="frm" action="writeNoticeOk" method="post"
					onsubmit="return chkSubmit()">

					<table>
						<tr><th>&nbsp &nbsp&nbsp &nbsp &nbsp &nbsp  카테고리 &nbsp</th>
						<td><select class="select" id="category" name="category"
							style="width: 170px;">
								<option value="공지사항">공지사항</option>
						</select></td>
						</tr>
						<tr><th>&nbsp &nbsp 제목 &nbsp</th>
						<td><input type="text" name="subject"
						value="${w.subject }" /></td>
						</tr>
					</table><br><br>

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
					<br> <br> <input type="hidden" name="userid" id="userid"
						value="${w.userid }" /> <input type="submit" class="button"
						value="등록" />

				</form>
				<br>
				<button type="button" class="button"
					onclick="location.href = 'list'">목록으로</button>
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
















