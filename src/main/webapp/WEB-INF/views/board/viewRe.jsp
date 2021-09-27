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
				uid : ${list[0].rep_uid }<br>
				
				내용: <br>
				<hr>
				<div>
				${list[0].content }
				</div>
				등록일: ${list[0].regDateTime }<br> <%-- getRegDateTime() 사용 --%>
				<hr>
				본 장소: <br>
				
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
				<table>
				
						<tr>
							<th>uid</th>
							<th>rep_uid</th>
							<th>등록일</th>
						</tr>
						
						<c:choose>
						<c:when test="${empty list || fn:length(list)==0 }">
						</c:when>
						<c:otherwise>
							<c:forEach var="dto" items="${list }">
								<tr>
									<td>${dto.uid }</td>
									<td>${dto.rep_uid } </td>
									<td>${dto.regDateTime }</td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				
				</table>
				
				
				<br><br>
				<button onclick="location.href='update?uid=${list[0].uid }'">수정하기</button>
				<button onclick="location.href='list'">목록보기</button>
				<button onclick="chkDelete(${list[0].uid })">삭제하기</button>
				<button onclick="location.href='write'">신규등록</button>
		</body>
		
		
		</html>
				
	</c:otherwise>
</c:choose>

