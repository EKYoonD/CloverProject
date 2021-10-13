<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%--JSTL core Library --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.6.0.min.js"></script>
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gugi&display=swap"
	rel="stylesheet">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>main</title>

<link href="CSS/styleJoin.css" rel="stylesheet">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css"
	rel="stylesheet">
<script>
	function checks() {
		var getMail = RegExp(/\b[\w.!#$%&’*+\/=?^`{|}~-]+@[\w-]+(?:\.[\w-]+)*\b/);
		var getCheck = RegExp(/^[a-zA-Z0-9]{4,12}$/);
		var getPw = RegExp(/^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/);
		var getName = RegExp(/^[가-힣]{2,4}$/);
		var getPhone = RegExp(/^(01[016789]{1})\d{4}\d{4}$/);
		//아이디 공백 확인 
		if ($("#id").val() == "") {
			alert("아이디를 입력해주세요");
			$("#id").focus();
			return false;
		} //아이디 유효성검사 
		if (!getCheck.test($("#id").val())) {
			alert("아이디를 형식에 맞게 입력해주세요");
			$("#id").val("");
			$("#id").focus();
			return false;
		} //비밀번호 공백 확인 
		if ($("#pw").val() == "") {
			alert("비밀번호를 입력해주세요");
			$("#pw").focus();
			return false;
		} //비밀번호 유효성검사 
		if (!getPw.test($("#pw").val())) {
			alert("비밀번호를 형식에 맞게 입력해주세요");
			$("#pw").val("");
			$("#pw").focus();
			return false;
		} //이름 공백 검사 
		if ($("#name").val() == "") {
			alert("이름을 입력해주세요");
			$("#name").focus();
			return false;
		} //이름 유효성 검사 
		if (!getName.test($("#name").val())) {
			alert("이름형식에 맞게 입력해주세요")
			$("#name").val("");
			$("#name").focus();
			return false;
		}//주소 공백 확인 
		if ($("#addr3").val() == "") {
			alert("주소를 입력해주세요");
			return false;
		}//이메일 공백 확인 
		if ($("#email").val() == "") {
			alert("이메일을 입력해주세요");
			$("#email").focus();
			return false;
		} //이메일 유효성 검사 
		if (!getMail.test($("#email").val())) {
			alert("이메일형식에 맞게 입력해주세요")
			$("#email").val("");
			$("#email").focus();
			return false;
		}//휴대폰번호 공백 확인 
		if ($("#phone").val() == "") {
			alert("휴대폰 번호를 입력해주세요");
			$("#phone").focus();
			return false;
		} //휴대폰번호 유효성 검사 
		if (!getPhone.test($("#phone").val())) {
			alert("휴대폰 번호를 형식에 맞게 입력해주세요.")
			$("#phone").val("");
			$("#phone").focus();
			return false;
		}

		if ($("#idCheck").attr("value") == "N") {
			alert("아이디 중복확인을 해주세요.");
			return false;
		}

	}

	function fn_idCheck() {
		var id = $("#id").val();
		var getCheck = RegExp(/^[a-zA-Z0-9]{4,12}$/);

		if (id.length >= 4) {
			$.ajax({
				url : "/idCheck",
				type : "POST",
				dataType : "JSON",
				data : {
					"id" : $("#id").val()
				},
				success : function(data) {
					if (data == 1) {
						alert("중복된 닉네임입니다. 다른 아이디를 사용해주세요.");
						$("#id").val("");
						$("#id").focus();
						return false;
					} else if (data == 0) {
						$("#idCheck").attr("value", "Y");
						alert("사용 가능한 닉네임입니다.");
					}
				}
			})
		} else if (id.length < 4) {
			alert("4글자 이상 입력해주세요")
		} else if (!getCheck.test(id)) {
			alert("아이디를 형식에 맞게 입력해주세요");
			$(id).val("");
			$(id).focus();
			return false;
		}

	}
</script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
	function execPostCode() {
		new daum.Postcode({
			oncomplete : function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

				// 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
				var extraRoadAddr = ''; // 도로명 조합형 주소 변수

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
				// 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
				if (extraRoadAddr !== '') {
					extraRoadAddr = ' (' + extraRoadAddr + ')';
				}
				// 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
				if (fullRoadAddr !== '') {
					fullRoadAddr += extraRoadAddr;
				}

				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				console.log(data.zonecode);
				console.log(fullRoadAddr);

				$("[name=addr1]").val(data.zonecode);
				$("[name=addr2]").val(fullRoadAddr);

				/* document.getElementById('signUpUserPostNo').value = data.zonecode; //5자리 새우편번호 사용
				document.getElementById('signUpUserCompanyAddress').value = fullRoadAddr;
				document.getElementById('signUpUserCompanyAddressDetail').value = data.jibunAddress; */
				document.getElementById('address').value = fullRoadAddr;
			}
		}).open();
	}
</script>

</head>
<body>
	<br>
	<!--header-->
	<div id="joindiv">
		<header>
			<h1>회원가입</h1>
		</header>
		<br><br>
		<form name="frm" action="/joinOk" method="POST"
			onsubmit="return checks()">
			<table>
				<tr>
					<th>아이디</th>
					<td><input type="text" name="id" id="id"
						placeHolder="4~12자의 영문 대소문자와 숫자로만 입력해주세요" class="input-box login"
						style="ime-mode: disable;" /><br></td>
					<td><input type="hidden" name="idChk" value="N">
						<button type="button" name="idCheck" id="idCheck"
							onclick="fn_idCheck();" value="N"
							style="width: 90px; height: 40px; font-size: 9pt; font-weight: bold; color: #138D75; background-color: #EAECEE; border: 3px solid black; margin: 0 -20px 0 -30px; padding: 0 0 0 0;">중복확인</button></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" name="pw" id="pw"
						placeHolder="특수문자 / 문자 / 숫자 포함 형태의 8~15자리" /><br></td>
				</tr>
				<tr>
					<th>이름</th>
					<td><input type="text" name="name" id="name"
						placeHolder="이름을 입력해주세요" /><br></td>
				</tr>
				<!--  
				<tr>
					<td>주소</td>
					<td><input type="text" name="address" id="address"
						placeHolder="주소를 입력해주세요" /></td>
				</tr>
				-->
				<tr>
					<th>주소</th>
					<td>
						<div class="form-group" >
							<input class="form-control"
								style=" margin: 5px 0px 5px 0px;"
								placeholder="우편번호" name="addr1" id="addr1" type="text"
								readonly="readonly">
							<button type="button" class="btn btn-default"
								onclick="execPostCode();"
								style="position:fixed;  width: 130px; height: 40px; text-align:center;  font-size: 9pt; font-weight: bold; color: #138D75; background-color: #EAECEE; border: 3px solid black; 
								margin: 5px 50px 5px 10px;" >
								<i class="fa fa-search"></i> 우편번호 찾기
							</button>
						</div>
						<div class="form-group">
							<input class="form-control2" placeholder="도로명 주소" name="addr2"
								id="addr2" type="text" readonly="readonly" style="font-size:10pt; margin: 7px 0px 12px 0px; "/>
						</div>
						<div class="form-group">
							<input class="form-control2" placeholder="상세주소" name="addr3"
								id="addr3" type="text" style="font-size:10pt; margin: 0 0px 5px 0px;"/> <input type="hidden" name="address"
								id="address" />
						</div>
					</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td><input type="text" name="email" id="email"
						placeHolder="이메일을 입력해주세요" /></td>
				</tr>
				<tr>
					<th>휴대폰번호</th>
					<td><input type="text" name="phone" id="phone"
						placeHolder="'-'를 제외하고 입력해주세요" maxlength="11" /></td>
				</tr>
			</table>
			<br>
			<div id="join">
				<button type="submit" value="회원가입" >제출</button>
			</div>
		</form>
	</div>
	<br>
	<br>
</body>
</html>