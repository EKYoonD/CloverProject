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
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	$(function() {
		$('.head3').click(function() {
			$('.head2').slideToggle();
		})
	})
</script>
<script>
	function sample4_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var roadAddr = data.roadAddress; // 도로명 주소 변수
						var extraRoadAddr = ''; // 참고 항목 변수

						// 법정동명이 있을 경우 추가한다. (법정리는 제외)
						// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
						if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
							extraRoadAddr += data.bname;
						}
						// 건물명이 있고, 공동주택일 경우 추가한다.
						if (data.buildingName !== '' && data.apartment === 'Y') {
							extraRoadAddr += (extraRoadAddr !== '' ? ', '
									+ data.buildingName : data.buildingName);
						}
						// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
						if (extraRoadAddr !== '') {
							extraRoadAddr = ' (' + extraRoadAddr + ')';
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('sample4_postcode').value = data.zonecode;
						document.getElementById("sample4_roadAddress").value = roadAddr;
						document.getElementById("sample4_jibunAddress").value = data.jibunAddress;

						// 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
						if (roadAddr !== '') {
							document.getElementById("sample4_extraAddress").value = extraRoadAddr;
						} else {
							document.getElementById("sample4_extraAddress").value = '';
						}

						var guideTextBox = document.getElementById("guide");
						// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
						if (data.autoRoadAddress) {
							var expRoadAddr = data.autoRoadAddress
									+ extraRoadAddr;
							guideTextBox.innerHTML = '(예상 도로명 주소 : '
									+ expRoadAddr + ')';
							guideTextBox.style.display = 'block';

						} else if (data.autoJibunAddress) {
							var expJibunAddr = data.autoJibunAddress;
							guideTextBox.innerHTML = '(예상 지번 주소 : '
									+ expJibunAddr + ')';
							guideTextBox.style.display = 'block';
						} else {
							guideTextBox.innerHTML = '';
							guideTextBox.style.display = 'none';
						}
					}
				}).open();
	}

	$(function() {
		$("input").on("keyup", function() {
			var str = $("input[name^='Address']:visible").map(function() {
				return $(this).val();
			}).get().join(" ");
			$("#address").val(str);
		});
	});
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
				<br> <br><br> <br><br> <br><br> <br><br> <br><br> <br>
				<h2 style="font-size: 35px">PERSONAL INFORMATION UPDATE</h2>

				<br> <br>
				<form name="frm" action="/clover/member/userupdateok" method="POST"
					onsubmit="return checks()">
					<table>
						<tr>
							<th>아이디</th>
							<td>${list.id }<input type="hidden" name="id" id="id"
								value=${list.id } class="input-box login"
								style="ime-mode: disable;" /> <input type="hidden" name="idChk"
								value="N"></td>
							<td></td>
						</tr>
						<tr>
							<th>이름</th>
							<td><input type="text" name="name" id="name"
								value=${list.name } /><br></td>
							<td></td>
						</tr>
						<tr>
							<th>주소</th>
							<td><input type="text" name="postcode" class="postcode"
								id="sample4_postcode"> <input type="hidden"
								name="address" id="address" value="${list.address}"
								onkeyup='call()'/></td>
							<td><input type="button" class="button"
								onclick="sample4_execDaumPostcode()" value="우편번호 찾기"
								style="width: 130px; height: 40px; text-align: center; font-size: 9pt; font-weight: bold; color: #138D75; background-color: #EAECEE; border: 2px solid black;"></td>
						</tr>
						<tr>
							<th>도로명주소</th>
							<td><input type="text" name="Address" class="roadAddress"
								id="sample4_roadAddress" style="font-size: 10pt;"></td>
							<td></td>
						</tr>

						<tr>
							<th>상세주소</th>
							<td><input type="text" name="Address" class="detailAddress"
								id="sample4_detailAddress" style="font-size: 10pt;"> <input
								type="hidden" name="jibunAddress" class="jibunAddress"
								id="sample4_jibunAddress"> <span id="guide"
								style="color: #999; display: none"></span></td>
							<td></td>
						</tr>
						<tr>
							<th>이메일</th>
							<td><input type="text" name="email" id="email"
								value=${list.email } /></td>
							<td></td>
						</tr>
						<tr>
							<th>휴대폰번호</th>
							<td><input type="text" name="phone" id="phone"
								value=${list.phone } /></td>
							<td></td>
						</tr>
						<tr>
							<th>수정여부</th>
							<td>
								<div id="memberpdate">
									<button class="button" type="submit" value="수정">수정완료</button>
								</div>
							</td>
							<td></td>
						</tr>
					</table>
					<br> <br> <br> <br>
					<input type="hidden" class="extraAddress" id="sample4_extraAddress">
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