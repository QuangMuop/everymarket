<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<div id="cash_buy_title">
		<img alt="" src="buy_title.png">		
	</div>
	<div id="cash_buy_inner">
		<ul>
			<li>CASH�� ������ü�� �ſ�ī��, �޴������� ���� ���� ���������ϸ� �ٸ� ����ڿ� �ŷ����� ���˴ϴ�.</li>
			<li>CASH ���ó�� EVERYMARKET�Դϴ�.</li>
			<li>���ڱ����ŷ��� �� ���� ���ɿ� ���� ���� ���� "����Ʈ ���� �ѵ� 200���� ����"�� ���Ե˴ϴ�.</li>
			<li>���ڱ��� ����ɿ� ���� ����Ʈ/���ϸ��� �ջ� �ݾ��� 50���� �ʰ��� ��� �Ǹ����� �� ����� �����մϴ�.</li>
		</ul>
		
		<div id="recharge_logic">
					<div class="recharge_box" id="box_first">
						<div class="recharge_box_title">
							<img class="box_img" alt="" src="image_mypage/now_cash.png">
						</div>
						<a>0</a>
					</div>
					<div class="recharge_box">
						<div class="recharge_box_title">
							<img class="box_img"  alt="" src="image_mypage/recharge_cash.png">
						</div>
						<input type="text" id="c_inner_pass_input" class="input_cash" value="0">
					</div>
					<div class="recharge_box">
						<div class="recharge_box_title">
							<img class="box_img"  alt="" src="image_mypage/after_cash.png">
						</div>
						<a>0</a>
					</div>
		</div>
		
		<table class="c_buy_contents">
			<tr>
			 	
				<th class="c_rows">������ �ݾ�</th>
				<td>
				<input type="text" value="0">
				<a>��/�ִ� 200���� ���� ����</a></td>
			</tr>
			
			<tr>
				<th class="c_rows"  id="c_contents_midbar">�������� ����</th>
				<td  id="c_contents_midbar">
					
					<input id="select1" checked="checked" type="radio" value="������" name="way">
					<a>�������Ա�</a>
					<input id="select2"  type="radio" value="������ü" name="way">
					<a>������ü</a>
					<input id="select3"  type="radio" value="�޴���" name="way">
					<a>�޴���</a>
					<input id="select4"  type="radio" value="�ſ�ī��" name="way">
					<a>�ſ�ī��</a>
				</td>
			</tr>
			<tr>
				<th class="c_rows"  id="c_contents_midbar">�������� �Է�</th>
				<td id="c_contents_midbar">
					<p id="select_detail1">
						<a>�Ա��� ��</a>
						<input type="text" value="������" readonly="readonly">
						<a>�Ա� ����</a>
						<select>
							<option>����</option>
							<option>����</option>
							<option>�츮</option>
							<option>����</option>
							<option>�ϳ�</option>
							<option>���</option>
							<option>�λ�</option>
							<option>��ȯ</option>
							<option>����</option>
							<option>����</option>
							<option>�泲</option>
						</select>
					</p>
					<p class="hidden" id="select_detail2">
						<button class="select2_button" id="trensfer">�ǽð� ������ü �ȳ�</button>
						<button class="select2_button" id="bank_time">���ະ �̿밡�� �ð�</button>
					</p>
					<p class="hidden" id="select_detail3">
						<button class="select2_button" id="phone_buy">�޴��� ���� �ȳ�</button>
					</p>
					<p class="hidden" id="select_detail4">
						<button class="select2_button" id="card_buy">�ſ�ī�� ���� �ȳ�</button>
					</p>
				</td>
			</tr>
		</table>
			<button class="c_button" id="c_recharge_finish_button">�����ϱ�</button>
			<button class="c_button" id="c_cencle">���</button>
	</div>
</body>
</html>