<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script type="text/javascript">
	$(document).ready(function() {
		
		$(document).on("click", "#accept", function(){
			location.href="accept.do?t_id="+$(this).attr("t_id");
		});
		$(document).on("change", "#report_choice",function(){
			$("#rep_reason").removeAttr("value").attr("value", $("#report_choice >option:selected").html());
		});
		
		$(document).on("click", "#report", function(){
			$("#main_report").bPopup();
			$("#rep_reason").attr("value", $("#report_choice >option:selected").html());
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

/* tr안보이게 하기 */
.dis_tr {
	display: none;
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
			<tr id="${bl.t_id}">

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
						<td id="button"><input class="db_trace" type="button"
							value="배송추적" t_id="${bl.t_id}" /></td>
					</c:when>

					<c:when test="${bl.t_status == 3}">
						<td id="db_text">배송완료</td>


						<td>
						<input type="button"  id="accept" value="수취확인" t_id="${bl.t_id}"/>
						<input type="button" id="report" value="신고하기" t_id="${bl.t_id}"/></td>

						<div id="main_report" class="popUp hidden">
								<form action="reportAction.do" method="post">
		    						  거래 번호 : ${bl.t_id}<br>
										신고 상품명 : ${bl.p_name}<br>
										신고 사유 : <select id="report_choice">
											<option value = "report1">본 제품과 다른 제품</option>
											<option value = "report2">배송 지연</option>
											<option value = "report3">제품 불량</option>
											<option value = "report4">기타 사유</option>
											</select><br>
										신고의 내용	
											<textarea name="rep_content" id="rep_content"></textarea><br>
											<input type="hidden" name="rep_memberId" value="${bl.t_seller}">		
											<input type="hidden" name="rep_reason" id="rep_reason">
											<input type="hidden" name="rep_writer" value="${bl.t_buyer}">
											<input type="hidden" name="rep_productId" value="${bl.p_id}">
											<input type="submit" value="신고 완료">
											<input type="reset" value="취소">		
								</form>
							</div>

					</c:when>


				</c:choose>

			</tr>
		</c:forEach>
	</table>

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
									<td id="${sl.t_id}1s">송장번호입력: <input class="${sl.t_id}5"
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
								<td id="db_ok1">
									<!-- <input class="db_trace" type="button" value="배송추적"/ >-->
									수취확인 대기
								</td>
							</c:when>




						</c:choose>
					</tr>
				</c:when>
			</c:choose>

		</c:forEach>
	</table>




	<h2>거래된 물건</h2>


	<h2>산 물건</h2>
	<table id="buy">
		<tr>
			<th>주문번호</th>
			<th>상품명</th>
			<th>총 결제금액</th>
			<th>진행상태</th>
		</tr>

		<c:forEach var="cb" items="${completeBList}">
			<tr>
				<td>${cb.t_del_number }</td>
				<td>${cb.p_name}</td>
				<td>${cb.p_price }</td>
				<td>구매완료</td>
			</tr>
		</c:forEach>

	</table>
	
	
		<h2>판 물건</h2>
	<table id="sell">
		<tr>
			<th>주문번호</th>
			<th>상품명</th>
			<th>총 결제금액</th>
			<th>진행상태</th>
		</tr>

		<c:forEach var="cs" items="${completeSList}">
			<tr>
				<td>${cs.t_del_number }</td>
				<td>${cs.p_name}</td>
				<td>${cs.p_price }</td>
				<td>구매완료</td>
			</tr>
		</c:forEach>

	</table>
	
	





</body>
</html>