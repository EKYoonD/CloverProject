<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
</head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gugi&display=swap"
	rel="stylesheet">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>main</title>

<link href="CSS/styleLogin.css" rel="stylesheet">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css"
	rel="stylesheet">
<body>
<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
<div id="logindiv">
	
		<header>
			<h1>로그인</h1>
		</header>
		<br> <br> <br> <br> <br>
		<div class="overlay">
			<form name='frm' action="/loginOk" method="POST"
				onsubmit="return loginChk();">
				<div class="input-box">
					<input type="text" name="userid" placeholder="아이디"> <label
						for="userid">아이디</label>
				</div>
				<br>
				<div class="input-box">
					<input type="password" name="password" placeholder="비밀번호">
					<label for="password">비밀번호</label>
				</div>
				<br> <br><br>
				<input type="submit" value="로그인">
			</form>
			<form name='frm2' action="/join" method="get">
				<input type="submit" value="회원가입">
			</form>
			<div id="kakao">
				<a href="/oauth2/authorization/kakao"><img
					src="img/kakao_login_large_wide.png"></a> <br> <br>
				<br> <br>
			</div>
		</div>
		<br> <br> <br> <br>
	</div>

</body>


<script>
	function loginChk() {
		var form = document.frm;
		if (!form.userid.value) {
			alert("아이디를 입력해 주십시오.");
			form.userid.focus();
			return false;
		}

		if (!form.password.value) {
			alert("비밀번호를 입력해 주십시오.");
			form.password.focus();
			return false;
		}

	}
</script>

</body>
</html>