
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
					<button class="h_tag" id="goQnaBoard">QnA�Խ���</button>
					<a id="h_bar" >|</a>
					<!-- IndivMarket --> 
					<a class="h_tag" href="goMyMarket.go">�� ����</a>
					<a id="h_bar" >|</a>
					<a class="h_tag" href="goMyPage.go">���� ����</a>
					<a id="h_bar" >|</a>
					<div id="count_alarm" class="h_tag"><span>0</span></div>
					<a class="h_tag" id="header_message">�˸���</a>
					<a id="h_bar" >|</a>
					<a class="h_tag" id="header_cash">
						<span></span>
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
		<img id="h_logo" src="images/header/logo_everymarket.gif">

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
				<a href="list.do?category=�����а���">
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
	
	<!-- Header �˾�â�� -->
	<div id="login" class="popUp hidden">
		<div id="login_box">
			<img id="login_title_img" alt="" src="image_popup/login_title.png">
			<div id="login_inner_box">
				<form action="login.do" id="login_form" method="post">
					<input class="login_input" name="m_id" type="text" placeholder="���̵� �Է��ϼ���" size="20"><br><br>
					<input class="login_input" name="m_pwd" type="password" placeholder="��й�ȣ�� �Է��ϼ���" size="20"><br><br>
					<div id="login_button_box">
						<img id="login_button_img" alt="" src="image_popup/login_button.png">
						<input id="login_button" type="submit" value="">
					</div>	
				</form>
			</div>
			<div id="login_inner_box">
				<button id="join_button" >
					<img class="login_bottom_button"alt="" src="image_popup/m_join.png">
				</button>
				<button id="find_id_button" >
					<img class="login_bottom_button"alt="" src="image_popup/id_find.png">
				</button>
				<button id="find_pwd_button" >
					<img class="login_bottom_button"alt="" src="image_popup/password_find.png">
				</button>
			</div>
		</div>
	</div>
	
	<div id="register" class="popUp hidden">
		<div id="clause">
			<img alt="" id="join_form_img" src="image_popup/join_form.png">
			<img alt="" id="clause_title_img" src="image_popup/clause_title.png">
			<div id="clause_box">
			<p>EVERYMARKET ȸ�����</p>
			<div id="clause_content">
				<a>[�� 1�� ��Ģ]</a>
					<ul>
						<li>��1��(����)
							<ul>
								<a>�� ����� ��EVERTMARKET(���� "ȸ��"��� �մϴ�)�� ��ϴ� ���ͳݻ���Ʈ�� ���Ͽ� �����ϴ� ���ڻ�ŷ� ���� ����(���� " ����"��� �մϴ�)�� �̿��Կ� �־� ȸ��� �̿����� �Ǹ����ǹ� �� å�ӻ����� ���ϴ� ���� �������� �մϴ�.</a>
							</ul>
						</li>
						<li>��2��(����)
							<ul>
								<a>
								    �� "������ũINT"�� ���� ȸ�簡 ��ȭ �Ǵ� �뿪�� �̿��ڿ��� �����ϱ� ���Ͽ� ��ǻ�� �� ������ż��� �̿��Ͽ� ��ȭ �Ǵ� �뿪�� �ŷ��� �� �ֵ��� ������ ������ ������(www.interpark.com �Ǵ� www.interpark.co.kr)�� ���ϸ�, �ƿ﷯ ���̹� ���� ��ϴ� ������� �ǹ̷ε� ����մϴ�. ��, ��������Ʈ��, ��Ʈ/������, ����, ����/��ȭ �� ���ο� ���ϸ� �ٸ� ���� ������ �� www.playdb.co.kr�� �����մϴ�.
								    �� "�̿���"�� ���� ȸ�翡 �����Ͽ� �� ����� ���� ȸ�簡 �����ϴ� ���񽺸� �޴� ȸ�� �� ��ȸ���� ���մϴ�.
								    �� "ȸ��"�̶� ���� ȸ�翡 ���������� �����Ͽ� ȸ������� �� �ڷμ�, ȸ���� ������ ���������� ����������, ȸ�簡 �����ϴ� ���񽺸� ��������� �̿��� �� �ִ� �ڸ� ���մϴ�.
								    �� "��ȸ��"�̶� ���� ȸ���� �������� �ʰ� ȸ�簡 �����ϴ� ���񽺸� �̿��ϴ� �ڸ� ���մϴ�.
								    �� "Tikiȸ��"�̶� ���� ȸ���� Ƽ�Ͽ���/ENT���񽺿� ���������� �����ϰ�, ȸ������� �� �ڷμ� ȸ�� ������ �� Tikiȸ�� �Ⱓ �� ȸ���� ������ ���������� ����������, ȸ�簡 �����ϴ� ����ȸ�� ���񽺸� �̿��� �� �ִ� ȸ������ Ƽ�Ϻι��� ���մ� ��.
								    �� "��� ȸ��"�̶� ���� ȸ�翡 ��ȣ���� ���Ǹ� ��� ���������� �����ϰ� ȸ������ ����� ��14�� �̸��� �ڷμ�, ȸ���� ������ �����ް�, ȸ�簡 �����ϴ� ���񽺸� ��������� �̿��� �� �ִ� �ڸ� �ǹ��մϴ�.
								    �� "���¸���"�̶� ���� ȸ�縦 ���Ͽ� �Ǹ��ڿ� �����ڰ��� ��ǰ �Ÿ� �ŷ��� �̷���� �� �ִ� ���̹� �ŷ���Ҹ� �¶� ������ �����ϴ� ���� �� ���� �ΰ� ���� ��ü�� ���ϸ� www.interpark.com ����Ʈ�� ù ȭ�� �Ǵ� ���μ��񽺸� ���մϴ�.
								    �� "�Ǹ���"�� ���� �� ��� �� ���¸��� �Ǹ��ھ���� �����ϰ�, ȸ��� ���� �̿����� ü���� �ڸ� ���ϸ�, ��ǰ�� �Ǹ��� �ǻ�� �ش� ��ǰ�� ȸ�簡 �¶������� �����ϴ� ��Ŀ� ���߾� ����� ���� �ǹ̷ε� ����մϴ�.
								    �� "������"�� ���� ��ȭ �Ǵ� �뿪�� ������ �ǻ縦 ȸ�簡 �¶������� �����ϴ� ��Ŀ� ���߾� ���� �̿��ڸ� ���ϸ�, ȸ�� �� ��ȸ�� ������ ��θ� �ǹ��մϴ�.
								    �� "I-Point"�� ���� �̿��ڰ� ������ũINT �� ���ͻ���Ʈ(������ũ����, ������ũHM��)���� ��ȭ�� �����ϰų� �뿪�� �̿��ϰ� �� �밡�� �����ϴµ� ����ϱ� ���Ͽ� ��������ũINT�� ����, �����ϴ� ���ϸ��� ������ ���ҽ� �������޼����� ���մϴ�.
								</a>
							</ul>
						</li>
					</ul>
				</div>
				<div class="agree">
					<input id="agree_rule" type="checkbox">
					<a>EVERYMARKET ȸ������� �����մϴ�.</a>
				</div>
				<p>���ڱ����ŷ� �̿���</p>
				<div id="clause_content">
					<ul>
						<li>1. ����
							<ul>
								<a>EVERYMARKET�� EVERYMARKETȸ������ ����, ����, Ƽ�� ����, ����/����/�װ� ���� ���񽺿� ȸ����������, �׸��� ���� �پ��� ���� ������ ���Ͽ� �Ʒ��� ���� ȸ���� ���������� ����, Ȱ���մϴ�.</a>
							</ul>
						</li>
						<li>��2��(����)
							<ul>
								<a>
								    �� "������ũINT"�� ���� ȸ�簡 ��ȭ �Ǵ� �뿪�� �̿��ڿ��� �����ϱ� ���Ͽ� ��ǻ�� �� ������ż��� �̿��Ͽ� ��ȭ �Ǵ� �뿪�� �ŷ��� �� �ֵ��� ������ ������ ������(www.interpark.com �Ǵ� www.interpark.co.kr)�� ���ϸ�, �ƿ﷯ ���̹� ���� ��ϴ� ������� �ǹ̷ε� ����մϴ�. ��, ��������Ʈ��, ��Ʈ/������, ����, ����/��ȭ �� ���ο� ���ϸ� �ٸ� ���� ������ �� www.playdb.co.kr�� �����մϴ�.
								    �� "�̿���"�� ���� ȸ�翡 �����Ͽ� �� ����� ���� ȸ�簡 �����ϴ� ���񽺸� �޴� ȸ�� �� ��ȸ���� ���մϴ�.
								    �� "ȸ��"�̶� ���� ȸ�翡 ���������� �����Ͽ� ȸ������� �� �ڷμ�, ȸ���� ������ ���������� ����������, ȸ�簡 �����ϴ� ���񽺸� ��������� �̿��� �� �ִ� �ڸ� ���մϴ�.
								    �� "��ȸ��"�̶� ���� ȸ���� �������� �ʰ� ȸ�簡 �����ϴ� ���񽺸� �̿��ϴ� �ڸ� ���մϴ�.
								    �� "Tikiȸ��"�̶� ���� ȸ���� Ƽ�Ͽ���/ENT���񽺿� ���������� �����ϰ�, ȸ������� �� �ڷμ� ȸ�� ������ �� Tikiȸ�� �Ⱓ �� ȸ���� ������ ���������� ����������, ȸ�簡 �����ϴ� ����ȸ�� ���񽺸� �̿��� �� �ִ� ȸ������ Ƽ�Ϻι��� ���մ� ��.
								    �� "��� ȸ��"�̶� ���� ȸ�翡 ��ȣ���� ���Ǹ� ��� ���������� �����ϰ� ȸ������ ����� ��14�� �̸��� �ڷμ�, ȸ���� ������ �����ް�, ȸ�簡 �����ϴ� ���񽺸� ��������� �̿��� �� �ִ� �ڸ� �ǹ��մϴ�.
								    �� "���¸���"�̶� ���� ȸ�縦 ���Ͽ� �Ǹ��ڿ� �����ڰ��� ��ǰ �Ÿ� �ŷ��� �̷���� �� �ִ� ���̹� �ŷ���Ҹ� �¶� ������ �����ϴ� ���� �� ���� �ΰ� ���� ��ü�� ���ϸ� www.interpark.com ����Ʈ�� ù ȭ�� �Ǵ� ���μ��񽺸� ���մϴ�.
								    �� "�Ǹ���"�� ���� �� ��� �� ���¸��� �Ǹ��ھ���� �����ϰ�, ȸ��� ���� �̿����� ü���� �ڸ� ���ϸ�, ��ǰ�� �Ǹ��� �ǻ�� �ش� ��ǰ�� ȸ�簡 �¶������� �����ϴ� ��Ŀ� ���߾� ����� ���� �ǹ̷ε� ����մϴ�.
								    �� "������"�� ���� ��ȭ �Ǵ� �뿪�� ������ �ǻ縦 ȸ�簡 �¶������� �����ϴ� ��Ŀ� ���߾� ���� �̿��ڸ� ���ϸ�, ȸ�� �� ��ȸ�� ������ ��θ� �ǹ��մϴ�.
								    �� "I-Point"�� ���� �̿��ڰ� ������ũINT �� ���ͻ���Ʈ(������ũ����, ������ũHM��)���� ��ȭ�� �����ϰų� �뿪�� �̿��ϰ� �� �밡�� �����ϴµ� ����ϱ� ���Ͽ� ��������ũINT�� ����, �����ϴ� ���ϸ��� ������ ���ҽ� �������޼����� ���մϴ�.
								</a>
							</ul>
						</li>
					</ul>
				</div>
				<div class="agree">
					<input id="agree_eft" type="checkbox">
					<a>���ڱ����ŷ� �̿����� �����մϴ�.</a>			
				</div>
			</div>
		</div>
		
		<div id="join_box">
			<img alt="" id="join_title" src="image_popup/join_title.png">
			<form id="form_registerMember" action="registerMember.do" method="Post">
				<div class="box-center">
					<table>
						<colgroup>
							<col width="20%">
							<col width="80%">
						</colgroup>
						<tr>
							<th>���̵�</th>
							<td>
								<input type="text" class="input_txt" name="m_id" id="m_id" maxlength="8" />
							</td>
						</tr>
						<tr>
							<th>�г���</th>
							<td><input type="text" class="input_txt" name="m_nick" id="nickname"  maxlength="10" /></td>
						</tr>
						<tr>
							<th>�̸�</th>
							<td><input type="text" class="input_txt" name="m_name" id="m_name"  /></td>
						</tr>
						<tr>
							<th>��й�ȣ</th>
							<td><input type="password" class="input_txt" name="m_pwd" id="m_pwd"  maxlength="12" /></td>					
						</tr>
						<tr>
							<th>��й�ȣ Ȯ��</th>
							<td><input type="password" class="input_txt" name="m_pwdConfirm" id="m_pwdConfirm"  maxlength="12" /></td>
						</tr>
						<tr>
							<th>��ȭ��ȣ</th>
							<td><select id="phone_choice" name="m_phone_1">
									<option value="010">010</option>
									<option value="011">011</option>
									<option value="017">017</option>
									<option value="019">019</option>
								</select> 
								<input type="text" class="number_txt" name="m_phone_2" id="m_phone_2"  size="4" maxlength="4" />
								<input	type="text" class="number_txt" name="m_phone_3" id="m_phone_3"  size="4" maxlength="4" />
								<input type="hidden" class="number_txt" name="m_phone" id="m_phone"><br>
							</td>
						</tr>
						<tr>
							<th>����</th>
							<td>
								<input type="text" name="m_email" id="m_email">
								<input type="button" id="m_mailConfirm" value="�������Ϲ߼�">
								<input type="text" name="reg_confirm" id="reg_confirm" size="6">						
							</td>
						</tr>
					</table>
				</div>
				<div class="box-footer">
					<img alt="" id="join_popup" src="image_popup/join_btn.png">
					<input class="box-btn" id="join_btn"  type="submit" value=""/> 
				</div>
			</form>	
		</div>
	</div>
	
	<div id="list_message" class="popUp hidden"></div>
	<div id="notifier_message" class="popUp hidden">Ȯ������ ���� �޽����� �ֽ��ϴ�!</div>
	
	<div id="find_ID" class="popUp hidden">
		<div id="id_find_box">
		<img alt="" class="find_title_img" src="images/id_find_title.png">
		<form id="form_find_ID" action="find_ID.do" method="POST">
			<input type="text" class="find_input" name="m_name" placeholder="���̵� �Է����ּ���."><br>
			<input type="text" class="find_input" name="m_email" placeholder="�̸����� �Է����ּ���." ><br>
		</form>
			<button id="find_ID_result_button" class="find_btn">
				<img class="login_bottom_button"alt="" src="image_popup/id_find.png">
			</button>
		</div>	
		<button id="find_ID_result_button" >
			<img class="login_bottom_button"alt="" src="image_popup/id_find.png">
		</button>	
	</div>
	
	<div id="find_pwd" class="popUp hidden">
		<div id="pwd_find_box">
		<img alt="" class="find_title_img" src="images/pwd_find_title.png">
		<form id="form_find_pwd" action="find_pwd.do" method="POST">
			<input type="text" class="find_input" name="m_id" placeholder="���̵� �Է����ּ���."><br>
			<input type="text" class="find_input" name="m_name" placeholder="�̸��� �Է����ּ���."><br>
			<input type="text" class="find_input" name="m_email" placeholder="�����ּҸ� �Է����ּ���."><br>
		</form>
		<button id="find_pwd_email" class="find_btn">
			<img class="login_bottom_button"alt="" src="image_popup/password_find.png">
		</button>
		</button>
		</div>
	</div>
	
</body>
</html>