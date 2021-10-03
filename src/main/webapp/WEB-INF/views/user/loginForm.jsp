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
	<!-- 	<button type="button" class="btnSubmit" onclick="loginChk()">로그인</button> -->

	</form>
	<br>
	<form name='frm2' action="/join" method="get">
		<button>회원가입</button>
	</form>

	<ul>
		<li onclick="kakaoLogin();">
		<img src="/img/kakao_login_medium_narrow.png">
		 <a href="javascript:void(0)"> </a>
		</li>
	</ul>

<ul>
	<li onclick="kakaoLogout();">
      <a href="javascript:void(0)">
          <span>카카오 로그아웃</span>
      </a>
	</li>
</ul>

<a href="/oauth2/authorization/kakao">카카오 아이디로 로그인</a>

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


<!-- 카카오 스크립트 -->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script>
Kakao.init('333e610469778fbd980fed8b219836c5'); //발급받은 키 중 javascript키를 사용해준다.
console.log(Kakao.isInitialized()); // sdk초기화여부판단
//카카오로그인
function kakaoLogin2() {
    Kakao.Auth.login({
      success: function (response) {
        Kakao.API.request({
          url: '/v2/user/me',
          success: function (response) {
        	  console.log(response)
          },
          fail: function (error) {
            console.log(error)
          },
        })
      },
      fail: function (error) {
        console.log(error)
      },
    })
  }
//카카오로그아웃  
function kakaoLogout() {
    if (Kakao.Auth.getAccessToken()) {
      Kakao.API.request({
        url: '/v1/user/unlink',
        success: function (response) {
        	console.log(response)
        },
        fail: function (error) {
          console.log(error)
        },
      })
      Kakao.Auth.setAccessToken(undefined)
    }
  }  
</script>
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	<script>
		//카카오로그인
		function kakaoLogin() {

			$.ajax({
				url : '/login/getKakaoAuthUrl',
				type : 'get',
				async : false,
				dataType : 'text',
				success : function(res) {
					location.href = res;
				}
			});

		}

		$(document).ready(
				function() {

					var kakaoInfo = '${kakaoInfo}';

					if (kakaoInfo != "") {
						var data = JSON.parse(kakaoInfo);

						alert("카카오로그인 성공 \n accessToken : "
								+ data['accessToken']);
						alert("user : \n" + "email : " + data['email']
								+ "\n nickname : " + data['nickname']);
					}
				});
	</script>

</body>


</html>
