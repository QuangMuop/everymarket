<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body>
<div id="mypage_body">
	<div id="side_bar">
		<div id="b_bottomline">
		<img alt="" src="image_mypage/mymarket.png">
		</div>
		<div id="my_inf">
				<a id="m_nickname">이승혁</a>
				<a id="m_nickplus">님의 등급정보</a>
				<div id="m_class">
					<div>
						<img alt="" id="c_img" src="image_mypage/vip.png">
						<button id="go_service">등급 혜택 보기</button>
					</div>
				</div>
		</div>
		<div id="out_menu">
			<ul id="m_menu_bar">
				<li id="menu1">회원정보 조회/수정</li>
				<li id="menu2">cash 충전/환급</li>
				<li id="menu3">신고/상담 내역</li>
			</ul>
		</div>
	</div>
<!-- 	////////////////////////// -->
<div id="contents">
	<div class="out_hidden" id="contents1">
		<div id="c_top">
			<img alt="" id="c_inner_img" src="image_mypage/statuschange.png">
			<a class="c_font">|</a>
			<a class="c_font">고객님의 회원정보를 수정하실 수 있습니다. 회원정보를 변경하시고 반드시 하단에 있는 확인 버튼을 클릭해 주셔야 합니다.</a>
		</div>
		<div id="c_inner1">
			<img alt="" id="c_repass" src="image_mypage/repassword.png">
			<div id="c_inner_block">
				<div class="c_inner_input">
					<img alt="" class="repass_img" id ="repass_id" src="image_mypage/id.png">
					<a>${member.m_id}</a>
				</div>
				<div class="c_inner_input">
					<img alt="" class="repass_img" src="image_mypage/password.png">
					<input id="c_inner_pass_input1" type="password">
					회원님의 정보를 안전하게 보호하기 위해 비밀번호를 다시 한번 확인 합니다.
				</div>
			</div>
				<button class="c_button" id="c_ok1" pass="${member.m_pwd}">확인</button>
				<button class="c_button" id="c_cencle1">취소</button>
		</div>
		<div id="re_member"  class="c_inner_hidden">
			<img alt="" id="c_remember" src="image_mypage/c_title.png">
			<table id="c_table">
			
				<tr>
					<th class="row">
						<p>이름</p>
					</th>
					<td>
						${member.m_name}
					</td>
				</tr>
				<tr>
					<th class="row">
						<p>아이디</p>
					</th>
					<td>
						${member.m_id }
					</td>
				</tr>
				<tr>
					<th class="row">
						<p>바꿀비밀번호</p>
					</th>
					<td>
						<input id="re_password" class="c_input" type="password">
					</td>
				</tr>
				<tr>
					<th class="row">
						<p>바꿀비밀번호재확인</p>
					</th>
					<td>
						<input id="re_password" class="c_input" type="password">
					</td>
				</tr>
				<tr>
					<th class="row">
						<p>이메일주소</p>
					</th>
					<td>
						<input id="re_email_first" class="c_input" type="text" value="이메일">
						@
						<input id="re_email_second" class="c_input" type="text" value="이메일">
					</td>
				</tr>
				<tr>
					<th class="row">
						<p>휴대폰 번호</p>
					</th>
					<td>
						<select id="select_phone">
							<option>010</option>
							<option>011</option>
							<option>017</option>
						</select>
						<input id="re_phone_first" class="c_input" type="text" value="앞번호">
						<input id="re_phone_second" class="c_input" type="text" value="뒷번호">
					</td>
				</tr>
			</table>
				<button class="c_button" id="c_ok_update">확인</button>
				<button class="c_button" id="c_cencle">취소</button>
		</div>
	</div>
