<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>

<%-- validation 실패시 --%>
<c:if test="${not empty ERROR }">
	<script>
		alert("등록 실패 " + "${ERROR}");
	</script>
</c:if>	
	
<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Gugi&display=swap" rel="stylesheet">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>QR주문</title>

    <link href="/CSS/styleOrder.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        
    $(function(){
            $('.head3').click(function(){
                $('.head2').slideToggle();
            })
        })
        
        
        function sale_price(s){ 
			s.total_amount.value = eval(s.quantity.value) * eval(s.multi.value) ; 
		} 
        
 
        
        
    </script>
    
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
                    <li><a onclick="location.href='about'">CLVOER</a></li>
                    <li><a onclick="location.href='qr'">MY QR</a></li>
                    <li><a onclick="location.href='order'">ORDER</a></li>
                    <li><a onclick="location.href='clover/member/board/list'">FIND & FOUND</a></li>
                    <sec:authorize access="isAnonymous()">

						<a href="<c:url value="/login2" />" id="loginOut">LOGIN</a>

					</sec:authorize>
					<sec:authorize access="isAuthenticated()">

						<a href="<c:url value="/mypage" />" id="MyPage">MYPAGE</a>
						<a href="<c:url value="/logout" />" id="logOut">LOGGOUT</a>

					</sec:authorize>
					<sec:authorize access="hasRole('ROLE_ADMIN')">
						<a href="<c:url value="clover/admin/main" />" id="admin">ADMIN</a>
					</sec:authorize>
                </ul>
            </nav>
        </div>
    </header>
    
    <br><br><br><br><br>
<!-- contents -->

<section class="container1">
<div href class="order_div_order">
<form action="orderOk" method="POST" class="orderForm" onsubmit="return checkForm()">

<h2>QR뱃지 주문</h2>
  
        <input type="hidden" name="partner_order_id" id="partner_order_id" type="text" class="partner_order_id" value="${k.partner_order_id}"/>
        <input type="hidden" name="user_id" id="user_id" type="text" class="user_id" value ="${k.user_id}"/>
        <input type="hidden" name="qr_uid" id="qr_uid" type="text" class="qr_uid" value ="${k.qr_uid}"/>
      <div class="textForm">
      수령인: <input name="order_Rec" id="order_Rec" type="text" class="order_Rec" value ="${k.order_Rec}"/>
      </div>
      <div class="textForm">
      연락처: <input name="order_Phone" id="order_Phone" type="text" class="order_Phone" value ="${k.order_Phone}"/>
      </div>
      <div class="textForm">
      주  소:<input name="address" id="address" type="text" class="address"value ="${k.address}"/>
      </div>
     
      <div class="textForm">
      수  량: <input name="quantity" id="quantity" type="text" id="quantity"class="quantity" value ="${k.quantity }" onkeyup="sale_price(this.form)"/>
		<input type="hidden" name="multi" id="multi" type="text" value ="1500" onkeyup="sale_price(this.form)"/>
		</div>
		<div class="textForm">
	  금  액: <input name="total_amount" id="total_amount" type="text" id="total_amount" class="total_amount" value="${k.total_amount }"/>      
      </div>
       <div class="textForm">
      타  입: <select name="qr_option" id="qr_option" class="qr_option">
      		<option value="1">1</option>
      		<option value="2">2</option>
      		<option value="3">3</option>
      	
      	</select>
      </div>
      
      <br><br>
      
      
      	<div>
     <input type="submit" class="button" value="주문"/>
      <a  onclick="location.href='main'"><input type="button" class="button" value="취소"/ ></a>
      </div>
      

 </form>
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
	<br><br>
</footer>
</body>
</html>