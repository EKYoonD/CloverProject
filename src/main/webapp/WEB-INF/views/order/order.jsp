<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Gugi&display=swap" rel="stylesheet">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>main</title>

    <link href="/CSS/styleOrder.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        $(function(){
            $('.head3').click(function(){
                $('.head2').slideToggle();
            })
        })
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
                    <li><a onclick="location.href='login'">JOIN</a></li>
                </ul>
            </nav>
        </div>
    </header>
    
<!-- contents -->
<section class="container1">
<div class="order_div">
<form action="order" method="POST" class="orderForm" >

<h2>QR뱃지 주문</h2>  
      <div class="textForm">
        <input name="partner_order_id" type="text" class="partner_order_id" placeholder="주문번호"/>
      </div>
       <div class="textForm">
        <input name="partner_user_id" type="text" class="partner_user_id" placeholder="유저 ID"/>
      </div>
      <div class="textForm">
        <input name="orderRec" type="text" class="orderRec" placeholder="수령인"/>
      </div>
       <div class="textForm">
        <input name="orderPhone" type="text" class="orderPhone" placeholder="수령인 연락처"/>
      </div>
      <div class="textForm">
        <input name="userAddr1" type="text" class="userAddr1" placeholder="우편번호"/>
      </div>
      <div class="textForm">
        <input name="address" type="text" class="address" placeholder="주소"/>
      </div>
      <input type="submit" class="order_btn" value="주문"/>
      <input type="button" class="cancle_btn" value="취소"/>
  

 </form>
</div>
</section>   
 <br><br><br><br><br><br> 
 
 
</body>
</html>