<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    

<%-- validation 실패시 --%>
<c:if test="${not empty ERR }">
	<script>
		alert("등록 실패 " + "${ERR}");
	</script>	
</c:if>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글작성</title>
</head>
<script>
function chkSubmit(){
	frm = document.forms['frm'];
	
	var name = frm['name'].value.trim();
	
	
	return true;
} // end chkSubmit()
</script>
<body>
<h2>입력</h2>
<form name="frm" action="writeOk" method="post" onsubmit="return chkSubmit()">
이름:
<input type="text" name="name" value ="${m.name}" }/><br>
종류:
<input type="text" name="category" value ="${m.category}" }/><br>
나이:
<input type="text" name="age" value ="${m.age}"/><br>
주소:
<input type="text" name="address" value ="${m.address}"/><br>
보호자 전화번호:
<input type="text" name="phone" value ="${m.phone}"/><br>
특이사항:
<textarea name="content">${m.content }</textarea>
<br><br>
<input type="submit" value="qr생성"/>
</form>
<br>

</body>
</html>





















