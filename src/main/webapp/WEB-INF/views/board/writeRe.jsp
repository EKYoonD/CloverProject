<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    

<%-- validation 실패시 --%>
<c:if test="${not empty ERROR }">
	<script>
		alert("등록 실패");
	</script>	
</c:if>

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

<link href="/CSS/styleWriteRe.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>댓글작성</title>
<script src="${pageContext.request.contextPath }/ckeditor/ckeditor.js"></script>
</head>
<script>
function chkSubmit(){
	frm = document.forms['frm'];
	
	var name = frm['name'].value.trim();
	var subject = frm['subject'].value.trim();

	/*
	if(name == ""){
		alert("작성자 란은 반드시 입력해야 합니다");
		frm['name'].focus();
		return false;
	}
	if(subject == ""){
		alert("제목은 반드시 작성해야 합니다");
		frm['subject'].focus();
		return false;
	}
	*/
	return true;
} // end chkSubmit()
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
<div href class="container">
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<h2>댓글작성</h2>
<form name="frm" action="writeReOk" method="post" onsubmit="return chkSubmit()">
uid : <input type="text" name="uid" value="${w.uid }"/><br><br>
제목:
<input type="text" name="subject" value="${w.subject }"/><span style="color:red">${ERROR.SUBJECT }</span><br><br>
내용:<br>
<textarea name="content" id='content'>${w.content }</textarea>
<script type="text/javascript">
	CKEDITOR.replace('content', {
		allowedContent: true,  // HTML 태그 자동삭제 방지설정
		width: '640px',
		height: '200px',
		filebrowserUploadUrl: '${pageContext.request.contextPath}/imageUpload'
		
	});
</script>

<br><br>
마지막으로 본 장소 : 
<h5> 지도를 움직이면서 잃어버린 위치를 정확하게 표시해주세요</h5>
<span style="color:red">${ERROR.POINT }</span>

<div id="map" style="width:500px;height:350px;"></div>
<div id="clickLatlng"></div>

<input type="hidden" name="latitude" id="latitude" value=""/>
<input type="hidden" name="longitude" id="longitude" value=""/>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2389d39ea90c7f8eac5210a7bd81bee9"></script>
<script>

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(37.123125, 127.123124), // 지도의 중심좌표
        level: 12 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

// 지도를 클릭한 위치에 표출할 마커입니다
var marker = new kakao.maps.Marker({ 
    // 지도 중심좌표에 마커를 생성합니다 
    position: map.getCenter() 
}); 
// 지도에 마커를 표시합니다
marker.setMap(map);

// 지도에 클릭 이벤트를 등록합니다
// 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        
    
    // 클릭한 위도, 경도 정보를 가져옵니다 
    var latlng = mouseEvent.latLng; 
    
    // 마커 위치를 클릭한 위치로 옮깁니다
    marker.setPosition(latlng);
    
    var message = '클릭한 위치의 위도는 ' + latlng.getLat() + ' 이고, ';
    message += '경도는 ' + latlng.getLng() + ' 입니다';
    
    var resultDiv = document.getElementById('clickLatlng'); 
    resultDiv.innerHTML = message;
    
    latitude = latlng.getLat()
    longitude = latlng.getLng()
    
    document.getElementById('latitude').value = latitude
    document.getElementById('longitude').value = longitude
    
});
</script>
<br><br>

<input type="hidden" name="userid" id="userid" value="${w.userid }"/>
<input type="submit" value="등록"/><br><br>
</form>
<button type="button" onclick="location.href = 'list'">목록으로</button>
<br><br>
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





















