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
		<%-- <input type="text" value="${code}"> --%>
		<table border="1" align="center" cellspacing="0" cellpadding="0">
		<c:forEach var="ing" items="${ingred}">
			<tr>
				<td id="gName" name="gName">${ing.gName}</td>
				<td id="gPrice" name="gPrice">${ing.gPrice}</td>
				<td id="gAmount" name="gAmount">
					<c:forEach var="cart" items="${cartInfo}">
						<c:if test="${cart.gName eq ing.gName}">
							${cart.gAmount}
						</c:if>
						<input type="hidden" id="num" name="num" value="${cart.num}">
						<input type="hidden" id="userid" name="userid" value="${cart.userid}">
						<input type="hidden" id="gCode" name="gCode" value="${cart.gCode}">
						<input type="hidden" id="gImage" name="gImage" value="${cart.gImage}">
						<input type="hidden" id="gCategory" name="gCategory" value="${cart.gCategory}">
					</c:forEach>
				</td>
			</tr>
		</c:forEach>
		</table>
	</form>
</body>
</html>