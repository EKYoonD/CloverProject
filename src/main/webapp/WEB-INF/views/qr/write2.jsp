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
<html lang="ko">
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
<title>읽기</title>
</head>
<script>
	function chkDelete(uid) {
		// 삭제 여부, 다시 확인 하고 진행하기
		var r = confirm("삭제하시겠습니까?");

		if (r) {
			location.href = 'deleteOk?uid=' + uid;
		}
	} // chkDelete
</script>
<body>
	<!--header-->
	<header>
<section class="container1">
		<div class="container4">

			<h2>입력</h2>
			<form name="frm" action="writeOk" method="post"
				onsubmit="return chkSubmit()">
				<table>
					<tr>
						<th>이름</th>
						<td><input type="text" name="name" value="${m.name}" }/></td>
					</tr>
					<tr>
						<th>카테고리</th>
						<td><select class="select" id="category" name="category"
							style="width: 83%; height: 38px; border-radius: 10px; border: 3px solid #154360; text-align: center">
								<option value="부모님">부모님</option>
								<option value="아이"selected>아이</option>
								<option value="반려동물">반려동물</option>
						</select></td>
					</tr>
					<tr>
						<th>나이</th>
						<td><input type="text" name="age" value="${m.age}" /></td>

					</tr>
					<tr>
						<th>우편번호</th>
						<td><input type="text" class="postcode" id="sample4_postcode" ></td>

						<td><input type="button" class="button"
							onclick="sample4_execDaumPostcode()" value="우편번호 찾기" style="width: 130px; height: 40px; text-align:center;  font-size: 9pt; font-weight: bold; color: #138D75; background-color: #EAECEE; border: 2px solid black;"></td>
					</tr>
					<tr>
						<th>도로명주소</th>
						<td><input type="text" class="roadAddress"
							id="sample4_roadAddress" style="font-size:10pt;"></td>
					</tr>
			
					<tr>
						<th>상세주소</th>
						<td><input type="text" name="Address" class="detailAddress"
							id="sample4_detailAddress" style="font-size:10pt;">
							<input type="hidden" name="Address" class="jibunAddress"
							id="sample4_jibunAddress"> <span id="guide"
							style="color: #999; display: none"></span></td>
					</tr>

					<input type="hidden" class="extraAddress" id="sample4_extraAddress" >

					<tr>
						<input type="hidden" name="address" id="address" class="address"
							value="${m.address}" onkeyup='call()' />
						<th>보호자 전화번호</th>
						<td><input type="text" name="phone" value="${m.phone}" /></td>
					</tr>
					<tr>
					<th>특이사항</th>
					<td><textarea name="content">${m.content }</textarea></td>
					<input type="hidden" name="userid" id="userid" value="${m.userid }" style="width:400px" />
					</tr>
					</form>
				</table>
					<button type="submit" class="blue_button" value="QR만들기" />QR 만들기
		</div>
	</section>	<!--footer-->
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


















