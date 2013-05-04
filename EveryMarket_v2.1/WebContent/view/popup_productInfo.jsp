<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body>

	<!-- 팝업창 : 상품 상세정보창 -->
	<div id="productInfo" class="popUp hidden">
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
				댓글내용: <input type="text" name="c_content" size="20">
				<input type="hidden" name="p_id" value="">
				<input type="submit" value="작성하기">
			</form>
		</div>
		
		<div id="bar_button_detail"></div>
	</div>
	
	<!-- 팝업창 : 상품 구매신청창 -->
	<div id="productPurchase" class="popUp hidden">
		<div id="productInfo_purchase">
			<div id="productP_img_purchase"></div>
			<div id="productP_name_purchase">
				<span>상품명: </span>
			</div>
			<div id="productP_price_purchase">
				<span>상품가격: </span>
			</div>
		</div>
		
		<form id="ajaxForm_productPurchase" action="purchaseProduct.do" method="post">
			<select name="waitingTime">
				<option value="3">3일</option>
				<option value="5">5일</option>
				<option value="7">7일</option>
				<option value="10">10일</option>
				<option value="14">14일</option>
			</select>
			<input type="hidden" value="" name="p_id">
			<input type="submit" value="구매신청하기">
			<button>창닫기</button>
		</form>
	</div>

	<div>기둥 뒤에 팝업창 있음!</div>

</body>
</html>