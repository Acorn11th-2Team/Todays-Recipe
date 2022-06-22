<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
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
		<div style="text-align:center;"><a href="dashBoard">일별 매출 확인</a>&nbsp;&nbsp;<a href="">카테고리별 매출 확인</a></div>
		<br>
		
		<jsp:include page="dashBoard/dashBoard.jsp" flush="true"></jsp:include>
		<jsp:include page="footer/footer2.jsp" flush="true"></jsp:include>
	</body>
</html>