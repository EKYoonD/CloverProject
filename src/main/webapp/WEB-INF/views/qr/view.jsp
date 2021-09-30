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



</script>
<body>	
	<h2>qr</h2>
		<br>
		
	<img src="/qr/qrcode/이름: ${list[0].name }, 	종류 :${m.category},  나이:${list[0].age }, 주소: ${list[0].address }, 보호자 연락처: ${list[0].phone },  내용:${list[0].content }"/>
		
	
		<hr>
		<div>
		
		</div>
		<hr>
		<br>
		<button onclick="location.href='update?uid=${list[0].uid }'">수정하기</button>
		<button onclick="location.href='list'">주문하기</button>
		<button onclick="location.href='write'">신규등록</button>
</body>
</html>
				
	</c:otherwise>
</c:choose>