<!-- 		////////////////////// -->
	<div class="out_hidden" id="contents2">
		<div id="c_top">
			<img alt="" id="c_inner_img" src="image_mypage/cash_title.png">
			<a class="c_font">|</a>
			<a class="c_font">고객님의 포인트를 충전이나 환급하실 수 있습니다.</a>
		</div>
		<div id="c_inner2">
			<img alt="" id="c_repass" src="image_mypage/repassword.png">
			<div id="c_inner_block">
				<div class="c_inner_input">
					<img alt="" class="repass_img" id ="repass_id" src="image_mypage/id.png">
					<a>${member.m_id}</a>
				</div>
				<div class="c_inner_input">
					<img alt="" class="repass_img" src="image_mypage/password.png">
					<input id="c_inner_pass_input2" type="password">
					회원님의 정보를 안전하게 보호하기 위해 비밀번호를 다시 한번 확인 합니다.
				</div>
			</div>
				<button class="c_button" id="c_ok2" pass="${member.m_pwd}">확인</button>
				<button class="c_button" id="c_cencle2">취소</button>
		</div>
		<div id="m_cash_detail"  class="c_inner_hidden">
			<img alt="" id="c_remember" src="image_mypage/cash.png">
			<div id="m_cash_view">
				<ul>
					<li>CASH는 계좌이체나 신용카드, 휴대폰결제 등을 통해 충전가능하며 다른 사용자와 거래간에 사용됩니다.</li>
					<li>CASH 사용처는 EVERYMARKET입니다.</li>
					<li>전자금융거래법 등 관계 법령에 따라 적용 중인 "포인트 통합 한도 200만원 제한"에 포함됩니다.</li>
					<li>전자금융 시행령에 의해 포인트/마일리지 합산 금액이 50만원 초과일 경우 실명인증 후 사용이 가능합니다.</li>
				</ul>
				<div id="my_cash">
					<div>
						<a>보유 CASH량은</a>
						<a id="my_cash_view">${member.m_cash }</a>
						<a>입니다.</a>
					</div> 
				</div>
			</div>
			
			<img alt="" id="c_remember" src="cash_recharge.png">
			<div id="m_cash_view" class="cash_recharge">
				<ul>
					<li>캐시 충전은 실시간 계좌이체, 무통장입금, 휴대폰, 신용카드 등으로 가능합니다.</li>
					<li>무통장입금으로 충전 시 입금 기한은 5영업일로 입금기한이 지나도입금이 되지 않을 경우 자동 취소됩니다.</li>
					<li>캐시 1회 최소 충전 금액은 1000원이면, 최대 충전 금액은 200만원으로 한도를 제한합니다.</li>
					<li>충전 신청 후 입금 전에는 취소가 가능하며, 입금 후에는 인출하기를 통해 현금으로 인출하실 수 있습니다.</li>
					<li>타행으로 입금 시 수수료는 고객부담입니다.	</li>
				</ul>
				
				<button class="c_button" id="c_recharge_button">충전하기</button>
				<button class="c_button" id="c_cencle">취소</button>
			</div>
			
			<img alt="" id="c_remember" src="cash_repond.png">
			<div id="m_cash_view">
				<ul>
					<li>CASH는 계좌이체나 신용카드, 휴대폰결제 등을 통해 충전가능하며 다른 사용자와 거래간에 사용됩니다.</li>
					<li>CASH 사용처는 EVERYMARKET입니다.</li>
					<li>전자금융거래법 등 관계 법령에 따라 적용 중인 "포인트 통합 한도 200만원 제한"에 포함됩니다.</li>
					<li>전자금융 시행령에 의해 포인트/마일리지 합산 금액이 50만원 초과일 경우 실명인증 후 사용이 가능합니다.</li>
				</ul>
				<div id="my_cash">
					<div>
						<a>보유 CASH량은</a>
						<a id="my_cash_view">${member.m_cash }</a>
						<a>입니다.</a>
					</div> 
				</div>
			</div>
				<button class="c_button" id="c_respond_button">환급하기</button>
				<button class="c_button" id="c_cencle">취소</button>
		</div>
	</div>	
</div>
</div>
</body>
</html>