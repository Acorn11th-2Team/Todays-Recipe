<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<div style="float: right;">
			<jsp:include page="serviceCenter/top.jsp" flush="true" ></jsp:include><BR>
		</div>
		<br>
		<br>
		<a href="goodsList?gCategory=Vegetable" style="text-decoration: none;">
			<img src="images/Main_Logo.png" style="display: block; margin: 0 auto;">		
		</a>
		<div align="center">
		<jsp:include page="serviceCenter/menu.jsp" flush="true"></jsp:include>
		</div>
		<hr style="border: solid 0.5px gray;">
		
		<jsp:include page="serviceCenter/serviceCenter.jsp"></jsp:include>
	</body>
</html>