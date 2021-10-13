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
<link href="https://fonts.googleapis.com/css2?family=Gugi&display=swap"
   rel="stylesheet">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>QR주문</title>

<link href="/CSS/styleOrder.css" rel="stylesheet">
<link
   href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css"
   rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
   $(function() {
      $('.head3').click(function() {
         $('.head2').slideToggle();
      })
   })

   function sale_price(s) {
      s.total_amount.value = eval(s.quantity.value) * eval(s.multi.value);
   }

   function img_change(f) {
      var chimg = '<img src="' + $(f).find('option:selected').data('src')
            + '">';
      $('#change_img').html(chimg);
   }
   
      //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;
                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
      
    $(function() {
        $("input").on("keyup", function() {
            var str = $("input[name^='Address']:visible").map(function() {
                return $(this).val();
            }).get().join(" ");
            $("#address").val(str);
        });
    });

</script>

</head>
<body>
<div id="body-wrapper"
      style="min-height: 100%; padding-bottom: 200px; padding-top: 100px">
   <!--header-->

   <header>
      <div class="container">
         <div class="head1">
            <a onclick="location.href='main'"><i class="fas fa-home"></i></a> <span
               class="head3"><i class="far fa-caret-square-down"></i></span>
         </div>
         <nav class="head2">
            <ul>
               <li><a onclick="location.href='../../../../about'">CLVOER</a></li>
                  <li><a
                     onclick="location.href='../../../clover/member/qr/write'">MY
                        QR</a></li>
                  <li><a
                     onclick="location.href='../../../clover/member/qr/qrlist'">ORDER</a></li>
                  <li><a
                     onclick="location.href='../../../clover/member/board/list'">FIND
                        & FOUND</a></li>
                  <sec:authorize access="isAnonymous()">
                     <a href="<c:url value="/login2" />" id="loginOut">LOGIN</a>
                  </sec:authorize>
                  <sec:authorize access="isAuthenticated()">
                     <a href="<c:url value="../../../clover/member/mypage" />"
                        id="MyPage">MYPAGE</a>
                  </sec:authorize>
                  <sec:authorize access="hasRole('ROLE_ADMIN')">
                     <a href="<c:url value="../../../clover/admin/main" />" id="admin">ADMIN</a>
                  </sec:authorize>
                  <sec:authorize access="isAuthenticated()">
                     <a href="<c:url value="/logout" />" id="logOut">LOGGOUT</a>
                  </sec:authorize>
            </ul>
         </nav>
      </div>
   </header>
   <!-- contents -->

   <section class="container11">
      <div href class="order_div_order">
         <form action="orderOk" method="POST" class="orderForm"
            onsubmit="return checkForm()">

            <h2>QR뱃지 주문</h2>
            <input type="hidden" name="partner_order_id" id="partner_order_id"
               type="text" class="partner_order_id" value="${k.partner_order_id}" />
            <input type="hidden" name="user_id" id="user_id" type="text"
               class="user_id" value="${k.user_id}" /> <input type="hidden"
               name="qr_uid" id="qr_uid" type="text" class="qr_uid"
               value="${k.qr_uid}" />
            
            <div class="textForm">
               수령인 :&nbsp;<input name="order_Rec" id="order_Rec" type="text"
                  class="order_Rec" value="${k.order_Rec}" />

            </div>
            <div class="textForm">
               연락처 :<input name="order_Phone" id="order_Phone" type="text"
                  class="order_Phone" value="${k.order_Phone}" />
            </div>
            

            <div class="textForm">
               수&nbsp;&nbsp;&nbsp;량 :&nbsp;<input name="quantity" id="quantity" type="text" id="quantity"
                  class="quantity" value="${k.quantity }"
                  onkeyup="sale_price(this.form)" /> <input type="hidden"
                  name="multi" id="multi" type="text" value="1500"
                  onkeyup="sale_price(this.form)" />
            </div>
            <div class="textForm">
               금&nbsp;&nbsp;&nbsp;액 :&nbsp;<input name="total_amount" id="total_amount" id="total_amount"
                  class="total_amount" value="${k.total_amount }" readonly />
            </div>
            <div class="textForm1">
               &nbsp;&nbsp;우편번호 : <input  type="text" class="postcode" id="sample4_postcode" >   
               <input type="button" class="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
            </div>
            <br><br>
            <div class="textForm">
               도로명주소 :<input type="text" class="roadAddress" name="Address" id="sample4_roadAddress">
            </div>

               <input type="hidden"  class="jibunAddress" id="sample4_jibunAddress">
               <span id="guide" style="color:#999;display:none"></span>
               <div class="textForm">
               상세주소 :&nbsp;<input type="text" name="Address" class="detailAddress" id="sample4_detailAddress" >
            </div>
            <div class="textForm">
               참고항목 :<input type="text" class="extraAddress" id="sample4_extraAddress" >
            </div>
            <input type="hidden" name="address" id="address" class="address"
                  value="${k.address}" onkeyup='call()'' />
            <div class="textForm">
               타&nbsp;&nbsp;&nbsp;입 :&nbsp;<select name="qr_option" id="qr_option" class="qr_option"
                  onChange="img_change(this);">
                  <option value="penguin" data-src="/img/penguin.png">펭귄</option>
                  <option value="bear" data-src="/img/bear.png">곰</option>
                  <option value="rabbit" data-src="/img/rabbit.png">토끼</option>
                  <option value="monkey" data-src="/img/monkey.png">원숭이</option>
               </select>
            </div>

            <div>
               <input type="submit" class="button" value="주문" /> <a
                  onclick="location.href='main'"><input type="button"
                  class="button" value="취소"/ ></a>
            </div>


         </form>

         <div class="img">
         
            <div class="chanege_img" id="change_img" align="center">
            </div>
         </div>
      </div>


   </section>
   </div>
   <!--footer-->
   <footer>
      <div class="container">
         <div class="foot1">
            <h2>CLVOER</h2>
            <p>
               Web Address : <a
                  href="https://katieyoon-the-developer.tistory.com/">https://katieyoon-the-developer.tistory.com/</a>
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
      <br> <br>
   </footer>
</body>
</html>