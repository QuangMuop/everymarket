<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body>

	<!-- 팝업창 : 상품 상세정보창 -->
	<div id="productInfo" class="popUp hidden">
		<div id="market_info_box">
			<div id="homeInfo">
				<div id="blogB_map"></div>
				<a>가게 위치</a>
				<div id="blogB_content">
				</div>
				<a>판매자의 다른 상품</a>
				<div id="randomProducts"></div>
			</div>
			<div id="p_detail">
				<div id="productP_img"></div>
				<div id="p_detail_top">	
					<div id="p_detail_top_name">
					<p id="productP_name"></p>
					등록일 :
					<a id="productP_date"></a>
					</div>
					<div id="bar_button_detail"></div>
					<div id="p_price_img">
					<a id="productP_price"></a>
					<img class="coin" alt="" src="images/smarket/coin.png">
					</div>
					<div id="productP_detail"></div>
					<div id="jjim_box">
						<div id="listJjimer">
							<a>찜했어요! : </a>
						</div>
					</div>
				</div>
				<div id="productComments">
					<form id="ajaxForm_registerComments" action="registerComments.do" method="post">
						<input type="text" id="p_comment_input" name="c_content" size="20" placeholder="덧글을 남겨주세요!">
						<input type="hidden" name="p_id" value="">
						<input type="submit" id="p_comment_submit" value="작성하기">
					</form>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 팝업창 : 상품 구매신청창 -->
	<div id="productPurchase" class="popUp hidden">
		<div id="productInfo_purchase">
			<div id="productP_name_purchase">
				<span></span>
			</div>
			<div id="productP_img_purchase"></div>
			<form id="ajaxForm_productPurchase" action="purchaseProduct.do" method="post">
			<table>
				<colgroup>
					<col width="40%">
					<col width="60%">
				</colgroup>
				<tr>
					<th>판매가</th>
					<td>
						<div id="productP_price_purchase">
						<span></span>
						<img class="coin" alt="" src="images/smarket/coin.png">
						</div>
					</td>
				</tr>
				<tr>
					<th>구매대기기간</th>
					<td>
						<select name="waitingTime" id="w_select">
							<option value="3">3일</option>
							<option value="5">5일</option>
							<option value="7">7일</option>
							<option value="10">10일</option>
							<option value="14">14일</option>
						</select>
					</td>
				</tr>
			</table>	
					
			<input type="hidden" value="" name="p_id">
			<input type="submit" id="buy_submit" value="구매신청하기">
			<button id="buy_close">창닫기</button>
			
			</form>
		</div>
	</div>
	
	<!-- 팝업창: 회원 신고창 -->
	<div id="memberReport" class="popUp hidden">
		<div id="p_r_content">
		<img alt="" id="main_report_title" src="image_trade/report_title_img.png">
		<div id="memberInfo_report">
			<span id="memberM_nick_report"></span>
				(<span id="memberM_id_report"></span>)
				님을 다음의 사유로 신고하려고 합니다.
		</div>		
		
		<div class="notice_report">
			<p>신고시 꼭 확인해주세요!</p>
			<ul>
				<li>해당 회원을 신고할 경우 관리자가 사실여부 판단 뒤 조치를 취합니다.</li>			
				<li>신고사유가 적절하지 않을 경우 해당 신고는 기각될 수 있습니다.</li>			
				<li>무의미한 신고행위의 반복은 신고자의 제재사유가 될 수 있습니다.</li>			
			</ul>		
		</div>
		
		<div id="buttonBar_reportMember">
			<form id="form_reportMember" action="reportMember.do" method="post">
				<input type="hidden" name="rep_memberId">
				<div id="r_reason_box">
					신고사유: 
					<select name="rep_reason">	
						<option value="광고성 글 게시">광고성 글 게시</option>
						<option value="무의미한 도배">무의미한 도배</option>
						<option value="거래사기">거래사기</option>
					</select><br>
				</div>
				
				<textarea rows="5" cols="50" name="rep_content" placeholder="무성의한 신고내용이나, 타당하지 않은 내용을 작성할 경우 관리자 판단하에 제재가 가해질 수 있습니다."></textarea>
				<input type="submit" id="r_reason_btn" value="신고하기">
				<button id="r_reason_cencle">취소하기</button>
					
				</form>
			</div>
		</div>
	</div>
	
	<!-- 팝업창: 상품 신고창 -->
	<div id="productReport" class="popUp hidden">
		<div id="p_r_content">
		<div id="productInfo_report">
			<div id="productP_name_report">
				<span>신고상품명: </span>
			</div>		
		</div>
		
		<div class="notice_report">
			<p>신고시 꼭 확인해주세요!</p>
			<ul>
				<li>해당 상품을 신고할 경우 관리자가 사실여부 판단 뒤 조치를 취합니다.</li>			
				<li>신고사유가 적절하지 않을 경우 해당 신고는 기각될 수 있습니다.</li>			
				<li>무의미한 신고행위의 반복은 신고자의 제재사유가 될 수 있습니다.</li>			
			</ul>		
		</div>
		
		<div id="buttonBar_reportProduct">
			<form id="form_reportProduct" action="reportProduct.do" method="post">
				<input type="hidden" name="rep_productId">
				<input type="hidden" name="rep_memberId">
				<div id="r_reason_box">
					신고사유: 	
					<select name="rep_reason">	
						<option value="부적절한 상품">부적절한 상품</option>
						<option value="음란물">음란물</option>
						<option value="사행성 조장">사행성 조장물품</option>
					</select><br>
				</div>
				<textarea rows="5" cols="50" name="rep_content" placeholder="무성의한 신고내용이나, 타당하지 않은 내용을 작성할 경우 관리자 판단하에 제재가 가해질 수 있습니다."></textarea>
				<input type="submit" id="r_reason_btn" value="신고하기">
				<button id="r_reason_cencle">취소하기</button>
			</form>
		</div>
		</div>
	</div>

</body>
</html>