<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<div id="t_contents">
		<div id="t_title_img">
			<img alt="" src="image_mypage/trensfer_1_1.png">
		</div>
		<div>
			<img alt="" id="trensfer_name" src="image_mypage/trensfer_name.png">
		</div>
		<div id="t_contents_inner">
			<table id="trensfer_table1">
				<colgroup>
					<col width="30%">
					<col width="40%">
					<col width="30%">
				</colgroup>
				<tr>
					<th>이용기관명</th>
					<td>
					<input type="text" class="t_input" value="EVERYMARKET(주)">
					</td>
					<td><button class="t_button">출금한도확인</button></td>
				</tr>
				<tr>
					<th>금  액</th>
					<td>
					<input type="text" class="t_input" value="10000원">
					</td>
					<td><button class="t_button">은행상태확인</button></td>
				</tr>
			</table>
			<table id="trensfer_table2">
				<colgroup>
					<col width="25%">
					<col width="75%">
				</colgroup>
				<tr>
					<th>은행</th>
					<td>
						<select class="t_table2_input" id="t_table2_select">
							<option>농협  00:00 ~ 24:00</option>
							<option>국민  00:00 ~ 24:00</option>
							<option>우리  00:15 ~ 23:50</option>
							<option>신한  00:00 ~ 24:00</option>
							<option>하나  00:15 ~ 23:50</option>
							<option>기업  00:00 ~ 24:00</option>
							<option>부산  00:10 ~ 23:50</option>
							<option>외환  00:15 ~ 23:50</option>
							<option>광주  00:10 ~ 23:50</option>
							<option>제일  00:15 ~ 23:50</option>
							<option>경남  00:10 ~ 23:50</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>계좌번호</th>
					<td>
						<input type="text"  class="t_table2_input">
						<a>('-' 생략)</a>
						<img alt="" src="key.png">
					</td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td>
						<input type="password" id="t_table_pass" class="t_table2_input">
						<img alt="" src="image_mypage/key.png">
					</td>
				</tr>
				<tr>
					<th>주민번호</th>
					<td>
						<input type="text" class="t_table2_input">
						<a>('-' 생략)</a>
						<img alt="" src="image_mypage/key.png">
					</td>
				</tr>
			</table>
			<a id="t2_alert">(법인계좌인 경우 사업자등록번호입력)</a>
		</div>
		<div id="t_bottom">
			<a id="t2_alert" class="t_bottom_a">입력하신 계좌정보는 암호화되어 금융기관에서 직접 결제됩니다.</a>
			<div id="t2_inner_line">
				<input type="checkbox">
				<a id="t_email">E-mail 수신</a>
				<input type="text"  class="t_table2_input" id="t_bottom_email">
			</div>
			<a class="t_bottom_last">(입력하신 E-mail 주소로 확인 메일을 보내드립니다.)</a>
			<div>
				<div id="t_bottom_text">
					<a class="t_text_title">[고유식별정보 수집 및 이용 동의]</a> 
						<ul class="t_text_list">
							<li><a class="bold">수집항목</a><a class="normal"> : 주민번호</a></li>
							<li><a class="bold">수집목적</a><a class="normal"> : 본인확인 및 거래내역 조회</a></li>
							<li><a class="bold">이용기간</a><a class="normal"> : 이용목적 달성 후 지체없이 파기 </a></li>
						</ul>
						<a class="normal">고유식별정보 수집에 동의하시는 경우 </a><a class="bold">결제버튼</a><a class="normal">을, 동의하지 않는 경우 </a><a class="bold">취소버튼</a><a class="normal">을 눌러주시기 바랍니다.</a>
					<a class="t_text_title">[OTP/보안카드 관련 안내]</a>
						<ul class="t_text_list">
							<li><a class="bold">은행</a> 
					   			<a class="normal">기업/광주/국민/농협/대구/부산/산업/수협/신한/우리/전북/하나/SC은행</a>
							</li>
							<li><a class="bold">증권</a>  
					   			<a class="normal">대신/동부/동양/미래에셋/신영/신한금융투자/하나대투/하이투자/한국투자/한화/현대/HMC투자/SK증권</a>
							</li>
							<li><a class="bold">기타</a> 
					   			<a class="normal">산림조합/새마을금고/신협/우체국</a>
							</li>
						</ul>
					   <a class="t_text_bottom_line">상기계좌는 OTP/보안카드 확인 단계가 추가될 수 있습니다.</a> 
					   <a class="t_text_bottom_line">고객가치를 극대화하는 지급결제파트너 </a><a class="normal">금융결제원</a>
				</div>
				<div id="t_bottom_buttons">
					<button class="t_bottom_button" id="t_bottom_button_first">개인정보처리 방침</button>
					<button class="t_bottom_button">취소</button>
					<button class="t_bottom_button">결제</button>
				</div>
				<a class="normal" id="last_line">결제관련문의:금융결제원 고객센터 1577-5500(단축번호/:61)</a>
			</div>
		</div>
	</div>
</body>
</html>