<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
<%-- validation 실패시 --%>
<c:if test="${not empty ERROR }">
   <script>
      alert("수정 실패");
   </script>   
</c:if>
    
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
<title>수정-${list[0].name }</title>
</head>
<script>
function chkSubmit(){
   frm = document.forms["frm"];
   
   var name = frm["name"].value.trim();
/*
    if (name == "") {
        alert("메뉴 이름은 반드시 작성해야 합니다");
        frm["name"].focus();
        return false;
    }
    */
    return true;
} // end chkSubmit()
</script>

<body>
<h2>정보수정</h2>
<form name="frm" action="writeOk" method="post" onsubmit="return chkSubmit()">
이름:
<input type="text" name="name" value ="${m.name}" }/><br>
종류:
<input type="text" name="category" value ="${m.category}" }/><br>
보호자 나이:
<input type="text" name="age" value ="${m.age}"/><br>
주소:
<input type="text" name="address" value ="${m.address}"/><br>
보호자 전화번호:
<input type="text" name="phone" value ="${m.phone}"/><br>
특이사항:
<textarea name="content">${m.content }</textarea>
<br><br>
<input type="submit" value="qr수정"/>
</form>
<br>
<button onclick="history.back();">이전으로</button>

<br>
</body>
</html>
   </c:otherwise>
</c:choose>