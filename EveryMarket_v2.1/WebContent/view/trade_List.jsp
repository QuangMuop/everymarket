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
			alert("�ŷ� �Ϸ�");
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


	<h1>��¹���</h1>
	<table id="buying">

		<tr>
			<th>�ֹ���ȣ</th>
			<th>��ǰ��</th>
			<th>�� �����ݾ�</th>
			<th colspan="2">�������</th>
		</tr>

		<c:forEach var="bl" items="${buyingList}">
			<tr>

				<c:choose>
					<c:when test="${bl.t_status == 1 }">
						<td>���δ��</td>

					</c:when>
					<c:otherwise>
						<td>${bl.t_del_number}</td>
					</c:otherwise>

				</c:choose>


				<td>${bl.p_name }</td>
				<td>${bl.p_price }</td>

				<c:choose>
					<c:when test="${bl.t_status == 1}">
						<td colspan="2">����غ���</td>
					</c:when>
					<c:when test="${bl.t_status == 2 }">
						<td id="${bl.t_id}3">�����</td>
						<td><input class="db_trace" type="button" value="�������"
							t_id="${bl.t_id}" /></td>
					</c:when>

					<c:when test="${bl.t_status == 3}">
						<td id="db_text">��ۿϷ�</td>
<<<<<<< .mine
						<td><input class="deliver_submit" type="button" value="����Ȯ��" />
							<input class="deliver_reports" type="button" value="�Ű��ϱ�" /></td>
=======
						<td>
						<input type="hidden" id="t_id" value="${bl.t_id}">
						<input  type="button"  id="accept" value="����Ȯ��" />
						 <input class="db_trace" type="button" id="report" value="�Ű��ϱ�" /></td>
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
	<h2>�Ȱ��ִ� ����</h2>
	<table id="selling">
		<tr>
			<th>�ֹ���ȣ</th>
			<th>��ǰ��</th>
			<th>�� �����ݾ�</th>
			<th colspan="2">�������</th>
		</tr>

		<c:forEach var="sl" items="${sellingList}">
			<c:choose>

				<c:when test="${sl.t_status > 0 }">

					<tr t_ids="${sl.t_id}" t_status="${sl.t_status}">
						<c:choose>
							<c:when test="${sl.t_status == 1 }">
								<td id="${sl.t_id}4">�ֹ����</td>
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
									<td id="${sl.t_id}1">�����ȣ�Է�: <input class="${sl.t_id}5"
										type="text"> <!-- �ŷ���ȣ or ���δ�Ʈ ���̵� -->
									</td>
									<td id="${sl.t_id}2"><input class="dn_bt" type="button"
										value="Ȯ��" t_id="${sl.t_id}" name="${sl.t_status}"></td>

								</form>
							</c:when>


							<c:when test="${sl.t_status == 2 }">
								<td id="${sl.t_id}3">�����</td>
								<td><input class="db_trace" type="button" value="�������"
									t_id="${sl.t_id}" /></td>
							</c:when>

							<c:when test="${sl.t_status == 3 }">
								<td id="db_text">��ۿϷ�</td>
								<td><input class="db_trace" type="button" value="�������" /></td>
							</c:when>




						</c:choose>
					</tr>
				</c:when>
			</c:choose>

		</c:forEach>
	</table>

	<div class="popUp hidden">
		<form action="">
		      �ŷ� ��ȣ : ${sl.t_id}
			�Ű� ��ǰ�� : ${sl.}
			�Ű� ���� : 
		</form>
	
	</div>




</body>
</html>