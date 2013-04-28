<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body>
<center>
	<!-- <div> ���� �����̹��� </div> -->
	<h1>${member.m_name }���� ����</h1>
	<div>
		<div class="button">���� �ٹ̱�</div>
		<div class="button">��ǰ ���</div>
		<div class="button">�� �ܰ� �����</div>
	</div>
	<div id="productContainer">	
		<c:forEach var="product" items="${listProduct }">
			<div class="product" productId="${product.p_id }">${product.p_name }</div>	<br>
		</c:forEach>
	</div>
	
	<div class="button">���ΰ���</div>
	
	<!-- �˾�â : ��ǰ���â -->
	<div id="registerProduct" class="hidden">
		<form action="registerProduct.do" method="post" enctype="multipart/form-data">
			ǰ��:		<input type="text" name="p_name" size="10">				<br>
			����:		<input type="text" name="p_price" size="10">			<br>
			�з�:		<select name="ct_id"></select>							<br>
			��ǰ�Ұ�:	<textarea rows="5" cols="30" name="p_detail"></textarea><br>
			��ǰ����:	<input type="file" name="uploadFile" size="10">				<br>
			<input type="submit" value="��ǰ ����ϱ�">
		</form> 
	</div>
	
	<!-- �˾�â : ��ǰ����â -->
	<div id="productInfo" class="hidden">
		<div id="homeInfo">
			<div id="blogB_map"></div>
			<div id="blogB_content"></div>
			<div id="randomProducts"></div>
		</div>
	
		<div id="productP_img"></div>
		<div id="productP_name"></div>
		<div id="productP_price"></div>
		<div id="listJjimer"></div>
		<div id="productP_detail"></div>
		<div id="productP_date"></div>
			<div id="productComments">
			
				<form id="ajaxForm_registerComments" action="registerComments.do" method="post">
					����ۼ�: <input type="text" name="c_content" size="20">
					<input type="hidden" name="p_id" value="">
					<input type="submit" value="�ۼ��ϱ�">
				</form>
			</div>
		
		<div id="bar_button_detail">
			<div class="button_detail">���ϱ�</div>
			<div class="button_detail">���Ž�û�ϱ�</div>
			<div class="button_detail">��ǰ�����ϱ�</div>
			<div class="button_detail">â�ݱ�</div>
		</div>
	</div>
	
</center>
</body>
</html>