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

/* tr�Ⱥ��̰� �ϱ� */
.dis_tr {
	display: none;
}
</style>
</head>
<body>


	<div id="trade_menubar">
		<ul class="trade_menu">
			<li id="buying_trade" class="active"><a class="tab-btn1"
				id="search_item">���� ������</a></li>

			<li id="selling_trade"><a class="tab-btn1" id="search_blog">�Ǹ�
					������</a></li>

			<li id="All_traded"><a class="tab-btn1" id="search_blog">�ŷ�
					�Ϸ���</a></li>
		</ul>
	</div>




	<h1>��¹���</h1>
	<table id="buying">

		<tr>
			<th>�ֹ���ȣ</th>
			<th>��ǰ��</th>
			<th>�� �����ݾ�</th>
			<th colspan="2">�������</th>
		</tr>

		<c:forEach var="bl" items="${buyingList}">
			<tr id="${bl.t_id}">

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
						<td id="button"><input class="db_trace" type="button"
							value="�������" t_id="${bl.t_id}" /></td>
					</c:when>

					<c:when test="${bl.t_status == 3}">
						<td id="db_text">��ۿϷ�</td>


						<td><input type="button" id="accept" value="����Ȯ��" t_id="${bl.t_id}" /> 
							<input type="button" id="report" value="�Ű��ϱ�" t_id="${bl.t_id}" /></td>
					</c:when>


				</c:choose>

			</tr>
		</c:forEach>
	</table>
	
	<div id="main_report" class="popUp hidden">
		<form action="reportAction.do" method="post">
		<div id="trade_number"></div>
		<div id="trade_name"></div>
			<br> �Ű� ����
			:<select id="report_choice" name="rep_reason">
				<option value="�� ��ǰ�� �ٸ� ��ǰ">�� ��ǰ�� �ٸ� ��ǰ</option>
				<option value="�������">��� ����</option>
				<option value="��ǰ �ҷ�">��ǰ �ҷ�</option>
				<option value="��Ÿ ����">��Ÿ ����</option>
			</select><br> �Ű��� ����
			<textarea name="rep_content" id="rep_content"></textarea>
			<br> <input type="hidden" id="rep_memberId" name="rep_memberId" value="">
			 <input type="hidden" id="rep_writer" name="rep_writer" value=""> 
											 
			<input type="hidden" id="rep_productId" name="rep_productId" value="">
			<input type="submit" id="rp_ok" value="�Ű� �Ϸ�"> <input
				type="reset" value="���">
		</form>
	</div>
	
	<%-- <div id="main_report" class="popUp hidden">
		<form action="reportAction.do" method="post">
		<div id=${bl.t_id }nb></div>
		<div id=${bl.t_id }re></div>
			<br> �Ű� ����
			:<select id="report_choice" name="rep_reason">
				<option value="�� ��ǰ�� �ٸ� ��ǰ">�� ��ǰ�� �ٸ� ��ǰ</option>
				<option value="�������">��� ����</option>
				<option value="��ǰ �ҷ�">��ǰ �ҷ�</option>
				<option value="��Ÿ ����">��Ÿ ����</option>
			</select><br> �Ű��� ����
			<textarea name="rep_content" id="rep_content"></textarea>
			<br> <input type="hidden" id="${bl.t_id}rep_memberId" name="rep_memberId" value="">
			 <input type="hidden" id="${bl.t_id}rep_writer" name="rep_writer" value=""> 
											 
			<input type="hidden" name="rep_productId" value="${bl.p_id}">
			<input type="submit" id="rp_ok" value="�Ű� �Ϸ�" t_id = ${bl.p_id } > <input
				type="reset" value="���">
		</form>
	</div> --%>

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
									<td id="${sl.t_id}1s">�����ȣ�Է�: <input class="${sl.t_id}5"
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
								<td id="db_ok1">
									<!-- <input class="db_trace" type="button" value="�������"/ >-->
									����Ȯ�� ���
								</td>
							</c:when>




						</c:choose>
					</tr>
				</c:when>
			</c:choose>

		</c:forEach>
	</table>




	<h2>�ŷ��� ����</h2>


	<h2>�� ����</h2>

	<div id="traded">
		<table id="buy">
			<tr>
				<th>�ֹ���ȣ</th>
				<th>��ǰ��</th>
				<th>�� �����ݾ�</th>
				<th>�������</th>
			</tr>

			<c:forEach var="cb" items="${completeBList}">
				<tr>
					<td>${cb.t_del_number }</td>
					<td>${cb.p_name}</td>
					<td>${cb.p_price }</td>
					<td>���ſϷ�</td>
				</tr>
			</c:forEach>

		</table>


		<h2>�� ����</h2>
		<table id="sell">
			<tr>
				<th>�ֹ���ȣ</th>
				<th>��ǰ��</th>
				<th>�� �����ݾ�</th>
				<th>�������</th>
			</tr>


			<c:forEach var="cs" items="${completeSList}">
				<tr>
					<td>${cs.t_del_number }</td>
					<td>${cs.p_name}</td>
					<td>${cs.p_price }</td>
					<td>���ſϷ�</td>
				</tr>
			</c:forEach>

		</table>


		<h2>�� ����Ʈ</h2>

		<table>
			<tr>
				<th>��ǰ��/�ɼ�����</th>
				<th>��ǰ�ݾ�</th>
				<th>�Ǹ���</th>
				<th>����</th>
				<th>�����ϱ�</th>
			</tr>

			<c:forEach var="JP" items="${jjimList}">
				<tr class="${JP.p_id}j">
					<td>${JP.p_name}<br> <img alt=""
						src="image_product/${JP.p_img}"> ${JP.p_detail}
					</td>
					<td>${JP.p_price}</td>
					<td>${JP.m_id}</td>
					<td><button class="delete_button" p_id="${JP.p_id}">����</button></td>
					<td><button class="buyj_button" p_id="${JP.p_id}">�����ϱ�</button></td>
				</tr>
			</c:forEach>
			<tr>
				<td colspan="5">�� �ݾ� ${jjim_sum}</td>
			</tr>





		</table>

	</div>





</body>
</html>