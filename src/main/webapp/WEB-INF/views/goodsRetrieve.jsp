<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div style="float: right;">
	<jsp:include page="common/top.jsp" flush="true" ></jsp:include><BR>
</div>
<br>
<br>
<img src="images/Main_Logo.png" style="display: block; margin: 0 auto;">
<div align="center">
<jsp:include page="common/menu.jsp" flush="true"></jsp:include>
</div>
<hr style="border: solid 0.5px gray;">
<jsp:include page="goods/goodsRetrieve.jsp" flush="true"></jsp:include>
</body>
</html>