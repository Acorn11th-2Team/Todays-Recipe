<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- ${answerDto}, 질문 및 답변 모두 출력, 질문 수정 및 삭제 불가하며 조회만 가능 -->
</head>
<body>


	<form name="myForm"> <!-- 조회 기능만 있음, action 불필요 -->
		<table align="center">
		<colgroup>
			<col width="10%">
			<col width="20%">
			<col width="40%">
			<col width="20%">
		</colgroup>
		<thead style="background-color: #bbdefb;">
			<tr>
				<th scope="col">문의번호</th>
				<th scope="col">문의유형</th>
				<th scope="col">제목</th>
				<th scope="col">작성일</th>
			</tr>
		</thead>
			<tr>
				<td style="text-align:center;">${answerDto.num}</td>
				<td style="text-align:center;">${answerDto.category}</td>
				<td>${answerDto.title}</td>
				<td style="text-align:center;">${answerDto.writeday}</td>
			</tr>
			<tr><td><br><br></td></tr>
			<tr>
				<th>문의내용</th>
				<td colspan="3">${answerDto.contents}</td>
			</tr>
			<tr>
				<td colspan='4'><hr></td>
			</tr>
			<tr>
				<th>답변</th>
				<td colspan="3">${answerDto.answer}</td>
			</tr>
		</table>
		<br>
			<div style="text-align:center;"><a href="user_qaList">이전페이지로</a></div>
	</form>
</body>
</html>