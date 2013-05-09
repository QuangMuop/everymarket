<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="./styles/board_qna.css" rel="stylesheet" type="text/css"/>
</head>
<body>

	<span class="button_tab">(ȸ������ �Ѱ�)</span>
	<span class="button_tab">(�ϹݽŰ� ������Ȳ)</span>
	<span class="button_tab">(�ŷ��Ű� ������Ȳ)</span>
	<span class="button_tab">(��ġ�Ϸ�� �Ű���Ȳ)</span>
	
	<div id="memberList" class="tabContent">
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
	
	<div id="uncheckedList_report" class="tabContent hidden">
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
	
	<div id="uncheckedList_tradeReport" class="tabContent hidden">
	
	</div>
	
	<div id="checkedList_report" class="tabContent hidden">
		<div id="checkedReportList" class="list">
			<div id="checkedReportList_head">
				<div class="normal">�Ϸù�ȣ</div>
				<div class="wide">��������</div>
				<div class="normal">������ ���̵�</div>
				<div class="wide">���系��</div>
			</div>	
		</div>
	</div>
	
</body>
</html>