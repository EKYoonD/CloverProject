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
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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

			<h2>입력</h2>
			<form name="frm" action="writeOk" method="post"
				onsubmit="return chkSubmit()">
				<table>
					<tr>
						<th>이름</th>
						<td><input type="text" name="name" value="${m.name}" /></td>
					</tr>
					<tr>
						<th>카테고리</th>
						<td><select class="select" id="category" name="category" 
							style="width: 83%; height: 38px; border-radius: 10px; border: 3px solid #154360; font-size:20pt; text-align: center">
								<option value="부모님"  selected >부모님</option>
								<option value="아이">아이</option>
								<option value="반려동물">반려동물</option>
						</select></td>
					</tr>
					<tr>
						<th>나이</th>
						<td><input type="text" name="age" value="${m.age}" placeHolder="'-'를 제외하고 입력해주세요" maxlength="11" /></td>

					</tr>
					<tr>
						<th>우편번호</th>
						<td><input type="text" class="postcode" id="sample4_postcode" ></td>

						<td><input type="button" class="button"
							onclick="sample4_execDaumPostcode()" value="우편번호 찾기" style="width: 130px; height: 40px; text-align:center;  font-size: 9pt; font-weight: bold; color: #138D75; background-color: #EAECEE; border: 2px solid black;"></td>
					</tr>
					<tr>
						<th>도로명주소</th>
						<td><input type="text" name="Address"class="roadAddress"
						
							id="sample4_roadAddress" style="font-size:14pt;"></td>
					</tr>
			
					<tr>
						<th>상세주소</th>
						<td><input type="text" name="Address" class="detailAddress"
							id="sample4_detailAddress" style="font-size:13pt;">
							<input type="hidden" name="Address" class="jibunAddress"
							id="sample4_jibunAddress"> <span id="guide"
							style="color: #999; display: none; font-size:13pt;" ></span></td>
					</tr>
<tr><th>
					<input type="hidden" class="extraAddress" id="sample4_extraAddress" >

					
						<input type="hidden" name="address" id="address" class="address"
							value="${m.address}" onkeyup='call()' />
						보호자 전화번호</th>
						<td><input type="text" name="phone" value="${m.phone}" placeHolder="'-'를 제외하고 입력" maxlength="11"/></td>
					</tr>
					<tr>
					<th>특이사항</th>
					<td><textarea name="content" style= font-size:15pt;>${m.content }</textarea>
					<input type="hidden" name="userid" id="userid" value="${m.userid }" style="width:400px" /></td>
					</tr>
					
				</table>
					<button type="submit" class="button" value="QR만들기" >QR 만들기
					</form>
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














