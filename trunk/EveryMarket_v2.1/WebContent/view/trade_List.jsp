<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">

<title>Insert title here</title>
<style type="text/css">
table {
	border: 1px solid;
	width: 600px;
}

table td,th {
	border: 1px solid;
}
</style>
</head>
<body>


	<table id="buying">
		<tr>
			<th>�ֹ���ȣ</th>
			<th>��ǰ��</th>
			<th>�� �����ݾ�</th>
			<th>�������</th>
		</tr>

		<c:forEach var="bl" items="${buyingList}">
			<tr>
				<td>${bl.t_del_number}</td>
				<td>${bl.p_name }</td>
				<td>${bl.p_price }</td>
				<td>${bl.t_status }</td>
			</tr>
		</c:forEach>
	</table>

	<table id="selling">
		<tr>
			<th>�ֹ���ȣ</th>
			<th>��ǰ��</th>
			<th>�� �����ݾ�</th>
			<th colspan="2">�������</th>
		</tr>

		<c:forEach var="sl" items="${sellingList}">
			<tr>
				<td>${sl.t_del_number}</td>
				<td>${sl.p_name}</td>
				<td>${sl.p_price}</td>


				<td><c:choose>

						<c:when test="${sl.t_status > 1}">
							<td>${sl.t_status}</td>
						</c:when>

						<c:when test="${sl.t_status < 2 }">
							<form>
								�����ȣ�Է�: <input type="text">
							<td><input id="dn_bt" type="submit" value="Ȯ��"></td>

							</form>
						</c:when>

					</c:choose></td>

			</tr>
		</c:forEach>
	</table>





</body>
</html>