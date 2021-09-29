<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--JSTL core Library --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- JSTL Functions Library --%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!-- 번잡함이 사라짐..! -->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gugi&display=swap" rel="stylesheet">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>main</title>

<link href="/CSS/styleBoard.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(function(){
		$('.head3').click(function(){
			$('.head2').slideToggle();
		})
	})
</script>
<title>목록</title>
<style>
table {width: 100%;}
table, th, td {
	border: 1px solid black;
	border-collapse: collapse;
	background-color: whitesmoke;
}

th, td {
	margin: 30px;
	padding: 10px;
}

</style>
</head>
<body>
	<!--header-->
    <header>
        <div class="container">
            <div class="head1">
                <a  onclick="location.href='main'"><i class="fas fa-home"></i></a>
                <span class="head3"><i class="far fa-caret-square-down"></i></span>
            </div>
            <nav class="head2">
                <ul>
                    <li><a onclick="location.href='../about'">CLVOER</a></li>
                    <li><a onclick="location.href='../qr'">MY QR</a></li>
                    <li><a onclick="location.href='../order'">ORDER</a></li>
                    <li><a onclick="location.href='../board/list'">FIND & FOUND</a></li>
                    <li><a onclick="location.href='../login'">JOIN</a></li>
                </ul>
            </nav>
        </div>
    </header>

	<!--contents-->
    <!--content1-->
    <section class="container1">
        <div href class="container">
			<h2>FIND & FOUND</h2>
			<table>
				<tr>
					<th>uid</th>
					<th>제목</th>
					<th>작성자</th>
					<th>조회수</th>
					<th>등록일</th>
				</tr>
				<c:choose>
					<c:when test="${empty list || fn:length(list)==0 }">
					</c:when>
					<c:otherwise>
						<c:forEach var="dto" items="${list }">
						<tr>
								<td>${dto.uid }</td>
								<td><a href="view?uid=${dto.uid }">${dto.subject }</a></td>
								<td>${dto.name }</td>
								<td>${dto.viewCnt }</td>
								<td>${dto.regDateTime }</td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</table>
			<br>
			<button onclick="location.href = 'write'">신규등록</button>
            
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


<%-- 위에서 필요한 트랜잭션이 마무리 되면 페이지 만들어주기 --%>
</body>
</html>






































