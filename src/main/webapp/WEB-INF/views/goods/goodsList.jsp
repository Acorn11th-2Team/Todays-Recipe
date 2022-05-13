
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<table width="100%" cellspacing="0" cellpadding="0">
	<tr>
		<td>
			<table align="center" width="710" cellspacing="0" cellpadding="0"
				border="0">
				<tr>
					<td height="5"></td>
				</tr>
				<!-- <tr>
					<td height="1" colspan="8" bgcolor="CECECE"></td>
				</tr> -->
				<tr>
					<td height="10"></td>
				</tr>
				<tr>

					<!-- 반복시작 -->
					<c:forEach var="dto" items="${goodsList }" varStatus="status">
						<td>
							<table style='padding: 15px'>
								<tr>
									<td><a href="goodsRetrieve?gCode=${dto.gCode }"> <img
											src="images/items/${dto.gImage}.png" border="0" height="300"
											width="200" align="center" width="200">
									</a></td>
								</tr>
								<tr>

									<td height="10">
								</tr>
								<tr>
									<td class="td_default" align="left"><font size="4.5">
											${dto.gName } ${dto.gWeight }</font>
									</h3></td>

								</tr>

								<tr>
									<td class="td_default" align="left"><strong> <fmt:formatNumber
												value="${dto.gPrice }" pattern="#,###" />원
									</strong></td>
								</tr>
								<tr>

									<td height="10">
								</tr>
							</table>
						</td>
						<!-- 한 줄에4개씩 -->
						<c:if test="${status.count%3 ==0 }">
							<tr>
								<td height="10"></td>
							</tr>
						</c:if>
						<!-- 반복끝-->
					</c:forEach>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td height="10">
	</tr>
</table>
