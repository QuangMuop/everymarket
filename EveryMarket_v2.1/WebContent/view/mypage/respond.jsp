<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

</head>
<body>
<div id="cash_respond">
	<div id="r_title">
		<img alt="" src="image_mypage/respond_title.png">
	</div>
	<ul id="r_alert">
		<li>cash���� �� �ּұݾ��� 1ȸ 1000�� �̸� �ִ�ݾ��� 1�� 200�����Դϴ�.</li>
		<li>cash���� �� ���� ���¸� �Է��ؾ��ϸ�, ȸ�� ���� ������ ���·θ� �����Ͻ� �� �ֽ��ϴ�.</li>
		<li>���� ��û�� �Ͻø� �����û�� ������ EVERYMARKET���� ������ �� ��, �����û�� ���� 2�� �Ŀ� �Աݵ˴ϴ�.</li>
	</ul>
	<div id="r_insert">
		<table id="r_insert_table">
			<colgroup>
				<col width="30%">
				<col width="70%">
			</colgroup>
			<tr>
				<th>ȯ�� �ݾ��Է�</th>
				<td>
					<input type="text" id="respond_input">
					��
				</td>
			</tr>
			<tr>
				<th>ȯ�� �����Է�</th>
				<td id="r_line">ȯ�޹ް��� �ϴ� ���¸� �Է����ּ���.
					<div>
					<table id="r_inner_table">
						<colgroup>
							<col width="20%">
							<col width="50%">
							<col width="30%">
						</colgroup>
						<tr>
							<th>����</th>
							<th>���¹�ȣ</th>
							<th>������</th>
						</tr>
						<tr>
							<td>
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
							</td>
							<td>
								<input type="text" id="respond_num" value="'-'���� ���ڷθ� �Է����ּ���">
								
							</td>
							<td>
								<input type="text" id="respond_name" value="������">
							</td>
						</tr>
						
					</table>
					</div>
				</td>
				
			</tr>
		</table>
	</div>
	<div id="r_request">
		<img alt="" id="r_requset_button" src="image_mypage/respond_request.png">
	</div>
</div>
</body>
</html>