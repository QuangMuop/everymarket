<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

</head>
<body>
<div id="card_add">
	<div id="c_a_title">
		<img alt="" id="c_a_head" src="image_mypage/ema_head.png">
		<img alt="" id="c_a_title_img" src="image_mypage/safe_buy_title2.png">
		<a id="c_a_title_font">�������� ��û</a>
	</div>
	<div id="c_a_contents">
		<a class="c_a_title_bold" id="c_line_first"> �ſ�ī�� ����</a>
		<a class="c_a_title_normal">��</a> 
		<a class="c_a_title_bold">�̸��� �ּ�</a>
		<a class="c_a_title_normal">�� ��Ȯ�� �Է��� �ּ���.</a>
		<div>
			<table id="card_info_insert">
				<colgroup>
					<col width="30%">
					<col width="70%">
				</colgroup>
				<tr>
					<th>ī���ȣ</th>
					<td>
						<input type="text" class="card_num">
						-
						<input type="text" class="card_num">
						-
						<input type="password" class="card_num">
						-
						<input type="password" class="card_num">
					</td>
				</tr>
				<tr>
					<th>E-mail</th>
					<td>
						<input type="text" id="email_input">
					</td>
				</tr>
				<tr>
					<th>ī���й�ȣ</th>
					<td>
						<input type="text" id="card_pass2">
						**ī���й�ȣ �� ���ڸ�
					</td>
				</tr>
				<tr>
					<th>CVC</th>
					<td>
						<input type="text" id="card_cvc">
						ī��޸� ���ڸ�
					</td>
				</tr>
				<tr>
					<th>����������й�ȣ</th>
					<td>
						<input type="text" id="card_pass3">
					</td>
				</tr>
				<tr>
					<th>��ȿ�Ⱓ</th>
					<td>
						<select>
							<option>����</option>
							<option>01</option>
							<option>02</option>
							<option>03</option>
							<option>04</option>
							<option>05</option>
							<option>06</option>
							<option>07</option>
							<option>08</option>
							<option>09</option>
							<option>10</option>
							<option>11</option>
							<option>12</option>
						</select>
						(��)
						<select>
							<option>����</option>
							<option>2013</option>
							<option>2014</option>
							<option>2015</option>
							<option>2016</option>
							<option>2017</option>
							<option>2018</option>
							<option>2019</option>
						</select>
						(��)
					</td>
				</tr>
			</table>
		</div>
		<button class="safe_buy_button" id="s_b_confirm">Ȯ��</button>
		<button class="safe_buy_button" id="s_b_cencle">���</button>
	</div>
</div>
</body>
</html>