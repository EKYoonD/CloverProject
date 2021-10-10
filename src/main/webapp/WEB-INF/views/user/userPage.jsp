<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>MyPage</title>
</head>
<body>
	<table>
		<tr>
			<th>이름</th>
			<th>아이디</th>
			<th>이메일</th>
			<th>주소</th>
			<th>휴대폰번호</th>
		</tr>
		<tr>
			<td>${list[0].id }</td>
		</tr>
	</table>
</body>
</html>
