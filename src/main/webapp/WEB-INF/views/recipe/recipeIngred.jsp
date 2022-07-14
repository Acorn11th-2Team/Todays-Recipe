<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="loginCheck/orderAllCart">
		<!-- 장바구니 정보 받아와서 hidden으로 넘겨주기 -->
		<c:forEach var="x" items="${cartNum}">
			<input type="hidden" value="${x}" name="check" class="check">
		</c:forEach>
		<input type="text" value="${code}">
	</form>
</body>
</html>