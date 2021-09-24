<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<body>
	<h1>로그인 페이지</h1>
	<form name='frm' action="/loginOk" method="POST">
		<%-- loginProcessingUrl() 로 세팅한 url, 반드시 POST! --%>
		<%-- 일단 아이디/패스워드 의 name 은 'username' 과 'password' 로 하자 (시큐리티의 디폴트) --%>
		<%-- 만약 다른 name  을 사용하려면 SecurityConfig 에서 .usernameParameter("userid") 해주면 된다 --%>
		<input type="text" name="userid" placeholder="아이디 입력"  /><br> 
		<input type="password" name="password" placeholder="패스워드 입력" /><br>
		<button>로그인</button>
		<a href="/join">회원가입</a>
	</form>
<!-- 카카오톡 아이디 연동해서 로그인 -->
<script src = "//developers.kakao.com/sdk/js/kakao.min.js"></script>  
<form name='frm2' action="/loginOk" method="POST">
<input type="button" onclick="kakaoLogin();">카카오 로그인
      <a href="javascript:void(0)" >
      </a>
      <input type="button" onclick="kakaoLogout();"">카카오 로그아웃
      <a href="javascript:void(0)" >
      </a>
</form>
<!-- 카카오 스크립트 -->
<script>
Kakao.init('333e610469778fbd980fed8b219836c5'); //발급받은 키 중 javascript키를 사용해준다.
console.log(Kakao.isInitialized()); // sdk초기화여부판단
//카카오로그인
function kakaoLogin() {
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


</html>
