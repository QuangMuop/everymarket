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
		<div id="blog_b_main">
			<img id="b_m_image" src="image_blog/${blog.b_main }">
			<div id="blog_b_main_side">
				<div id="bar_button_indivMarket_left"></div>
				<div id="bar_button_indivMarket_right"></div>
			</div>
		</div>
		<div id="blog_b_thumb">
			<div id="b_f_line">
				<div id="b_thumb_wrapper">
					<img id="b_thumb" src="image_blog/${blog.b_thumb }">
				</div>
				<a class="blog_m_name">${owner.m_name }</a>
				
				<a id="blog_b_hit">�� ���Կ� �湮�� ��� : ${blog.b_hit }</a>
			</div>
			<div id="b_s_line">
				<p>���ԼҰ�</p>
				<a id="blog_b_content"> ${blog.b_content } </a>
			</div>
			<div id="blog_b_map" class="b_s_line_box">
					<img src="${blog.b_map }">
			</div>
			<div class="b_s_line_box">
				<div id="count_dangol">
					<a>${count_dangol }</a>
					<img alt="" id="all_f" src="image_blog_source/all_friends.png">
				</div>
			</div>
			<div class="b_s_line_box">
				<div id="count_review">
					<a>${count_review }</a>
					<img alt="" id="review_count" src="image_blog_source/editprofile.png">
				</div>
			</div>
			<div id="b_t_line">
				<a id="b_t_line_first">����</a>
				<a id="b_t_line_center">�ܰ�մ�</a>
				<a>���� ��ġ</a>
			</div>
		</div>
				
				
	
		<div id="productContainer">	
			<c:forEach var="product" items="${listProduct }">
				<div class="product" p_id="${product.p_id }">
<%-- 					${product.p_name } --%>
					<img alt="" class="p_img" src="image_product/${product.p_img }">
				</div>	<br>
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
				<img src="C:\Users\kosta.Kitchu\Downloads\wallPaper.png">
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
		<h4>���ο� ��ǰ �����</h4>
		<form action="registerProduct.do" method="post" enctype="multipart/form-data">
			ǰ��:		<input type="text" name="p_name" size="10">					<br>
			����:		<input type="text" name="p_price" size="10">				<br>
			�з�:		<select name="ct_id"></select>								<br>
			��ǰ�Ұ�:	<textarea rows="5" cols="30" name="p_detail"></textarea>	<br>
			��ǰ����:	<input type="file" name="uploadFile" size="10">				<br>
			<input type="submit" value="��ǰ ����ϱ�">
		</form> 
	</div>
	
	<div id="modifyProduct" class="popUp hidden">
		<h4>���ο� ��ǰ �����</h4>
		<p>�ŷ��� ������ ���� ��ǰ�Խñ��� ������ ���������ؿ� ^^</p>
		<form action="modifyProduct.do" method="post">
			��ǰ�Ұ�:	<textarea rows="5" cols="30" name="p_detail"></textarea>	<br>
			<input type="hidden" name="p_id" value=""> 
			<input type="submit" value="��ǰ �����ϱ�">
		</form>
	</div>
	
	<!-- �˾�â : �ܰ񸮽�Ʈ -->
	<div id="dangolList" class="popUp hidden"></div>
	
	<!-- �˾�â : �����ı⸮��Ʈ -->
	<div id="review" class="popUp hidden">
		<div id="scoreRating">
			<p>����: <span class="data"></span></p>
			<p>�� ���ο�: <span class="data"></span></p>
		</div>
		<div id="reviewList"></div>
	</div>
	
</center>
</body>
</html>