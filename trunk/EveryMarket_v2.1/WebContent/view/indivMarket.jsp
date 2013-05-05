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
		<h1>${owner.m_name }님의 가게</h1>
		
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
	
	<!-- 팝업창 : 가게 꾸미기 -->
	<div id="decoBlog" class="popUp hidden">
		<div id="tab_mainImage" class="button_tab">메인이미지</div>
		<div id="tab_thumbNail" class="button_tab">썸네일이미지</div>
		<div id="tab_geoLocation" class="button_tab">구글맵API</div>
		<div id="tab_blogContents" class="button_tab">마켓소개글</div>
	
		<div id="mainImage" class="tab">
			<form action="updateBlog.do" method="post" enctype="multipart/form-data">
				<h4>메인이미지 수정폼</h4>
				<input type="file" name="uploadFile">
				<input type="hidden" name="updateKey" value="b_main">
				<input type="submit" value="변경하기">
			</form>
		</div>
		<div id="thumbNail" class="tab hidden">
			<form action="updateBlog.do" method="post" enctype="multipart/form-data">
				<h4>썸네일이미지 수정폼</h4>
				<input type="file" name="uploadFile">
				<input type="hidden" name="updateKey" value="b_thumb">
				<input type="submit" value="변경하기">
			</form>
		</div>
		<div id="geoLocation" class="tab hidden">
			<h4>구글맵API 적용폼</h4>
			<div id="gMapLocationPicker" class="hidden">
				<form id="submitAddress" onsubmit="showAddress(this.address.value); return false;">
					<input type="text" size="55" name="address" 
						placeholder="이곳에 주로 거래 가능한 장소의 주소명을 입력해주세요!" /> 
					<input type="submit" value="위도와 경도 찾기!" />			
				</form>
				
				<form action="updateBlog.do" method="post">
					위도: <input type="text" id="lat" name="latitude" size="10" readonly="readonly">
					경도: <input type="text" id="lng" name="longitude" size="10" readonly="readonly">		
					<input type="hidden" name="updateKey" value="b_map">
					<input type="submit" value="해당 위도와 경도로 구글맵API를 적용합니다.">
				</form>
				
				<div align="center" id="map" style="width: 600px; height: 400px"></div>
			</div>
			<div id="opener_locationPicker">위도와 경도를 설정하려면 클릭해주세요!</div>
		</div>
		<div id="blogContents" class="tab hidden">
			<form action="updateBlog.do" method="post">
				<h4>마켓소개글 수정폼</h4>
				<textarea rows="5" cols="30" name="b_content"></textarea>
				<input type="hidden" name="updateKey" value="b_content">
				<input type="submit" value="변경하기">
			</form>
		</div>
	</div>
	
	<!-- 팝업창 : 상품등록 -->
	<div id="registerProduct" class="popUp hidden">
		<form action="registerProduct.do" method="post" enctype="multipart/form-data">
			품명:		<input type="text" name="p_name" size="10">				<br>
			가격:		<input type="text" name="p_price" size="10">			<br>
			분류:		<select name="ct_id"></select>							<br>
			상품소개:	<textarea rows="5" cols="30" name="p_detail"></textarea><br>
			상품사진:	<input type="file" name="uploadFile" size="10">				<br>
			<input type="submit" value="상품 등록하기">
		</form> 
	</div>
	
	<!-- 팝업창 : 내 단골리스트 -->
	<div id="dangolList" class="popUp hidden"></div>
	
</center>
</body>
</html>