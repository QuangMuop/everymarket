<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body>
	<div id="mypage_body">
		<div id="side_bar">
			<div id="b_bottomline">
				<img alt="" src="image_mypage/mymarket.png">
			</div>
			<div id="my_inf">

				<a id="m_nickname">${member.m_name}</a> <a id="m_nickplus">����
					�������</a>
				<div id="m_class">
					<div id="my_cash">
						<div>
							<a>���� CASH����</a> <a id="my_cash_view">${member.m_cash }</a> <a>�Դϴ�.</a>
						</div>
					</div>
				</div>


			</div>
			<div id="out_menu">
				<ul id="m_menu_bar">
					<li id="menu1">ȸ������ ��ȸ/����</li>
					<li id="menu2">cash ����/ȯ��</li>
					<li id="menu3">�ŷ�����</li>
				</ul>
			</div>
		</div>

		<div id="contents">
			<div class="out_hidden" id="contents1">
				<div id="c_top">
					<img alt="" id="c_inner_img" src="image_mypage/statuschange.png">
					<a class="c_font">|</a> <a class="c_font">������ ȸ�������� �����Ͻ� ��
						�ֽ��ϴ�. ȸ�������� �����Ͻð� �ݵ�� �ϴܿ� �ִ� Ȯ�� ��ư�� Ŭ���� �ּž� �մϴ�.</a>
				</div>
				<div id="c_inner1">
					<img alt="" id="c_repass" src="image_mypage/repassword.png">
					<div id="c_inner_block">
						<div class="c_inner_input">
							<img alt="" class="repass_img" id="repass_id"
								src="image_mypage/id.png"> <a>${member.m_id}</a>
						</div>
						<div class="c_inner_input">
							<img alt="" class="repass_img" src="image_mypage/password.png">
							<input id="c_inner_pass_input1" name="c_inner_pass_input1"
								type="password"> ȸ������ ������ �����ϰ� ��ȣ�ϱ� ���� ��й�ȣ�� �ٽ� �ѹ� Ȯ��
							�մϴ�.
						</div>
					</div>
					<button class="c_button" id="c_ok1" pass="${member.m_pwd}">Ȯ��</button>
					<button class="c_button" id="c_cencle1">���</button>
				</div>

				<div id="re_member" class="c_inner_hidden">
					<img alt="" id="c_remember" src="image_mypage/c_title.png">
					<table id="c_table">

						<tr>
							<th class="row">
								<p>�̸�</p>
							</th>
							<td>${member.m_name}</td>
						</tr>
						<tr>
							<th class="row">
								<p>���̵�</p>
							</th>
							<td id="memberinfo_m_id">${member.m_id }</td>
						</tr>
						<tr>
							<th class="row">
								<p>����й�ȣ</p>
							</th>
							<td><input id="re_password" class="c_input" type="password"
								name="re_password"></td>
						</tr>
						<tr>
							<th class="row">
								<p>����й�ȣ��Ȯ��</p>
							</th>
							<td><input id="re_password" class="c_input" type="password"
								name="re_password2"></td>
						</tr>
						<tr>
							<th class="row">
								<p>�̸����ּ�</p>
							</th>
							<td><input id="re_email_first" class="c_input" type="text"
								value="�̸���" name="re_email_first"> @ <input
								id="re_email_second" class="c_input" type="text" value="�̸���"
								name="re_email_second"></td>
						</tr>
						<tr>
							<th class="row">
								<p>�޴��� ��ȣ</p>
							</th>
							<td><select id="select_phone">
									<option>010</option>
									<option>011</option>
									<option>017</option>
							</select> <input id="re_phone_first" class="c_input" type="text"
								value="�չ�ȣ" name="re_phone_first"> <input
								id="re_phone_second" class="c_input" type="text" value="�޹�ȣ"
								name="re_phone_second"></td>
						</tr>
					</table>
					<button class="c_button" id="c_ok_update">Ȯ��</button>
					<button class="c_button" id="c_cencle">���</button>
				</div>
			</div>


			<div class="out_hidden" id="contents2">
				<div id="c_top">
					<img alt="" id="c_inner_img" src="image_mypage/cash_title.png">
					<a class="c_font">|</a> <a class="c_font">������ ����Ʈ�� �����̳� ȯ���Ͻ� ��
						�ֽ��ϴ�.</a>
				</div>
				<div id="c_inner2">
					<img alt="" id="c_repass" src="image_mypage/repassword.png">
					<div id="c_inner_block">
						<div class="c_inner_input">
							<img alt="" class="repass_img" id="repass_id"
								src="image_mypage/id.png"> <a>${member.m_id}</a>

						</div>

						<div class="c_inner_input">
							<img alt="" class="repass_img" src="image_mypage/password.png">
							<input id="c_inner_pass_input2" type="password"> ȸ������ ������
							�����ϰ� ��ȣ�ϱ� ���� ��й�ȣ�� �ٽ� �ѹ� Ȯ�� �մϴ�.
						</div>
					</div>
					<button class="c_button" id="c_ok2" pass="${member.m_pwd}">Ȯ��</button>
					<button class="c_button" id="c_cencle2">���</button>
					</div>
				
					<div id="m_cash_detail" class="c_inner_hidden">
						<div id="c_inner_box">
							<img alt="" id="c_remember" src="image_mypage/cash_add.png">
						</div>
						<div id="m_cash_view" class="cash_recharge">
							<ul>
								<li>ĳ�� ������ �ǽð� ������ü, �������Ա�, �޴���, �ſ�ī�� ������ �����մϴ�.</li>
								<li>�������Ա����� ���� �� �Ա� ������ 5�����Ϸ� �Աݱ����� �������Ա��� ���� ���� ��� �ڵ�
									��ҵ˴ϴ�.</li>
								<li>ĳ�� 1ȸ �ּ� ���� �ݾ��� 1000���̸�, �ִ� ���� �ݾ��� 200�������� �ѵ��� �����մϴ�.</li>
								<li>���� ��û �� �Ա� ������ ��Ұ� �����ϸ�, �Ա� �Ŀ��� �����ϱ⸦ ���� �������� �����Ͻ� ��
									�ֽ��ϴ�.</li>
								<li>Ÿ������ �Ա� �� ������� ���δ��Դϴ�.</li>
							</ul>
							<button class="c_button" id="c_recharge_button">�����ϱ�</button>
						</div>
						<div id="c_inner_box">
							<img alt="" id="c_remember" src="image_mypage/cash_down.png">
						</div>
						<div id="m_cash_view">
							<ul>
								<li>CASH�� ������ü�� �ſ�ī��, �޴������� ���� ���� ���������ϸ� �ٸ� ����ڿ� �ŷ�����
									���˴ϴ�.</li>
								<li>CASH ���ó�� EVERYMARKET�Դϴ�.</li>
								<li>���ڱ����ŷ��� �� ���� ���ɿ� ���� ���� ���� "����Ʈ ���� �ѵ� 200���� ����"�� ���Ե˴ϴ�.</li>
								<li>���ڱ��� ����ɿ� ���� ����Ʈ/���ϸ��� �ջ� �ݾ��� 50���� �ʰ��� ��� �Ǹ����� �� �����
									�����մϴ�.</li>
							</ul>
						</div>
						<button class="c_button" id="c_respond_button">ȯ���ϱ�</button>
					</div>
				</div>
				<!-- <<<<<<< .mine -->
				<!-- 	////////////////////////////////////�ŷ����� -->
				<%-- <center> --%>
				 <!-- 	<div class="out_hidden" id="contents3">
						=======
						<button class="c_button" id="c_respond_button">ȯ���ϱ�</button>
					</div>  -->
			<!-- </div> -->
			<!-- 	////////////////////////////////////�ŷ����� -->
			<center>
				<div id="contents3">
				
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
								<tr class="bl" t_id="${bl.t_id }">

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
											<td class="td_db_trace">
												<button class="db_trace" id="trace_page" t_id="${bl.t_id}">�������</button>
											</td>
										</c:when>
										<c:when test="${bl.t_status == 3}">
											<td id="db_text">��ۿϷ�</td>
											<td><button id="accept" value="����Ȯ��" t_id="${bl.t_id}">����Ȯ��</button>
												<button id="report" value="�Ű��ϱ�" t_id="${bl.t_id}">�Ű��ϱ�</button></td>
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
									<input type="hidden" id="rep_memberId" name="rep_memberId"
										value=""> <input type="hidden" id="rep_writer"
										name="rep_writer" value=""> <input type="hidden"
										id="rep_productId" name="rep_productId" value=""> <input
										type="submit" id="rp_ok" value="�Ű� �Ϸ�">

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
														<td id="${sl.t_id}1s"><input class="${sl.t_id}5"
															type="text" id="s_num_input"
															placeholder="�����ȣ�� �Է����ּ���(8�ڸ�)"> <!-- �ŷ���ȣ or ���δ�Ʈ ���̵� -->
														</td>
														<td id="${sl.t_id}2"><input class="dn_bt"
															type="button" value="Ȯ��" t_id="${sl.t_id}"
															name="${sl.t_status}"></td>

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
										<td id="R_td" class=${cb.p_id }><c:choose>
												<c:when test="${cb.t_status == 4}">
													<button id="review_in_btn" class="${cb.p_id }"  value="${cb.p_id}">���侲��</button>
												</c:when>
												<c:when test="${cb.t_status == 6 }">
							   �����ۼ��Ϸ�
							</c:when>

											</c:choose></td>
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
									<td><img id="jjim_list_img"
										src="image_product/${JP.p_img}"></td>
									<td>${JP.p_name}</td>
									<td>${JP.p_detail}</td>
									<td>${JP.p_price}</td>
									<td>${JP.m_id}</td>
									<td><button class="delete_button" p_id="${JP.p_id}">����</button>
										<button class="buyj_button" p_id="${JP.p_id}">�����ϱ�</button></td>
								</tr>
							</c:forEach>
						</table>
					</div>
				</div>
			</center>
		</div>
	</div>


	<!-- ���侲�� �˾�  -->
	<div id="review_pop" class="popUp hidden">
		<!-- <form> -->
			<div id="rp_name"></div>
			<input type="hidden" id="rp_id" name="p_id" value=""> <br>
			���� :<select id="r_score" name="r_score">
				<option value="-2">-2</option>
				<option value="-1">-1</option>
				<option value="0">0</option>
				<option value="1">1</option>
				<option value="2">2</option>
			</select><br> ���䳻��
			<textarea name="r_content" id="r_content"></textarea>
			<br> <!-- <input type="submit" id="rp_ok1" value="�ۼ� �Ϸ�"> -->
			<button id="rp_ok1" value="">�ۼ� �Ϸ�</button>
			 <input
				type="reset" value="���">
	<!-- 	</form> -->
	</div>
</body>
</html>