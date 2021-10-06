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

<link href="CSS/styleJoin.css" rel="stylesheet">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css"
	rel="stylesheet">
<body>
	<!--header-->
	<header>
		<h1>로그인</h1>
	</header>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<form name='frm' action="/loginOk" method="POST">
		<table>
			<tr>
				<td>아이디</td>
				<td><input type="text" name="userid" placeholder="아이디 입력" /></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="password"
					placeholder="패스워드 입력" /></td>
			</tr>
		</table>
		<button>로그인</button>

	</form>
	<br>
	<form name='frm2' action="/join" method="get">
		<button>회원가입</button>
	</form>

<script>
function loginChk() {
    var form = document.frm;
    if (!form.userid.value) {
        alert("아이디를 입력해 주십시오.");
        form.userid.focus();
        return;
    }
 
    if (!form.password.value) {
        alert("비밀번호를 입력해 주십시오.");
        form.password.focus();
        return;
    }
}
</script>


</body>


</html>
