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

	<div>기둥 뒤에 팝업창 있음!</div>

</body>
</html>