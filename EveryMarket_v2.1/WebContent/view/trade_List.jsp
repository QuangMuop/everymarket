<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script type="text/javascript">
	$(document).ready(function (){
		$(document).on("click", "#accept", function(){
			location.href="accept.do?t_id="+$("#t_id").val();
			alert("거래 완료");
		});
		
		$(document).ready(function(){
			
			
		});
	});


</script>


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


	<h1>사는물건</h1>
	<table id="buying">

		<tr>
			<th>주문번호</th>
			<th>상품명</th>
			<th>총 결제금액</th>
			<th colspan="2">진행상태</th>
		</tr>

		<c:forEach var="bl" items="${buyingList}">
			<tr>

				<c:choose>
					<c:when test="${bl.t_status == 1 }">
						<td>승인대기</td>

					</c:when>
					<c:otherwise>
						<td>${bl.t_del_number}</td>
					</c:otherwise>

				</c:choose>


				<td>${bl.p_name }</td>
				<td>${bl.p_price }</td>

				<c:choose>
					<c:when test="${bl.t_status == 1}">
						<td colspan="2">배송준비중</td>
					</c:when>
					<c:when test="${bl.t_status == 2 }">
						<td id="${bl.t_id}3">배송중</td>
						<td><input class="db_trace" type="button" value="배송추적"
							t_id="${bl.t_id}" /></td>
					</c:when>

					<c:when test="${bl.t_status == 3}">
						<td id="db_text">배송완료</td>
<<<<<<< .mine
						<td><input class="deliver_submit" type="button" value="수취확인" />
							<input class="deliver_reports" type="button" value="신고하기" /></td>
=======
						<td>
						<input type="hidden" id="t_id" value="${bl.t_id}">
						<input  type="button"  id="accept" value="수취확인" />
						 <input class="db_trace" type="button" id="report" value="신고하기" /></td>
>>>>>>> .r126
					</c:when>


				</c:choose>

			</tr>
		</c:forEach>
	</table>
<<<<<<< .mine






=======
>>>>>>> .r126
	<br>
	<br>
	<h2>팔고있는 물건</h2>
	<table id="selling">
		<tr>
			<th>주문번호</th>
			<th>상품명</th>
			<th>총 결제금액</th>
			<th colspan="2">진행상태</th>
		</tr>

		<c:forEach var="sl" items="${sellingList}">
			<c:choose>

				<c:when test="${sl.t_status > 0 }">

					<tr t_ids="${sl.t_id}" t_status="${sl.t_status}">
						<c:choose>
							<c:when test="${sl.t_status == 1 }">
								<td id="${sl.t_id}4">주문대기</td>
							</c:when>
							<c:otherwise>
								<td>${sl.t_del_number}</td>
							</c:otherwise>

						</c:choose>
						<td class="t_id" type="hidden" value="${sl.t_id}">${sl.p_name}</td>
						<td id="t_status" name="${sl.t_status}">${sl.p_price}</td>

						<c:choose>
							<c:when test="${sl.t_status == 1}">
								<form>
									<td id="${sl.t_id}1">송장번호입력: <input class="${sl.t_id}5"
										type="text"> <!-- 거래번호 or 프로덕트 아이디 -->
									</td>
									<td id="${sl.t_id}2"><input class="dn_bt" type="button"
										value="확인" t_id="${sl.t_id}" name="${sl.t_status}"></td>

								</form>
							</c:when>


							<c:when test="${sl.t_status == 2 }">
								<td id="${sl.t_id}3">배송중</td>
								<td><input class="db_trace" type="button" value="배송추적"
									t_id="${sl.t_id}" /></td>
							</c:when>

							<c:when test="${sl.t_status == 3 }">
								<td id="db_text">배송완료</td>
								<td><input class="db_trace" type="button" value="배송추적" /></td>
							</c:when>




						</c:choose>
					</tr>
				</c:when>
			</c:choose>

		</c:forEach>
	</table>

	<div class="popUp hidden">
		<form action="">
		      거래 번호 : ${sl.t_id}
			신고 상품명 : ${sl.}
			신고 사유 : 
		</form>
	
	</div>




</body>
</html>