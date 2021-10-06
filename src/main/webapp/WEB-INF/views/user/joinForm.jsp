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
		if ($("#address").val() == "") {
			alert("주소를 입력해주세요");
			$("#address").focus();
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
	}
</script>
</head>
<body>
	<br>
	<br>
	<br>
	<br>
	<br>
	<!--header-->
	<div id="joindiv">
		<header>
			<h1>회원가입</h1>
		</header>
		<br> <br>
		<form name="frm" action="/joinOk" method="POST"
			onsubmit="return checks()">
			<table>
				<tr>
					<td>아이디</td>
					<td><input type="text" name="id" id="id"
						placeHolder="4~12자의 영문 대소문자와 숫자로만 입력해주세요" /><br></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="pw" id="pw"
						placeHolder="특수문자 / 문자 / 숫자 포함 형태의 8~15자리" /><br></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" name="name" id="name"
						placeHolder="이름을 입력헤주세요" /><br></td>
				</tr>
				<tr>
					<td>주소</td>
					<td><input type="text" name="address" id="address"
						placeHolder="주소를 입력해주세요" /></td>
				</tr>
				<tr>
					<td>이메일</td>
					<td><input type="text" name="email" id="email"
						placeHolder="이메일을 입력해주세요" /></td>
				</tr>
				<tr>
					<td>휴대폰번호</td>
					<td><input type="text" name="phone" id="phone"
						placeHolder="'-'를 제외하고 입력해주세요" maxlength="11" /></td>
				</tr>
			</table>
			<br> 
			<br>
			<br>
			<br>
			<button type="submit" value="회원가입">회원가입</button>
		</form>
	</div>
	<br>
	<br>
	<br>
	<br>
	<br>

</body>
</html>