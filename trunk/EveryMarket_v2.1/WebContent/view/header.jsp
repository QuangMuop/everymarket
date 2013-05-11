<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body>

	<!-- Header -->
	<div id="h_out_header">
	<div id="h_inner_header">
		<c:choose>
			<c:when test="${member == null }">
				<a class="h_tag" id="header_register">ȸ������</a>
				<a id="h_bar" >|</a>
				<a class="h_tag" id="header_login">�α���</a>
			</c:when>
			<c:otherwise>
				<a class="h_tag" id="header_logout">�α׾ƿ�</a>
				<a id="h_bar" >|</a>
				<a class="h_tag" href="JJimbasket.do">��ٱ���</a>
				<a id="h_bar" >|</a>
				<a class="h_tag" href="trade_list.do">�ŷ�����</a>
				<a id="h_bar" >|</a>
				<!-- IndivMarket --> 
				<a class="h_tag" href="goMyMarket.go">�� ����</a>
				<a id="h_bar" >|</a>
				<a class="h_tag" href="goMyPage.go">���� ����</a>
				<a id="h_bar" >|</a>
				<div id="count_alarm" class="h_tag"><span>0</span></div>
				<a class="h_tag" id="header_message">�˸���</a>
				<a id="h_bar" >|</a>
				<a class="h_tag" id="header_chargeCash">ĳ������</a>
				<a id="h_bar" >|</a>
				<a class="h_tag" id="cash">${member.m_cash }
				<img class="coin" alt="" src="images/smarket/coin.png">
				</a>
				<div id="cash_in">
					�ŷ���������Ʈ<br>
					<div id="rest_point"></div>
				</div>
				<c:if test="${member.m_id == 'aa' }">
					<a id="h_bar" >|</a>
					<button  class="h_tag"  id="goAdminister">������������</button>
				</c:if>
				<a id="h_bar" >|</a>
				<a class="h_tag">${member.m_name }�� �ȳ��ϼ���.</a>
			</c:otherwise>
		</c:choose>
	</div>
	</div>
	<!--logo-image,search -->
	<div id="h_mid">
		<div id="h_logo">
			
		</div>
		<div id="h_searchbar">
			<form action="search_result.do" id="h_searchline" method="post">
						<input id="h_search" class="search-input" name="search_content" 
								type="text" placeholder="��ǰ�̳� �����̸��� �˻��غ�����" />
						<button id="h_sbutton" type="submit"></button>
			</form>
		</div>
	</div>
	<!-- List, JJimbasket -->
	<div id="h_menu">
		<ul id="h_menu" class="h_menu">
				<li>
					<a href="list.do?category=�Ƿ�">
						<img src="images/header/1.png" alt=""/>
						<span class="h_active"></span>
						<span class="h_wrap">
							<span class="h_link">�Ƿ�</span>
							<span class="h_descr">clothes</span>
						</span>
					</a>
					<div class="h_box">
							<a href="list.do?category=�����Ƿ�">�����Ƿ�</a>
							<a href="list.do?category=�����Ƿ�">�����Ƿ�</a>
							<a href="list.do?category=�������">�������</a>
							<a href="list.do?category=�����ӻ���Ƿ�">����/�ӻ�� �Ƿ�</a>
							<a href="list.do?category=��Ÿ�Ƿ�">��Ÿ�Ƿ�</a>
					</div>
				</li>
				<li>
					<a href="list.do?category=��ȭ">
						<img src="images/header/2.png" alt=""/>
						<span class="h_active"></span>
						<span class="h_wrap">
							<span class="h_link">��ȭ</span>
							<span class="h_descr">goods</span>
						</span>
					</a>
					<div class="h_box">
							<a href="list.do?category=�ð�">�ð�</a>
							<a href="list.do?category=�Ź�">�Ź�</a>
							<a href="list.do?category=�Ǽ�����">�Ǽ�����</a>
							<a href="list.do?category=ȭ��ǰ">ȭ��ǰ</a>
							<a href="list.do?category=��Ÿ��ȭ">��Ÿ��ȭ</a>
					</div>
				</li>
				<li>
					<a href="list.do?category=����">
						<img src="images/header/3.png" alt=""/>
						<span class="h_active"></span>
						<span class="h_wrap">
							<span class="h_link">����</span>
							<span class="h_descr">leisure</span>
						</span>
					</a>
					<div class="h_box">
							<a href="list.do?category=��������ǰ">��������ǰ</a>
							<a href="list.do?category=�ƿ�����">�ƿ�����</a>
							<a href="list.do?category=�ｺ��ǰ">�ｺ��ǰ</a>
					</div>
				</li>
				<li>
					<a href="list.do?category=���ڱ��">
						<img src="images/header/4.png" alt=""/>
						<span class="h_active"></span>
						<span class="h_wrap">
							<span class="h_link">���ڱ��</span>
							<span class="h_descr">electronic equipment</span>
						</span>
					</a>
					<div class="h_box">
							<a href="list.do?category=��ǻ�ͱ��">��ǻ�ͱ��</a>
							<a href="list.do?category=ī�޶�">ī�޶�</a>
							<a href="list.do?category=�޴���">�޴���</a>
							<a href="list.do?category=������ǰ">������ǰ</a>
					</div>
				</li>
				<li>
					<a href="list.do?category=��������">
						<img src="images/header/5.png" alt=""/>
						<span class="h_active"></span>
						<span class="h_wrap">
							<span class="h_link">����/����</span>
							<span class="h_descr">books/records</span>
						</span>
					</a>
					<div class="h_box">
							<a href="list.do?category=�����ҽ�">�����ҽ�</a>
							<a href="list.do?category=DVD">DVD</a>
							<a href="list.do?category=����">����</a>
							<a href="list.do?category=����">����</a>
					</div>
				</li>
				<li>
					<a href="list.do?category=����">
						<img src="images/header/6.png" alt=""/>
						<span class="h_active"></span>
						<span class="h_wrap">
							<span class="h_link">����</span>
							<span class="h_descr">furniture</span>
						</span>
					</a>
					<div class="h_box">
						<a href="list.do?category=ħ��">ħ��</a>
						<a href="list.do?category=å�ɻ�">å�ɻ�</a>
						<a href="list.do?category=����">����</a>
						<a href="list.do?category=���">���</a>
						<a href="list.do?category=��������">��������</a>
					</div>
				</li>
			</ul>
	</div>
	
	<br><br>
	
	<!-- Header �˾�â�� -->
	<div id="login" class="popUp hidden">
		<form action="login.do" method="post">
			<input name="m_id" type="text" placeholder="���̵� �Է��ϼ���" size="20"><br><br>
			<input name="m_pwd" type="password" placeholder="��й�ȣ�� �Է��ϼ���" size="20"><br><br>
			<input type="submit" value="�α���"><br><br>
		</form>
	</div>
	
	<div id="register" class="popUp hidden">
		<form action="registerMember.do" method="Post">
			<div>
				<h2 id="sign-up-title">EVERYMARKET ȸ������</h2>
			</div>
			<h3 id="info-title">���� �Է�</h3>
			<div class="box-center">
				<input type="text" class="input_txt" name="m_id" id="m_id" placeholder="���̵� (�ִ� 8��)" maxlength="8" /><br>
				<input type="text" class="input_txt" name="m_nick" id="m_nick" placeholder="�г��� (�ִ� 10��)" maxlength="10" /><br>
				<input type="text" class="input_txt" name="m_name" id="m_name" placeholder="�̸�" /><br>	
				<input type="password" class="input_txt" name="m_pwd" id="m_pwd" placeholder="��й�ȣ �Է�" maxlength="12" /><br>
				<input type="password" class="input_txt" name="m_pwdConfirm" id="m_pwdConfirm" placeholder="��й�ȣ Ȯ��" maxlength="12" />	<br>
				<select id="phone_choice" name="m_phone_1">
					<option value="010">010</option>
					<option value="011">011</option>
					<option value="017">017</option>
					<option value="019">019</option>
				</select> 
				<input type="text" class="number_txt" name="m_phone_2" id="m_phone_2" placeholder="��ȭ��ȣ ���ڸ�" size="4" maxlength="4" />
				<input	type="text" class="number_txt" name="m_phone_3" id="m_phone_3" placeholder="��ȭ��ȣ ���ڸ�" size="4" maxlength="4" />
				<input type="hidden" class="number_txt" name="m_phone" id="m_phone"><br>
				<input type="text" name="m_mail" id="m_mail">
				<input type="button" id="m_mailConfirm" value="�������Ϲ߼�"> <br>
				<input type="text" name="reg_confirm" id="reg_confirm"><br>
			</div>
			<div class="box-footer">
				<input class="box-btn" id="submit"  type="submit" value="ȸ������" /> 
				<input class="box-btn" type="reset" value="���" />
			</div>
		</form>		
	</div>
	
	<div id="chargeCash" class="popUp hidden">
		<form id="form1" action="chargeCash.do" method="post">
			<div>
				<h3 id="cash-title">EVERYMARKET ĳ������</h3>
			</div>
			<h3 id="info-title">�����ݾ�</h3>
			<div id="cash-choose">
				<p class="cash-meter">
					<input type="radio" name="m_cash" class="m_cash" value="5000"><label>5000</label>
				</p>
				<p class="cash-meter">
					<input type="radio" name="m_cash" class="m_cash" value="10000"><label>10000</label>
				</p>
				<p class="cash-meter">
					<input type="radio" name="m_cash" class="m_cash" value="15000"><label>15000</label>
				</p>
				<p class="cash-meter">
					<input type="radio" name="m_cash" class="m_cash" value="20000"><label>20000</label>
				</p>
				<p class="cash-meter">
					<input type="radio" name="m_cash" class="m_cash" value="30000"><label>30000</label>
				</p>
				<p class="cash-meter">
					<input type="radio" name="m_cash" class="m_cash" value="50000"><label>50000</label>
				</p>
				<p class="cash-meter">
					<input type="radio" id="m_cash_txt"> <input id="cash_txt" class="number_txt" 
							type="text" name="cash_txt" disabled="disabled" size="8">
				</p>
			</div>
	
			<h3 id="info-title">�������</h3>
			<div id="visa">
				<select id="visa-choose" name="user.gender">
					<option value="">���� ����� �����ϼ���</option>
					<option value="cellphone">�޴��� �Ҿ� ����</option>
					<option value="bank">���� ��ü</option>
					<option value="card">ī�� ����</option>
				</select>
			</div>
			<div class="box-footer">
				<input class="box-btn" type="submit" value="�����ϱ�"/> 
				<input class="box-btn" type="reset" value="����ϱ�"/>
			</div>
		</form>
	</div>
	
	<div id="list_message" class="popUp hidden"></div>
	<div id="notifier_message" class="popUp hidden">Ȯ������ ���� �޽����� �ֽ��ϴ�!</div>
	
</body>
</html>