<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div class="orderInfo">
 <form role="form" action="kakaoPay.do" method="post" autocomplete="off">
  
 <div class="inputArea">
   <label for="partner_order_id">주문번호</label>
   <input type="text" name="partner_order_id" id="partner_order_id" required="required" />
  </div>
  
  <div class="inputArea">
   <label for="item_name">상품명</label>
   <input type="text" name="item_name" id="item_name" value="QR뱃지" required="required" />
  </div>
  
  <div class="inputArea">
   <label for="">유저ID</label>
   <input type="text" name="partner_user_id" id="partner_user_id" required="required" />
  </div>
    
  <div class="inputArea">
   <label for="">수령인</label>
   <input type="text" name="orderRec" id="orderRec" required="required" />
  </div>
  
  <div class="inputArea">
   <label for="orderPhon">수령인 연락처</label>
   <input type="text" name="orderPhon" id="orderPhon" required="required" />
  </div>
  
  <div class="inputArea">
  	<label for="total_amount">가격</label>
  	<input type="text" name="total_amount" id="total_amount" required="required" />
  </div>
  
  <div class="inputArea">
   <label for="userAddr1">우편번호</label>
   <input type="text" name="userAddr1" id="userAddr1" required="required" />
  </div>
  
  <div class="inputArea">
   <label for="address">주소</label>
   <input type="text" name="address" id="address" required="required" />
  </div>


  
  <div class="inputArea">
   <button type="submit" class="order_btn">주문</button>
   <button type="button" class="cancel_btn">취소</button> 
  </div>
  
 </form> 
</div>

</body>
</html>