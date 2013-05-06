<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">

<title>Insert title here</title>
<style type="text/css">
table {
	border: 1px solid;
	width: 1000px;
}

table td,th {
	border: 1px solid;
}
</style>
</head>
<body>


	<table id="buying">
		<tr>
			<th>주문번호</th>
			<th>상품명</th>
			<th>총 결제금액</th>
			<th>진행상태</th>
		</tr>

		<c:forEach var="bl" items="${buyingList}">
			<tr>
				<td>${bl.t_del_number}</td>
				<td>${bl.p_name }</td>
				<td>${bl.p_price }</td>
				
				<c:choose>
				<c:when test="${bl.t_status == 0}">
				 <td>판매승인대기중</td>
				</c:when>
				
				</c:choose>
				
			</tr>
		</c:forEach>
	</table>


	<br>
	<br>
	<table id="selling">
		<tr>
			<th>주문번호</th>
			<th>상품명</th>
			<th>총 결제금액</th>
			<th colspan="2">진행상태</th>
		</tr>

		<c:forEach var="sl" items="${sellingList}">
			<tr id="">
				<td>${sl.t_del_number}</td>
				<td class="t_id" type="hidden" value="${sl.t_id}">${sl.p_name}</td>
				<td id="t_status" name="${sl.t_status}">${sl.p_price}</td>



				<c:choose>
					<c:when test="${sl.t_status == 2 }">
						<td id="db_text">배송중</td>
						<td><input class="db_trace" type="button" value="배송추적"
							onclick="db_pop()" /></td>
					</c:when>

					<c:when test="${sl.t_status == 3 }">
						<td id="db_text">배송완료</td>
						<td><input class="db_trace" type="button" value="배송추적" /></td>
					</c:when>


					<c:when test="${sl.t_status == 1}">
						<form>
							<td id="status2_text">송장번호입력: <input class="dn_bt_nb" type="text"> 
							
							<!-- 거래번호 or 프로덕트 아이디 -->
							</td>
							<td id="status1_text"><input class="dn_bt" type="button" value="확인" t_id="${sl.t_id}" name="${sl.t_status}"></td>

						</form>
					</c:when>

				</c:choose>



			</tr>
		</c:forEach>
	</table>
	




</body>
</html>