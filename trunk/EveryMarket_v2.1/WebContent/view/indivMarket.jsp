<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="http://maps.google.com/maps?file=api&amp;v=2&amp;key=ABQIAAAAgrj58PbXr2YriiRDqbnL1RSqrCjdkglBijPNIIYrqkVvD1R4QxRl47Yh2D_0C1l5KXQJGrbkSDvXFA" type="text/javascript"></script>
</head>
<body>
<center>

	<div id="indivMarketWrapper" owner_id="${owner.m_id }">

		<div id="blog_b_main"> <img src="image_blog/${blog.b_main }"> </div>
		<div id="blog_b_thumb"> <img src="image_blog/${blog.b_thumb }"> </div>
		<h1>${owner.m_name }���� ����</h1>
		
		<div id="bar_button_indivMarket"></div>
		
		<div id="homeInfo">
			<div id="blog_b_map"> <img src="${blog.b_map }"> </div>
			<div id="blog_b_content"> ${blog.b_content } </div>
			<div id="blog_b_hit">${blog.b_hit }</div>
			<div id="dangol_count"></div>
			<div id="review_count"></div>
		</div>
		
		<div id="productContainer">	
			<c:forEach var="product" items="${listProduct }">
				<div class="product" productId="${product.p_id }">${product.p_name }</div>	<br>
			</c:forEach>
		</div>
	
	</div>
	
	<!-- �˾�â : ���� �ٹ̱� -->
	<div id="decoBlog" class="popUp hidden">
		<div id="tab_mainImage" class="button_tab">�����̹���</div>
		<div id="tab_thumbNail" class="button_tab">������̹���</div>
		<div id="tab_geoLocation" class="button_tab">���۸�API</div>
		<div id="tab_blogContents" class="button_tab">���ϼҰ���</div>
	
		<div id="mainImage" class="tab">
			<form action="updateBlog.do" method="post" enctype="multipart/form-data">
				<h4>�����̹��� ������</h4>
				<input type="file" name="uploadFile">
				<input type="hidden" name="updateKey" value="b_main">
				<input type="submit" value="�����ϱ�">
			</form>
		</div>
		<div id="thumbNail" class="tab hidden">
			<form action="updateBlog.do" method="post" enctype="multipart/form-data">
				<h4>������̹��� ������</h4>
				<input type="file" name="uploadFile">
				<input type="hidden" name="updateKey" value="b_thumb">
				<input type="submit" value="�����ϱ�">
			</form>
		</div>
		<div id="geoLocation" class="tab hidden">
			<h4>���۸�API ������</h4>
			<div id="gMapLocationPicker" class="hidden">
				<form id="submitAddress" onsubmit="showAddress(this.address.value); return false;">
					<input type="text" size="55" name="address" 
						placeholder="�̰��� �ַ� �ŷ� ������ ����� �ּҸ��� �Է����ּ���!" /> 
					<input type="submit" value="������ �浵 ã��!" />			
				</form>
				
				<form action="updateBlog.do" method="post">
					����: <input type="text" id="lat" name="latitude" size="10" readonly="readonly">
					�浵: <input type="text" id="lng" name="longitude" size="10" readonly="readonly">		
					<input type="hidden" name="updateKey" value="b_map">
					<input type="submit" value="�ش� ������ �浵�� ���۸�API�� �����մϴ�.">
				</form>
				
				<div align="center" id="map" style="width: 600px; height: 400px"></div>
			</div>
			<div id="opener_locationPicker">������ �浵�� �����Ϸ��� Ŭ�����ּ���!</div>
		</div>
		<div id="blogContents" class="tab hidden">
			<form action="updateBlog.do" method="post">
				<h4>���ϼҰ��� ������</h4>
				<textarea rows="5" cols="30" name="b_content"></textarea>
				<input type="hidden" name="updateKey" value="b_content">
				<input type="submit" value="�����ϱ�">
			</form>
		</div>
	</div>
	
	<!-- �˾�â : ��ǰ��� -->
	<div id="registerProduct" class="popUp hidden">
		<form action="registerProduct.do" method="post" enctype="multipart/form-data">
			ǰ��:		<input type="text" name="p_name" size="10">				<br>
			����:		<input type="text" name="p_price" size="10">			<br>
			�з�:		<select name="ct_id"></select>							<br>
			��ǰ�Ұ�:	<textarea rows="5" cols="30" name="p_detail"></textarea><br>
			��ǰ����:	<input type="file" name="uploadFile" size="10">				<br>
			<input type="submit" value="��ǰ ����ϱ�">
		</form> 
	</div>
	
	<!-- �˾�â : �� �ܰ񸮽�Ʈ -->
	<div id="dangolList" class="popUp hidden"></div>
	
</center>
</body>
</html>