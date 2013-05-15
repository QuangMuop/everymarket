<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">



<title>Insert title here</title>
</head>
<body>


	<div id="trade_menubar">
		<ul class="trade_menu">
			<li id="trade_tab1" class="nonselect selected"><img
				id="trade_tab1" src="image_trade/buy_info_tab.png"></li>
			<li id="trade_tab2" class="nonselect"><img id="trade_tab2"
				class="t_tab_img" src="image_trade/sell_info_tab_back.png"></li>
			<li id="trade_tab3" class="nonselect"><img id="trade_tab3"
				class="t_tab_img" src="image_trade/trade_info_tab_back.png"></li>
			<li id="trade_tab4" class="nonselect"><img id="trade_tab4"
				class="t_tab_img" src="image_trade/jjim_info_tab_back.png"></li>
		</ul>
	</div>

	<div id="trade_tab_inner1">
		<table id="buying" class="trade_table_box">
			<colgroup>
				<col width="15%">
				<col width="45%">
				<col width="20%">
				<col width="20%">
			</colgroup>
			<tr>
				<th>�ֹ���ȣ</th>
				<th>��ǰ��</th>
				<th>�������Ʈ</th>
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
					<td><img class="coin" alt="" src="images/smarket/coin.png">${bl.p_price
						}</td>
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



							<td><input type="button" id="accept" value="����Ȯ��"
								t_id="${bl.t_id}" /> <input type="button" id="report"
								value="�Ű��ϱ�" t_id="${bl.t_id}" /></td>

							<%-- <td><button id="accept" value="����Ȯ��" t_id="${bl.t_id}" >����Ȯ��</button> 
							<button id="report" value="�Ű��ϱ�" t_id="${bl.t_id}" >�Ű��ϱ�</button></td> --%>

						</c:when>
					</c:choose>
				</tr>
			</c:forEach>
		</table>




		<div id="main_report" class="popUp hidden">
			<div id="main_report_inner">
				<img alt="" id="main_report_title"
					src="image_trade/report_title_img.png">
				<div class="notice_report">
					<p>�Ű�� �� Ȯ�����ּ���!</p>
					<ul>
						<li>�ش� ȸ���� �Ű��� ��� �����ڰ� ��ǿ��� �Ǵ� �� ��ġ�� ���մϴ�.</li>
						<li>�Ű������ �������� ���� ��� �ش� �Ű�� �Ⱒ�� �� �ֽ��ϴ�.</li>
						<li>���ǹ��� �Ű������� �ݺ��� �Ű����� ��������� �� �� �ֽ��ϴ�.</li>
					</ul>
				</div>
				<form action="reportAction.do" method="post">
					<div id="r_box_top">
						<a id="trade_number"></a> <a id="trade_name"></a> <select
							id="report_choice" name="rep_reason">
							<!-- 					<option>���� ����</option> -->
							<option value="�� ��ǰ�� �ٸ� ��ǰ">�� ��ǰ�� �ٸ� ��ǰ</option>
							<option value="�������">��� ����</option>
							<option value="��ǰ �ҷ�">��ǰ �ҷ�</option>
							<option value="��Ÿ ����">��Ÿ ����</option>
						</select>
						<textarea name="rep_content" id="rep_content"></textarea>
					</div>
					<input type="hidden" id="rep_memberId" name="rep_memberId" value="">
					<input type="hidden" id="rep_writer" name="rep_writer" value="">

					<input type="hidden" id="rep_productId" name="rep_productId"
						value=""> <input type="submit" id="rp_ok" value="�Ű� �Ϸ�">

				</form>
			</div>
		</div>
	</div>


	<div id="trade_tab_inner2" class="trade_tab_hidden">
		<table id="selling" class="trade_table_box">
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
	</div>


	<div id="trade_tab_inner3" class="trade_tab_hidden">
		<div id="traded">
			<table id="buy" class="trade_table_box">
				<tr>
				<%-- 	<td>${cb.t_del_number }</td>
					<td>${cb.p_name}</td>
					<td>${cb.p_price }</td> 
					<td>���ſϷ�<button id="review_in_btn" value="${cb.p_id }">���侲��</button></td> --%>
					<th>�ֹ���ȣ</th>
					<th>��ǰ��</th>
					<th>�� �����ݾ�</th>
					<th colspan="2">�������</th>
				</tr>

				<c:forEach var="cb" items="${completeBList}">
					
					<tr>
						<td>${cb.t_del_number }</td>
						<td>${cb.p_name}</td>
						<td>${cb.p_price }</td>
						<td>���ſϷ�</td>
						<td>
						<c:choose>
							<c:when test="${cb.t_status == 4}">
								<button id="review_bt" value="${cb.p_id}">���侲��</button>
							</c:when>
							<c:when test="${cb.t_status == 6 }">
							   �����ۼ��Ϸ�
							</c:when>

						</c:choose>
						</td>
					</tr>
				</c:forEach>

			</table>


			<table id="sell" class="trade_table_box">
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
						<td>�ǸſϷ�</td>
					</tr>
				</c:forEach>

			</table>
		</div>
	</div>
	<div id="trade_tab_inner4" class="trade_tab_hidden">

		<table class="trade_table_box">
			<colgroup>
				<col width="15%">
				<col width="15%">
				<col width="25%">
				<col width="15%">
				<col width="15%">
				<col width="15%">
			</colgroup>
			<tr>
				<th>��ǰ�̹���</th>
				<th>��ǰ��</th>
				<th>�󼼼���</th>
				<th>��ǰ�ݾ�</th>
				<th>�Ǹ���</th>
				<th>����</th>
			</tr>

			<c:forEach var="JP" items="${jjimList}">
				<tr class="${JP.p_id}j">
					<td><img id="jjim_list_img" src="image_product/${JP.p_img}"></td>
					<td>${JP.p_name}</td>
					<td>${JP.p_detail}</td>
					<td>${JP.p_price}</td>
					<td>${JP.m_id}</td>
					<td><button class="delete_button" p_id="${JP.p_id}">����</button>
						<button class="buyj_button" p_id="${JP.p_id}">�����ϱ�</button>
					</td>
				</tr>
			</c:forEach>

			<tr>
				<td colspan="5">�� �ݾ� ${jjim_sum}</td>
			</tr>

		</table>

	</div>


	<!-- <!-- �Ű��ϱ� �˾� -->
	<div id="main_report" class="popUp hidden">
		<form action="reportAction.do" method="post">
			<div id="trade_number"></div>
			<div id="trade_name"></div>
			<br> �Ű� ���� :<select id="report_choice" name="rep_reason">
				<option value="�� ��ǰ�� �ٸ� ��ǰ">�� ��ǰ�� �ٸ� ��ǰ</option>
				<option value="�������">��� ����</option>
				<option value="��ǰ �ҷ�">��ǰ �ҷ�</option>
				<option value="��Ÿ ����">��Ÿ ����</option>
			</select><br> �Ű��� ����
			<textarea name="rep_content" id="rep_content"></textarea>
			<br> <input type="hidden" id="rep_memberId" name="rep_memberId"
				value=""> <input type="hidden" id="rep_writer"
				name="rep_writer" value=""> <input type="hidden"
				id="rep_productId" name="rep_productId" value=""> <input
				type="submit" id="rp_ok" value="�Ű� �Ϸ�">
			<button type="submit">�Ű�Ϸ�</button>
			<button type="reset">���</button>
		</form>
	</div>




	<!-- ���侲�� �˾�  -->
	<div id="review_pop" class="popUp hidden">
		<form action="reviewAction.do" method="post">
			<div id="rp_name"></div>
			<input type="hidden" id="rp_id" name="p_id" value=""> <br>
			���� :<select id="r_score" name="r_score">
				<option value="1">1</option>
				<option value="2">2</option>
				<option value="3">3</option>
				<option value="4">4</option>
				<option value="4">5</option>
			</select><br> �Ű��� ����
			<textarea name="r_content" id="r_content"></textarea>
			<br> <input type="submit" id="rp_ok1" value="�ۼ� �Ϸ�"> <input
				type="reset" value="���">
		</form>
	</div>


</body>
</html>