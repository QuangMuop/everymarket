<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<div id="t_contents">
		<div id="t_title_img">
			<img alt="" src="image_mypage/trensfer_1_1.png">
		</div>
		<div>
			<img alt="" id="trensfer_name" src="image_mypage/trensfer_name.png">
		</div>
		<div id="t_contents_inner">
			<table id="trensfer_table1">
				<colgroup>
					<col width="30%">
					<col width="40%">
					<col width="30%">
				</colgroup>
				<tr>
					<th>�̿�����</th>
					<td>
					<input type="text" class="t_input" value="EVERYMARKET(��)">
					</td>
					<td><button class="t_button">����ѵ�Ȯ��</button></td>
				</tr>
				<tr>
					<th>��  ��</th>
					<td>
					<input type="text" class="t_input" value="10000��">
					</td>
					<td><button class="t_button">�������Ȯ��</button></td>
				</tr>
			</table>
			<table id="trensfer_table2">
				<colgroup>
					<col width="25%">
					<col width="75%">
				</colgroup>
				<tr>
					<th>����</th>
					<td>
						<select class="t_table2_input" id="t_table2_select">
							<option>����  00:00 ~ 24:00</option>
							<option>����  00:00 ~ 24:00</option>
							<option>�츮  00:15 ~ 23:50</option>
							<option>����  00:00 ~ 24:00</option>
							<option>�ϳ�  00:15 ~ 23:50</option>
							<option>���  00:00 ~ 24:00</option>
							<option>�λ�  00:10 ~ 23:50</option>
							<option>��ȯ  00:15 ~ 23:50</option>
							<option>����  00:10 ~ 23:50</option>
							<option>����  00:15 ~ 23:50</option>
							<option>�泲  00:10 ~ 23:50</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>���¹�ȣ</th>
					<td>
						<input type="text"  class="t_table2_input">
						<a>('-' ����)</a>
						<img alt="" src="key.png">
					</td>
				</tr>
				<tr>
					<th>��й�ȣ</th>
					<td>
						<input type="password" id="t_table_pass" class="t_table2_input">
						<img alt="" src="image_mypage/key.png">
					</td>
				</tr>
				<tr>
					<th>�ֹι�ȣ</th>
					<td>
						<input type="text" class="t_table2_input">
						<a>('-' ����)</a>
						<img alt="" src="image_mypage/key.png">
					</td>
				</tr>
			</table>
			<a id="t2_alert">(���ΰ����� ��� ����ڵ�Ϲ�ȣ�Է�)</a>
		</div>
		<div id="t_bottom">
			<a id="t2_alert" class="t_bottom_a">�Է��Ͻ� ���������� ��ȣȭ�Ǿ� ����������� ���� �����˴ϴ�.</a>
			<div id="t2_inner_line">
				<input type="checkbox">
				<a id="t_email">E-mail ����</a>
				<input type="text"  class="t_table2_input" id="t_bottom_email">
			</div>
			<a class="t_bottom_last">(�Է��Ͻ� E-mail �ּҷ� Ȯ�� ������ �����帳�ϴ�.)</a>
			<div>
				<div id="t_bottom_text">
					<a class="t_text_title">[�����ĺ����� ���� �� �̿� ����]</a> 
						<ul class="t_text_list">
							<li><a class="bold">�����׸�</a><a class="normal"> : �ֹι�ȣ</a></li>
							<li><a class="bold">��������</a><a class="normal"> : ����Ȯ�� �� �ŷ����� ��ȸ</a></li>
							<li><a class="bold">�̿�Ⱓ</a><a class="normal"> : �̿���� �޼� �� ��ü���� �ı� </a></li>
						</ul>
						<a class="normal">�����ĺ����� ������ �����Ͻô� ��� </a><a class="bold">������ư</a><a class="normal">��, �������� �ʴ� ��� </a><a class="bold">��ҹ�ư</a><a class="normal">�� �����ֽñ� �ٶ��ϴ�.</a>
					<a class="t_text_title">[OTP/����ī�� ���� �ȳ�]</a>
						<ul class="t_text_list">
							<li><a class="bold">����</a> 
					   			<a class="normal">���/����/����/����/�뱸/�λ�/���/����/����/�츮/����/�ϳ�/SC����</a>
							</li>
							<li><a class="bold">����</a>  
					   			<a class="normal">���/����/����/�̷�����/�ſ�/���ѱ�������/�ϳ�����/��������/�ѱ�����/��ȭ/����/HMC����/SK����</a>
							</li>
							<li><a class="bold">��Ÿ</a> 
					   			<a class="normal">�긲����/�������ݰ�/����/��ü��</a>
							</li>
						</ul>
					   <a class="t_text_bottom_line">�����´� OTP/����ī�� Ȯ�� �ܰ谡 �߰��� �� �ֽ��ϴ�.</a> 
					   <a class="t_text_bottom_line">����ġ�� �ش�ȭ�ϴ� ���ް�����Ʈ�� </a><a class="normal">����������</a>
				</div>
				<div id="t_bottom_buttons">
					<button class="t_bottom_button" id="t_bottom_button_first">��������ó�� ��ħ</button>
					<button class="t_bottom_button">���</button>
					<button class="t_bottom_button">����</button>
				</div>
				<a class="normal" id="last_line">�������ù���:���������� ������ 1577-5500(�����ȣ/:61)</a>
			</div>
		</div>
	</div>
</body>
</html>