<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
	$(function() {
		$(".answer").on("click", function() {
			// 답변보기/하기
			var num = $(this).attr("data-num");
			location.href = "managerQA?num=" + num;
		})
	})
	
	function lookYet(n){
			console.log(n,n.checked);
			if(n.checked){
				$(".hide2class").each(function () {
					var answer = $(this).attr("data-answer");
					if (answer.length != 0) {
						$(this).css('display', 'none');
						console.log(answer);
					}
				})
			}else{
				// display:block으로 변경하면 테이블 형태로 출력되지 않음
				// 리스트를 다시 받아와서 for문으로 출력해야 하므로 manager_qaList 주소로 이동했다가 다시 전환
				$("form").attr("action", "manager_qaList");
				$("form").submit();
			}
		}
	
		function selChange() {
			var sel = document.getElementById('cntPerPage').value;
			location.href="manager_qaList?nowPage=${paging.nowPage}&cntPerPage="+sel;
		}
</script>
<html>
<head>
<meta charset="UTF-8">
<title>1:1 문의 목록 화면</title>
</head>
<body>
	<form action="managerQA">
	<div id="outter">
	<div style="float: right;">
		<select id="cntPerPage" name="sel" onchange="selChange()">
			<option value="5"
				<c:if test="${paging.cntPerPage == 5}">selected</c:if>>5줄 보기</option>
			<option value="10"
				<c:if test="${paging.cntPerPage == 10}">selected</c:if>>10줄 보기</option>
			<option value="15"
				<c:if test="${paging.cntPerPage == 15}">selected</c:if>>15줄 보기</option>
			<option value="20"
				<c:if test="${paging.cntPerPage == 20}">selected</c:if>>20줄 보기</option>
		</select>
	</div> <!-- 옵션선택 끝 -->
		<table width="700" align="center">
			<tr>
				<td style="text-align:right;"><input type="checkbox" name="answerYet" id="answerYet" onclick="javascript:lookYet(this);">페이지 내 미완 답변만 보기</td>
			</tr>
		</table>
		<table align="center">
		<colgroup>
			<col width="10%">
			<col width="40%">
			<col width="30%">
			<col width="20%">
		</colgroup>
		<thead style="background-color: #bbdefb;">
			<tr>
				<th scope="col">문의번호</th>
				<th scope="col">제목</th>
				<th scope="col">작성일</th>
				<th scope="col">답변상태</th>
			</tr>
		</thead>
			<c:forEach var="qdto" items="${manager_qlist}">
				<input type="hidden" name="userid">
				<tr id="hide2" class="hide2class" data-answer="${qdto.answer}">
					<td name="num" id="${qdto.num}" style="text-align:center;">${qdto.num}</td>
					<td name="title" id="title${qdto.num}">
						<a href="managerQA?num=${qdto.num}">${qdto.title}</a>
					</td>
					<td name="writeday" id="writeday${qdto.num}" style="text-align:center;">${qdto.writeday}</td>
					<td><c:if test="${qdto.answer != null}">답변완료</c:if> 
						<c:if test="${qdto.answer == null}">답변미완</c:if>
						<input type="button" id="answer" name="answer" data-num="${qdto.num}" class="answer"
						value = 
							<c:if test="${qdto.answer != null}">"답변보기"</c:if>
							<c:if test="${qdto.answer == null}">"답변하기" style="border-color:red;"</c:if>
						>	
						<br>
					</td>
				</tr>
			</c:forEach>
		</table>
		
		<div style="display: block; text-align: center;">		
		<c:if test="${paging.startPage != 1 }">
			<a href="manager_qaList?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
		</c:if>
		<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
			<c:choose>
				<c:when test="${p == paging.nowPage }">
					<b>${p }</b>
				</c:when>
				<c:when test="${p != paging.nowPage }">
					<a href="manager_qaList?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
				</c:when>
			</c:choose>
		</c:forEach>
		<c:if test="${paging.endPage != paging.lastPage}">
			<a href="manager_qaList?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
		</c:if>
	</div>
		
		</div>
	</form>
</body>
</html>