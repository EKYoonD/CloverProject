<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


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
		<link href="https://fonts.googleapis.com/css2?family=Gugi&display=swap" rel="stylesheet">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<title>main</title>
		
		<link href="/CSS/styleQr.css" rel="stylesheet">
		<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
		<title>읽기</title>
		</head>
		<script>
		
		function chkDelete(uid){
			// 삭제 여부, 다시 확인 하고 진행하기
			var r = confirm("삭제하시겠습니까?");
			
			if(r){
				location.href = 'deleteOk?uid=' + uid;
			}
		} // chkDelete
		
		</script>
		<body>	
		<!--header-->
    			<header>
			        <div class="container">
			            <div class="head1">
			                <a  onclick="location.href='../../../../main'"><i class="fas fa-home"></i></a>
			                <span class="head3"><i class="far fa-caret-square-down"></i></span>
			            </div>
			            <nav class="head2">
			                <ul>
			                    <li><a onclick="location.href='../../../../about'">CLVOER</a></li>
			                    <li><a onclick="location.href='../qr'">MY QR</a></li>
			                    <li><a onclick="location.href='../order'">ORDER</a></li>
			                    <li><a onclick="location.href='../board/list'">FIND & FOUND</a></li>
			                    <li><a onclick="location.href='login'">JOIN</a></li>
			                </ul>
			            </nav>
			        </div>
			    </header>
			<section class="container1">
			<div  class="container4"  >
		
<h2> QR 일련번호 입력</h2>
<form name="frm" action="writeOk" method="post" onsubmit="return chkSubmit()">
QR 일련번호를 입력해주세요
<br><br><br>
<input type="text" name="name" value ="${m.uid}" }/><br>

<input type="hidden" name="userid" id="userid" value="${m.userid }"/>
<br><br>
<input type="submit" class="blue_button" value="QR만들기"/>
</form>
<br>
  </div>
    </section>
		<!--footer-->
		    <footer>
		        <div class="container">
		            <div class="foot1">
		                <h2>CLVOER</h2>
		                <p>
		                    Web Address : <a href="https://katieyoon-the-developer.tistory.com/">https://katieyoon-the-developer.tistory.com/</a>
		                </p>
		            </div>
		            <div class="foot2">
		
		            </div>
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
				

















