<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<div id="cash_buy_title">
		<img alt="" src="buy_title.png">		
	</div>
	<div id="cash_buy_inner">
		<ul>
			<li>CASH는 계좌이체나 신용카드, 휴대폰결제 등을 통해 충전가능하며 다른 사용자와 거래간에 사용됩니다.</li>
			<li>CASH 사용처는 EVERYMARKET입니다.</li>
			<li>전자금융거래법 등 관계 법령에 따라 적용 중인 "포인트 통합 한도 200만원 제한"에 포함됩니다.</li>
			<li>전자금융 시행령에 의해 포인트/마일리지 합산 금액이 50만원 초과일 경우 실명인증 후 사용이 가능합니다.</li>
		</ul>
		
		<div id="recharge_logic">
					<div class="recharge_box" id="box_first">
						<div class="recharge_box_title">
							<img class="box_img" alt="" src="image_mypage/now_cash.png">
						</div>
						<a>0</a>
					</div>
					<div class="recharge_box">
						<div class="recharge_box_title">
							<img class="box_img"  alt="" src="image_mypage/recharge_cash.png">
						</div>
						<input type="text" id="c_inner_pass_input" class="input_cash" value="0">
					</div>
					<div class="recharge_box">
						<div class="recharge_box_title">
							<img class="box_img"  alt="" src="image_mypage/after_cash.png">
						</div>
						<a>0</a>
					</div>
		</div>
		
		<table class="c_buy_contents">
			<tr>
			 	
				<th class="c_rows">충전할 금액</th>
				<td>
				<input type="text" value="0">
				<a>원/최대 200만원 까지 가능</a></td>
			</tr>
			
			<tr>
				<th class="c_rows"  id="c_contents_midbar">결제수단 선택</th>
				<td  id="c_contents_midbar">
					
					<input id="select1" checked="checked" type="radio" value="무통장" name="way">
					<a>무통장입금</a>
					<input id="select2"  type="radio" value="계좌이체" name="way">
					<a>계좌이체</a>
					<input id="select3"  type="radio" value="휴대폰" name="way">
					<a>휴대폰</a>
					<input id="select4"  type="radio" value="신용카드" name="way">
					<a>신용카드</a>
				</td>
			</tr>
			<tr>
				<th class="c_rows"  id="c_contents_midbar">결제정보 입력</th>
				<td id="c_contents_midbar">
					<p id="select_detail1">
						<a>입금자 명</a>
						<input type="text" value="관리자" readonly="readonly">
						<a>입금 은행</a>
						<select>
							<option>농협</option>
							<option>국민</option>
							<option>우리</option>
							<option>신한</option>
							<option>하나</option>
							<option>기업</option>
							<option>부산</option>
							<option>외환</option>
							<option>광주</option>
							<option>제일</option>
							<option>경남</option>
						</select>
					</p>
					<p class="hidden" id="select_detail2">
						<button class="select2_button" id="trensfer">실시간 계좌이체 안내</button>
						<button class="select2_button" id="bank_time">은행별 이용가능 시간</button>
					</p>
					<p class="hidden" id="select_detail3">
						<button class="select2_button" id="phone_buy">휴대폰 결제 안내</button>
					</p>
					<p class="hidden" id="select_detail4">
						<button class="select2_button" id="card_buy">신용카드 결제 안내</button>
					</p>
				</td>
			</tr>
		</table>
			<button class="c_button" id="c_recharge_finish_button">결제하기</button>
			<button class="c_button" id="c_cencle">취소</button>
	</div>
</body>
</html>