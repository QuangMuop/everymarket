<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script src="jquery-1.9.1.min.js" type="text/javascript"></script>
<title>Insert title here</title>

</head>
<body>
	<div id="c_f_sidebar">
		<div id="c_f_s_title">
			<img alt="" id="c_f_logo" src="image_mypage/ema4.png">
			<img alt="" id="c_f_title" src="image_mypage/c_f_title.png">
			<img alt="" id="c_s_bar_ad" src="image_mypage/c_s_bar_ad.png">
			<img alt="" id="c_f_s_b_ad" src="image_mypage/c_f_s_b_ad.png">
			<div id="c_f_s_bottom">
				<img alt="" id="c_f_lang" src="image_mypage/c_f_lang.png">
			</div>
		</div>
	</div>
	<div id="c_f_contents">
		<div id="c_f_c_title">
			<p id="c_f_c_company">(주)EVERY</p>
			<div id="c_f_c_process">
				<a class="c_p" id="c_p1">카드선택/인증</a>
					<img alt="" src="image_mypage/arrow.png">
				<a class="c_p" id="c_p2">정보확인</a>
					<img alt="" src="image_mypage/arrow.png">
				<a class="c_p" id="c_p3">결제완료</a>
			</div>
		</div>
		<div id="c_f_c_inner">
			<div id="c_f_c_inner_title">
				<img alt="" id="c_f_c_p_title" src="image_mypage/c_f_c_p_title.png">
				<img alt="" id="qe" src="image_mypage/qe.png">
			</div>
			<table id="c_f_c_inner_table">
				<colgroup>
					<col width="25%">
					<col width="75%">
				</colgroup>
				<tr>
					<th id="c_f_c_inner_table_top1">상품명</th>
					<td id="c_f_c_inner_table_top2">몰라</td>
				</tr>
				<tr>
					<th>상품금액</th>
					<td id="c_in_table_pay">몰라</td>
				</tr>
			</table>
			<table id="c_f_c_inner_select">
				<colgroup>
					<col width="25%">
					<col width="75%">
				</colgroup>
				<tr>
					<th id="c_f_c_inner_table2_top1"></th>
					<th id="c_f_c_inner_table2_top2"></th>
				</tr>
				<tr>
					<td colspan="2">
						<a>
							<input type="radio" name="card_select">
							현대카드
						</a>
						<a>
							<input type="radio" name="card_select">
							삼성카드
						</a>
						<a>
							<input type="radio" name="card_select">
							하나SK
						</a>
						<a>
							<input type="radio" name="card_select">
							신한카드
						</a>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<a>
							<input type="radio" name="card_select">
							NH채움
						</a>
						<a>
							<input type="radio" name="card_select">
							외환카드
						</a>
						<a>
							<input type="radio" name="card_select">
							KB국민
						</a>
						<a>
							<input type="radio" name="card_select">
							BC카드
						</a>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<a>
							<input type="radio" name="card_select">
							씨티카드
						</a>
						<a>
							<input type="radio" name="card_select">
							롯데카드
						</a>
						<select id="c_f_c_select"  name="card_select">
							<option>그 외의 카드</option>
							<option>이니포인트</option>
							<option>우리평화</option>
							<option>저축은행</option>
							<option>광주은행</option>
							<option>전북은행</option>
							<option>수협</option>
							<option>조흥은행</option>
							<option>제주은행</option>
						</select>
					</td>
				</tr>
			</table>
			<button class="c_f_button" id="c_f_cencle">취소</button>
			<button class="c_f_button" id="c_f_next">다음</button>
			<div id="c_f_c_bottom_line">
			</div>
			<img alt="" id="c_f_c_bottom" src="image_mypage/c_f_c_bottom.png">
		</div>
	</div>
</body>
</html>