<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="./styles/board_qna.css" rel="stylesheet" type="text/css"/>
</head>
<body>

	<span class="tab">(ȸ������ �Ѱ�)</span>
	<span class="tab">(�ϹݽŰ� ������Ȳ)</span>
	
	<div id="memberList">
		<table border="1">
			<tr>
				<th>���̵�</th>
				<th>��й�ȣ</th>
				<th>�г���</th>
				<th>�̸�</th>
				<th>����ó</th>
				<th>E_Money</th>
				<th>�����Ű�Ƚ��</th>
				<th>ȸ������</th>
			</tr>
		</table>
		
		<button id="callMemberList">ȸ����� ȣ��</button>
	</div>
	
	<div id="board_report" class="hidden">
		<div id="reportedProductList" class="list">
			<div id="reportedProductList_head">
				<div class="normal">�Ű����</div>
				<div class="normal">�Ű��� ���̵�</div>
				<div class="wide">�Ű�����</div>
				<div class="normal">�Ű��� ��ǰ</div>
			</div>
		</div>
		<div id="reportedMemberList" class="list">
			<div id="reportedMemberList_head">
				<div class="normal">�Ű����</div>
				<div class="normal">�Ű��� ���̵�</div>
				<div class="wide">�Ű�����</div>
				<div class="normal">�Ű��� ȸ��</div>
			</div>
		</div>
	</div>
	
</body>
</html>