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
	
	<!-- 팝업창: 상품 신고창 -->
	<div id="productReport" class="popUp hidden">
		<div id="productInfo_report">
			<div id="productP_name_report">
				<span>상품명: </span>
			</div>
			<div id="productP_detail_purchase">
				<span>상품소개: </span>
			</div>
		</div>
		
		<div id="notice_report">
			<h4>신고시 꼭 확인해주세요!</h4>
			<ul>
				<li>해당 상품을 신고할 경우 관리자가 사실여부 판단 뒤 조치를 취합니다.</li>			
				<li>신고사유가 적절하지 않을 경우 해당 신고는 기각될 수 있습니다.</li>			
				<li>무의미한 신고행위의 반복은 신고자의 제재사유가 될 수 있습니다.</li>			
			</ul>		
		</div>
		
		<div id="buttonBar_report">
			<form id="form_reportProduct" action="reportProduct.do" method="post">
				<input type="hidden" name="rep_productId">
				신고사유: 	<select name="rep_reason">	
							<option value="부적절한 상품">부적절한 상품</option>
							<option value="음란물">음란물</option>
							<option value="사행성 조장">사행성 조장</option>
						</select><br>
				신고내용:	<br>
				<textarea rows="5" cols="50" name="rep_content"></textarea>
				<input type="submit" value="신고하기">
				<button>취소하기</button>
			</form>
		</div>
	</div>

	<div>기둥 뒤에 팝업창 있음!</div>

</body>
</html>