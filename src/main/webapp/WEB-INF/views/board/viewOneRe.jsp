<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:choose>
	<c:when test="${empty list || fn:length(list) == 0 }">
		<script>
			alert("해당 정보가 삭제되거나 없습니다");
			history.back();
		</script>
	</c:when>
	
	<c:otherwise>
	
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
		
		<link href="/CSS/styleViewRe.css" rel="stylesheet">
		<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
		<title>읽기</title>
		</head>
		<script>
		
		function chkDelete(uid, rep_uid){
			// 삭제 여부, 다시 확인 하고 진행하기
			var r = confirm("삭제하시겠습니까?");
			
			if(r){
				location.href = 'deleteReOk?rep_uid=' + rep_uid;
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
        		<div href class="container">
				uid : ${list[0].rep_uid }<br>
				제목 : ${list[0].subject }<br>
				내용: <br>
				<hr>
				<div>
				${list[0].content }
				</div>
				등록일: ${list[0].regDateTime }<br> <%-- getRegDateTime() 사용 --%>
				<hr>
				<br>
				본 장소: <br><br>
				
				<div id="map" style="width:500px;height:350px;"></div>

				<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2389d39ea90c7f8eac5210a7bd81bee9"></script>
				<script>
				var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
				    mapOption = { 
					 	center: new kakao.maps.LatLng(${list[0].latitude }, ${list[0].longitude }), // 지도의 중심좌표
				        level: 3 // 지도의 확대 레벨
				    };
				
				var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
				
				// 마커가 표시될 위치입니다 
				var markerPosition  = new kakao.maps.LatLng(${list[0].latitude }, ${list[0].longitude }); 
				
				// 마커를 생성합니다
				var marker = new kakao.maps.Marker({
				    position: markerPosition
				});
				
				// 마커가 지도 위에 표시되도록 설정합니다
				marker.setMap(map);
				
				// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
				// marker.setMap(null);    
				</script>
				
				
				<br><br>
				<button onclick="location.href='update?uid=${list[0].uid }'">수정하기</button>
				<button onclick="location.href='list'">목록보기</button>
				<button onclick="chkDelete(${list[0].rep_uid })">삭제하기</button>
				<button onclick="location.href='list'">목록보기</button>
				<button onclick="location.href='writeRe?uid=${list[0].uid }'">신규등록</button>
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
				
	</c:otherwise>
</c:choose>

