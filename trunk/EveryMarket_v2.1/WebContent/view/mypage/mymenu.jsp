<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body>
<div id="mypage_body">
	<div id="side_bar">
		<div id="b_bottomline">
		<img alt="" src="image_mypage/mymarket.png">
		</div>
		<div id="my_inf">
				<a id="m_nickname">�̽���</a>
				<a id="m_nickplus">���� �������</a>
				<div id="m_class">
					<div>
						<img alt="" id="c_img" src="image_mypage/vip.png">
						<button id="go_service">��� ���� ����</button>
					</div>
				</div>
		</div>
		<div id="out_menu">
			<ul id="m_menu_bar">
				<li id="menu1">ȸ������ ��ȸ/����</li>
				<li id="menu2">cash ����/ȯ��</li>
				<li id="menu3">�Ű�/��� ����</li>
			</ul>
		</div>
	</div>
<!-- 	////////////////////////// -->
<div id="contents">
	<div class="out_hidden" id="contents1">
		<div id="c_top">
			<img alt="" id="c_inner_img" src="image_mypage/statuschange.png">
			<a class="c_font">|</a>
			<a class="c_font">������ ȸ�������� �����Ͻ� �� �ֽ��ϴ�. ȸ�������� �����Ͻð� �ݵ�� �ϴܿ� �ִ� Ȯ�� ��ư�� Ŭ���� �ּž� �մϴ�.</a>
		</div>
		<div id="c_inner1">
			<img alt="" id="c_repass" src="image_mypage/repassword.png">
			<div id="c_inner_block">
				<div class="c_inner_input">
					<img alt="" class="repass_img" id ="repass_id" src="image_mypage/id.png">
					<a>${member.m_id}</a>
				</div>
				<div class="c_inner_input">
					<img alt="" class="repass_img" src="image_mypage/password.png">
					<input id="c_inner_pass_input1" type="password">
					ȸ������ ������ �����ϰ� ��ȣ�ϱ� ���� ��й�ȣ�� �ٽ� �ѹ� Ȯ�� �մϴ�.
				</div>
			</div>
				<button class="c_button" id="c_ok1" pass="${member.m_pwd}">Ȯ��</button>
				<button class="c_button" id="c_cencle1">���</button>
		</div>
		<div id="re_member"  class="c_inner_hidden">
			<img alt="" id="c_remember" src="image_mypage/c_title.png">
			<table id="c_table">
			
				<tr>
					<th class="row">
						<p>�̸�</p>
					</th>
					<td>
						${member.m_name}
					</td>
				</tr>
				<tr>
					<th class="row">
						<p>���̵�</p>
					</th>
					<td>
						${member.m_id }
					</td>
				</tr>
				<tr>
					<th class="row">
						<p>�ٲܺ�й�ȣ</p>
					</th>
					<td>
						<input id="re_password" class="c_input" type="password">
					</td>
				</tr>
				<tr>
					<th class="row">
						<p>�ٲܺ�й�ȣ��Ȯ��</p>
					</th>
					<td>
						<input id="re_password" class="c_input" type="password">
					</td>
				</tr>
				<tr>
					<th class="row">
						<p>�̸����ּ�</p>
					</th>
					<td>
						<input id="re_email_first" class="c_input" type="text" value="�̸���">
						@
						<input id="re_email_second" class="c_input" type="text" value="�̸���">
					</td>
				</tr>
				<tr>
					<th class="row">
						<p>�޴��� ��ȣ</p>
					</th>
					<td>
						<select id="select_phone">
							<option>010</option>
							<option>011</option>
							<option>017</option>
						</select>
						<input id="re_phone_first" class="c_input" type="text" value="�չ�ȣ">
						<input id="re_phone_second" class="c_input" type="text" value="�޹�ȣ">
					</td>
				</tr>
			</table>
				<button class="c_button" id="c_ok_update">Ȯ��</button>
				<button class="c_button" id="c_cencle">���</button>
		</div>
	</div>
