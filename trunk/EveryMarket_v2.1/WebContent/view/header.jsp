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
				<a class="h_tag" id="header_chargeCash">ĳ������</a>
				<a id="h_bar" >|</a>
				<a class="h_tag" href="JJimbasket.do">��ٱ���</a>
				<a id="h_bar" >|</a>
				<!-- IndivMarket --> 
				<a class="h_tag" href="enter.do">���θ���������</a>
				<a id="h_bar" >|</a>
				<a class="h_tag" id="alarm">�˸���</a>
				<div id="alarm_in">
					<div>
					�˸�1
					</div>
				</div>
				<a id="h_bar" >|</a>
				<a class="h_tag">${member.m_name }�� �ȳ��ϼ���.</a>
			</c:otherwise>
		</c:choose>
	</div>
	</div>
	<!--logo-image,search -->
	<div id="h_mid">
		<div id="h_logo">
			<a>logo</a>
		</div>
		<div id="h_searchbar">
			<form action="main.do" id="h_searchline" method="get">
						<input id="h_search" class="search-input" name="search_content" 
								type="text" placeholder="��ǰ�̳� �����̸��� �˻��غ�����" />
						<button id="h_sbutton" type="submit"></button>
			</form>
		</div>
	</div>
	<!-- List, JJimbasket -->
	<div>
		����: 
		<a href="list.do?category=�Ƿ�">�Ƿ�</a>
		<a href="list.do?category=�����Ƿ�">�����Ƿ�</a> 
		<a href="JJimbasket.do">��</a>
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
				<input type="hidden" class="number_txt" name="m_phone" id="m_phone">
			</div>
			<div class="box-footer">
				<input class="box-btn" type="submit" value="ȸ������" /> 
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
	
</body>
</html>