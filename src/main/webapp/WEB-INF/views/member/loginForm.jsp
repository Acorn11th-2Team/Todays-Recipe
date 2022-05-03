<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:if test="${!empty mesg }">
	<script>
		alert('${mesg}');
	</script>
</c:if>


<form action="login" method="get">
<!-- 아이디:<input type="text" name="userid"><br>
비밀번호:<input type="text" name="passwd"><br>
<input type="submit" value="로그인">
<input type="reset" value="취소"> -->

 	<div class="wrap">
        <div class="login">
            <h2>로그인</h2>
            <div class="login_id">
                <h4>아이디</h4>
                <input type="text" name="userid" placeholder="ID">
            </div>
            <div class="login_pw">
                <h4>비밀번호</h4>
                <input type="text" name="passwd" placeholder="Password">
            </div>
            <div class="submit">
                <input type="submit" value="로그인">
                <input type="reset" value="취소">
            </div>
        </div>
    </div>
</form>