<!-- 		////////////////////// -->
	<div class="out_hidden" id="contents2">
		<div id="c_top">
			<img alt="" id="c_inner_img" src="image_mypage/cash_title.png">
			<a class="c_font">|</a>
			<a class="c_font">������ ����Ʈ�� �����̳� ȯ���Ͻ� �� �ֽ��ϴ�.</a>
		</div>
		<div id="c_inner2">
			<img alt="" id="c_repass" src="image_mypage/repassword.png">
			<div id="c_inner_block">
				<div class="c_inner_input">
					<img alt="" class="repass_img" id ="repass_id" src="image_mypage/id.png">
					<a>${member.m_id}</a>
				</div>
				<div class="c_inner_input">
					<img alt="" class="repass_img" src="image_mypage/password.png">
					<input id="c_inner_pass_input2" type="password">
					ȸ������ ������ �����ϰ� ��ȣ�ϱ� ���� ��й�ȣ�� �ٽ� �ѹ� Ȯ�� �մϴ�.
				</div>
			</div>
				<button class="c_button" id="c_ok2" pass="${member.m_pwd}">Ȯ��</button>
				<button class="c_button" id="c_cencle2">���</button>
		</div>
		<div id="m_cash_detail"  class="c_inner_hidden">
			<img alt="" id="c_remember" src="image_mypage/cash.png">
			<div id="m_cash_view">
				<ul>
					<li>CASH�� ������ü�� �ſ�ī��, �޴������� ���� ���� ���������ϸ� �ٸ� ����ڿ� �ŷ����� ���˴ϴ�.</li>
					<li>CASH ���ó�� EVERYMARKET�Դϴ�.</li>
					<li>���ڱ����ŷ��� �� ���� ���ɿ� ���� ���� ���� "����Ʈ ���� �ѵ� 200���� ����"�� ���Ե˴ϴ�.</li>
					<li>���ڱ��� ����ɿ� ���� ����Ʈ/���ϸ��� �ջ� �ݾ��� 50���� �ʰ��� ��� �Ǹ����� �� ����� �����մϴ�.</li>
				</ul>
				<div id="my_cash">
					<div>
						<a>���� CASH����</a>
						<a id="my_cash_view">${member.m_cash }</a>
						<a>�Դϴ�.</a>
					</div> 
				</div>
			</div>
			
			<img alt="" id="c_remember" src="cash_recharge.png">
			<div id="m_cash_view" class="cash_recharge">
				<ul>
					<li>ĳ�� ������ �ǽð� ������ü, �������Ա�, �޴���, �ſ�ī�� ������ �����մϴ�.</li>
					<li>�������Ա����� ���� �� �Ա� ������ 5�����Ϸ� �Աݱ����� �������Ա��� ���� ���� ��� �ڵ� ��ҵ˴ϴ�.</li>
					<li>ĳ�� 1ȸ �ּ� ���� �ݾ��� 1000���̸�, �ִ� ���� �ݾ��� 200�������� �ѵ��� �����մϴ�.</li>
					<li>���� ��û �� �Ա� ������ ��Ұ� �����ϸ�, �Ա� �Ŀ��� �����ϱ⸦ ���� �������� �����Ͻ� �� �ֽ��ϴ�.</li>
					<li>Ÿ������ �Ա� �� ������� ���δ��Դϴ�.	</li>
				</ul>
				
				<button class="c_button" id="c_recharge_button">�����ϱ�</button>
				<button class="c_button" id="c_cencle">���</button>
			</div>
			
			<img alt="" id="c_remember" src="cash_repond.png">
			<div id="m_cash_view">
				<ul>
					<li>CASH�� ������ü�� �ſ�ī��, �޴������� ���� ���� ���������ϸ� �ٸ� ����ڿ� �ŷ����� ���˴ϴ�.</li>
					<li>CASH ���ó�� EVERYMARKET�Դϴ�.</li>
					<li>���ڱ����ŷ��� �� ���� ���ɿ� ���� ���� ���� "����Ʈ ���� �ѵ� 200���� ����"�� ���Ե˴ϴ�.</li>
					<li>���ڱ��� ����ɿ� ���� ����Ʈ/���ϸ��� �ջ� �ݾ��� 50���� �ʰ��� ��� �Ǹ����� �� ����� �����մϴ�.</li>
				</ul>
				<div id="my_cash">
					<div>
						<a>���� CASH����</a>
						<a id="my_cash_view">${member.m_cash }</a>
						<a>�Դϴ�.</a>
					</div> 
				</div>
			</div>
				<button class="c_button" id="c_respond_button">ȯ���ϱ�</button>
				<button class="c_button" id="c_cencle">���</button>
		</div>
	</div>	
</div>
</div>
</body>
</html>