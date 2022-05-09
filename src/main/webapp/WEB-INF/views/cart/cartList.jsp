<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<c:if test="${!empty mesg }">
	<script>
		alert('${mesg}\n남은재고는 ${gStock}개 입니다');
	</script>
</c:if>
<% session.removeAttribute("mesg"); %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>

function totalXXX() {
	var totalSum=0;
	$(".sum").each(function (idx, data) {
		totalSum += Number.parseInt($(data).text());
	});	
	$("#totalSum").text(totalSum);
}
$(function() {
	totalXXX();
	
	//주문하기
	$(".orderBtn").on("click",function(){
		var num= $(this).attr("data-num");
		location.href="loginCheck/orderConfirm?num="+num;		
	});
	
	//전체삭제
	$("#delAllCart").on("click", function() {
		$("form").attr("action", "loginCheck/delAllCart");
		$("form").submit();
	})
	//전체선택
	$("#allCheck").on("click", function() {
		var result= this.checked;
		$(".check").each(function(idx, data) {
			this.checked= result;
		});
	});
	//삭제버튼 이벤트처리
	$(".deleteBtn").on("click", function () {
		console.log("deleteBtn 클릭 ");
		var num= $(this).attr("data-num");
		var xxx= $(this);
		$.ajax({
			url: "loginCheck/cartDelete",
			type:"get",
			dataType: "text",
			data: {
				num: num
			},
			success: function(data, status, xhr) {
				console.log("success");
				//dom삭제 
				xxx.parents().filter("tr").remove();
			},
			error: function(xhr, status, error) {
				console.log(error);
			}			
		});//end ajax
	});//end event
	
	$(".upbutton").on("click", function() {
		var num=$(this).attr("data-num");
		console.log(num);
		var result = $("#cartAmount" + num).val();
		result = parseInt(result) + 1;
		$("#cartAmount" + num).val(result);
		
		var gAmount= $("#cartAmount"+num).val();
		var gPrice =  $(this).attr("data-price");
		console.log(num, gPrice);
		$.ajax({
			url: "loginCheck/cartUpdate",
			type: "get",
			dataType: "text",
			data: {
				num: num,
				gAmount: gAmount
			},
			success: function (data, status, xhr) {
				var total= 
						parseInt(gAmount)*parseInt(gPrice);
				$("#sum"+num).text(total.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + "원");				
			},
			error: function (xhr, status,error) {
				console.log(error);
			}//end error			
		});//end ajax
	})
	
	$(".downbutton").on("click", function() {
		var num=$(this).attr("data-num");
		console.log(num);
		var result = $("#cartAmount" + num).val();
		result = parseInt(result) - 1;
		$("#cartAmount" + num).val(result);
		
		var gAmount= $("#cartAmount"+num).val();
		var gPrice =  $(this).attr("data-price");
		console.log(num, gPrice);
		$.ajax({
			url: "loginCheck/cartUpdate",
			type: "get",
			dataType: "text",
			data: {
				num: num,
				gAmount: gAmount
			},
			success: function (data, status, xhr) {
				var total= 
						parseInt(gAmount)*parseInt(gPrice);
				$("#sum"+num).text(total.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + "원");				
			},
			error: function (xhr, status,error) {
				console.log(error);
			}//end error			
		});//end ajax
		
	})
});//end ready
 
</script>

<div class="wrap">
	<table align="center" cellspacing="0" cellpadding="0" border="0">
	
		<tr>
			<td height="30">
		</tr>
	
		<tr>
			<td colspan="100%" class="td_default" align="center"><font
				size="5"><b>장바구니</b></font>
			</td>
		</tr>
	
		<tr>
			<td height="15">
		</tr>
	
		<tr>
			<td height="7">
		</tr>
	
		<tr>
			<td class="td_default" align="left">
				<input type="checkbox"
				name="allCheck" id="allCheck"> 
			</td>
			<td>
				<strong>&nbsp;전체선택</strong>
			</td>
	
		</tr>
	
		<tr>
			<td height="7">
		</tr>
		
		
		
		<tr>
			<td colspan="100%">
				<hr size="1" color="CCCCCC">
			</td>
		</tr>
	
	
	
		<form name="myForm">
		    
		    
	<!-- 반복시작 -->
	<c:forEach var="x" items="${cartList}">
			<tr>
				<td height="10">
			</tr>
	
			<tr>
				<td class="td_default" align="left"> 
					<!-- checkbox는 체크된 값만 서블릿으로 넘어간다. 
					따라서 value에 삭제할 num값을 설정한다. -->
					<input type="checkbox"
						name="check" id="check81" class="check" 
						value="${x.num}">
				</td>
				
				<td class="td_default" width="110">
					<img src="images/items/${x.gImage}.png" border="0" align="right" width="80" />
				</td>
				
				<td class="td_default" width="200" style='padding-left: 30px'>
				${x.gName}
					</td>
				<td class="td_default" align="center" width="110">
					<span id="ggPrice${x.num}">
						<fmt:formatNumber value="${x.gPrice}" pattern="#,###"/>원
					</span>
				</td>
				<td>
					<img src="images/minus.png" id="down${x.num}" class="downbutton" 
					data-num="${x.num}" data-price="${x.gPrice}"
					width="30" height="30">&nbsp;
				</td>
				<td width="60">
					<div class="input_gAmount">
						 <input class="input_default" type="text" name="cartAmount"
						id="cartAmount${x.num}" style="text-align: right" maxlength="3"
						size="2" value="${x.gAmount}" data-num="${x.num}"> 
					</div>
				</td>
				<td>
					&nbsp;<img src="images/plus.png" id="up${x.num}" class="upbutton" 
					data-num="${x.num}" data-price="${x.gPrice}"
					width="30" height="30"> 
				</td>
				<td class="td_default" align="center" width="100"
					style='padding-left: 5px'><span id="sum${x.num}" class="sum">
					<fmt:formatNumber value="${x.gPrice * x.gAmount}" pattern="#,###"/>원
					</span></td>
				<td><input type="button" value="주문" class="orderBtn"
					data-num="${x.num}"></td>
				<td class="td_default" align="center" width="30"
					style='padding-left: 10px'>
					<input type="button" value="삭제" class="deleteBtn"
					data-num="${x.num }"></td>
				<td height="10"></td>
			</tr>
			

	 <!-- 반복끝 --> 
	</c:forEach>
		</form>
		<tr>
			<td height="10">
		</tr>
		<tr>
			<td colspan="10">
			총합 : <span id="totalSum"></span>
				<hr size="1" color="CCCCCC">
			</td>
		</tr>
		<tr>
			<td height="30">
		</tr>
	
		<tr>
			<td align="right" colspan="5">
				<button onclick="orderAllConfirm(myForm)">전체 주문하기</button>
				<button id="delAllCart">전체 삭제하기</button>
				<a class="a_black" href="goodsList?gCategory=Vegetable"> 계속 쇼핑하기 </a>
			</td>
		</tr>
		<tr>
			<td height="20">
		</tr>
	
	</table>
</div>
    