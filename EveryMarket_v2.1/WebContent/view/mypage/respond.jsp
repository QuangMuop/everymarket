<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script src="jquery-1.9.1.min.js" type="text/javascript"></script>
<title>Insert title here</title>
<style type="text/css">
body{
margin: 0px;
background-image: url(../../image_mypage/ema2.png);
}
#r_title{
background-color: #dc2342;
height: 45px;
}
#r_alert{
margin:15px;
font-size: 11px;
color:#666666;
padding-left: 15px;
}
#r_alert li{
margin-bottom: 10px;
}
#r_insert_table{
border-top: 2px solid #454545;
margin: 15px;
width:650px;
border-spacing: 0px;
border-bottom: 1px solid #cccccc;
}
#r_insert_table tr{
height: 35px;
}
#r_insert_table th{
background-color: #f8f8f8;
text-align: left;
color:#4d4d4d;
font-size: 12px;
padding-left: 10px;
border-bottom: 1px solid #ececec;
}

#r_insert_table td{
padding-left:10px;
font-size:12px;
border-bottom: 1px solid #ececec;
}
#r_inner_table{
border-spacing: 0px;
border-top: 1px solid #58cbba;
margin-left: 10px;
}
#r_inner_table th{
text-align: center;
bo
}
#r_inner_table tr{
height: 25px;
text-align: center;
}
#r_inner_table td{
color:#808080;
font-size: 11px;
}
#respond_num{
border: 1px solid #e5e5e5;
font-size: 11px;
width:180px;
}
#r_line{
color:#4d4d4d;
}
#respond_name{
border: 1px solid #e5e5e5;
font-size: 11px;
width:100px;
}
#r_request{
border: 1px solid #f30e09;
color:#f30e09;
font-size: 12px;
background-color: #ffece5;
height: 30px;
width:80px;
border-radius:2px;
margin-left: 300px;
cursor: pointer;
}
#r_requset_button{
height: 17px;
margin: 8px;

}
</style>
<script type="text/javascript">
$(document).ready(function(){
	$("#r_request").click(function(){
		alert("ȯ�޽�û�� �Ϸ�Ǿ����ϴ�^^ ������ ���� �� ȯ�޵ǰڽ��ϴ�.");
	});
});
</script>
</head>
<body>
<div id="cash_respond">
	<div id="r_title">
		<img alt="" src="../../image_mypage/respond_title.png">
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
		<img alt="" id="r_requset_button" src="../../image_mypage/respond_request.png">
	</div>
</div>
</body>
</html>