<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<c:if test="${!empty success }"> <!-- 회원가입 성공 후 -->
			<script>
				alert("${success}")
				location.href="/TodaysRecipe/"
			</script>
			
		</c:if>
	</head>
	<body>
		<div style="float: right;">
			<jsp:include page="common/top.jsp" flush="true" ></jsp:include><BR>
		</div>
		<br>
		<br>
		<a href="goodsList?gCategory=Vegetable" style="text-decoration: none;">
			<img src="images/Main_Logo.png" style="display: block; margin: 0 auto;">		
		</a>
		<div align="center">
		<jsp:include page="common/menu.jsp" flush="true"></jsp:include>
		</div>
		<hr style="border: solid 0.5px gray;">
		<jsp:include page="goods/goodsList.jsp" flush="true"></jsp:include>
		<jsp:include page="footer/footer2.jsp" flush="true"></jsp:include>
	</body>
</html>