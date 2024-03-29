<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body>
<center>
	<!-- <div> 마켓 메인이미지 </div> -->
	<h1>${owner.m_name }님의 가게</h1>
	<div>
		<div class="button">가게 꾸미기</div>
		<div class="button">상품 등록</div>
		<div class="button">내 단골 놀러가기</div>
	</div>
	<div id="productContainer">	
		<c:forEach var="product" items="${listProduct }">
			<div class="product" productId="${product.p_id }">${product.p_name }</div>	<br>
		</c:forEach>
	</div>
	
	<div class="button">메인가기</div>
	
	<!-- 팝업창 : 상품등록창 -->
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
	
</center>
</body>
</html>