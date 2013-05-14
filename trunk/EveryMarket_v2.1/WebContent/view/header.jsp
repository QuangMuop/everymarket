
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>


<body>

	<!-- Header -->
	<div id="h_out_header">
	<div id="h_inner_header">
		<c:choose>
			<c:when test="${member == null }">
				<a class="h_tag" id="header_register">회원가입</a>
				<a id="h_bar" >|</a>
				<a class="h_tag" id="header_login">로그인</a>
			</c:when>
			<c:otherwise>
				<a class="h_tag" id="header_logout">로그아웃</a>
				<a id="h_bar" >|</a>
				<a class="h_tag" href="JJimbasket.do">찜바구니</a>
				<a id="h_bar" >|</a>
				<a class="h_tag" href="trade_list.do">거래내역</a>
				<a id="h_bar" >|</a>
				<!-- IndivMarket --> 
				<a class="h_tag" href="goMyMarket.go">내 마켓</a>
				<a id="h_bar" >|</a>
				<a class="h_tag" href="goMyPage.go">나의 정보</a>
				<a id="h_bar" >|</a>
				<div id="count_alarm" class="h_tag"><span>0</span></div>
				<a class="h_tag" id="header_message">알리미</a>
				<a id="h_bar" >|</a>
				<a class="h_tag" id="header_chargeCash">캐시충전</a>
				<a id="h_bar" >|</a>
				<a class="h_tag" id="header_cash">
				<img class="coin" alt="" src="images/smarket/coin.png">
				</a>
				<div id="cash_in">
					거래가능포인트<br>
					<div id="rest_point"></div>
				</div>
				<c:if test="${member.m_id == 'aa' }">
					<a id="h_bar" >|</a>
					<button  class="h_tag"  id="goAdminister">관리자페이지</button>
				</c:if>
				<a id="h_bar" >|</a>
				<a class="h_tag">${member.m_name }님 안녕하세요.</a>
			</c:otherwise>
		</c:choose>
	</div>
	</div>
	<!--logo-image,search -->
	<div id="h_mid">
		<img id="h_logo" src="images/header/logo_everymarket.gif">

		<div id="h_searchbar">
			<form action="search_result.do" id="h_searchline" method="post">
						<input id="h_search" class="search-input" name="search_content" 
								type="text" placeholder="물품이나 가게이름을 검색해보세요" />
						<button id="h_sbutton" type="submit"></button>
			</form>
		</div>
	</div>
	<!-- List, JJimbasket -->
	<div id="h_menu">
		<ul id="h_menu" class="h_menu">
				<li>
					<a href="list.do?category=의류">
						<img src="images/header/1.png" alt=""/>
						<span class="h_active"></span>
						<span class="h_wrap">
							<span class="h_link">의류</span>
							<span class="h_descr">clothes</span>
						</span>
					</a>
					<div class="h_box">
							<a href="list.do?category=여성의류">여성의류</a>
							<a href="list.do?category=남성의류">남성의류</a>
							<a href="list.do?category=언더웨어">언더웨어</a>
							<a href="list.do?category=유아임산부의류">유아/임산부 의류</a>
							<a href="list.do?category=기타의류">기타의류</a>
					</div>
				</li>
				<li>
					<a href="list.do?category=잡화">
						<img src="images/header/2.png" alt=""/>
						<span class="h_active"></span>
						<span class="h_wrap">
							<span class="h_link">잡화</span>
							<span class="h_descr">goods</span>
						</span>
					</a>
					<div class="h_box">
							<a href="list.do?category=시계">시계</a>
							<a href="list.do?category=신발">신발</a>
							<a href="list.do?category=악세서리">악세서리</a>
							<a href="list.do?category=화장품">화장품</a>
							<a href="list.do?category=기타잡화">기타잡화</a>
					</div>
				</li>
				<li>
					<a href="list.do?category=레저">
						<img src="images/header/3.png" alt=""/>
						<span class="h_active"></span>
						<span class="h_wrap">
							<span class="h_link">레저</span>
							<span class="h_descr">leisure</span>
						</span>
					</a>
					<div class="h_box">
							<a href="list.do?category=스포츠용품">스포츠용품</a>
							<a href="list.do?category=아웃도어">아웃도어</a>
							<a href="list.do?category=헬스용품">헬스용품</a>
					</div>
				</li>
				<li>
					<a href="list.do?category=디지털가전">
						<img src="images/header/4.png" alt=""/>
						<span class="h_active"></span>
						<span class="h_wrap">
							<span class="h_link">전자기기</span>
							<span class="h_descr">electronic equipment</span>
						</span>
					</a>
					<div class="h_box">
							<a href="list.do?category=컴퓨터기기">컴퓨터기기</a>
							<a href="list.do?category=카메라">카메라</a>
							<a href="list.do?category=휴대폰">휴대폰</a>
							<a href="list.do?category=가전제품">가전제품</a>
					</div>
				</li>
				<li>
					<a href="list.do?category=도서음반">
						<img src="images/header/5.png" alt=""/>
						<span class="h_active"></span>
						<span class="h_wrap">
							<span class="h_link">도서/음반</span>
							<span class="h_descr">books/records</span>
						</span>
					</a>
					<div class="h_box">
							<a href="list.do?category=문구팬시">문구팬시</a>
							<a href="list.do?category=DVD">DVD</a>
							<a href="list.do?category=도서">도서</a>
							<a href="list.do?category=음반">음반</a>
					</div>
				</li>
				<li>
					<a href="list.do?category=가구">
						<img src="images/header/6.png" alt=""/>
						<span class="h_active"></span>
						<span class="h_wrap">
							<span class="h_link">가구</span>
							<span class="h_descr">furniture</span>
						</span>
					</a>
					<div class="h_box">
						<a href="list.do?category=침대">침대</a>
						<a href="list.do?category=책걸상">책걸상</a>
						<a href="list.do?category=소파">소파</a>
						<a href="list.do?category=행거">행거</a>
						<a href="list.do?category=수납가구">수납가구</a>
					</div>
				</li>
			</ul>
	</div>
	
	
	<!-- Header 팝업창들 -->
	<div id="login" class="popUp hidden">
		<div id="login_box">
			<img id="login_title_img" alt="" src="image_popup/login_title.png">
			<div id="login_inner_box">
				<form action="login.do" id="login_form" method="post">
					<input class="login_input" name="m_id" type="text" placeholder="아이디를 입력하세요" size="20"><br><br>
					<input class="login_input" name="m_pwd" type="password" placeholder="비밀번호를 입력하세요" size="20"><br><br>
						<div id="login_button_box">
							<img id="login_button_img" alt="" src="image_popup/login_button.png">
							<input id="login_button" type="submit" value="">
						</div>	
					
				</form>
			</div>
			<div id="login_inner_box">
				<button id="join_button" >
					<img class="login_bottom_button"alt="" src="image_popup/m_join.png">
				</button>
				<button id="find_id_button" >
					<img class="login_bottom_button"alt="" src="image_popup/id_find.png">
				</button>
				<button id="find_pwd_button" >
					<img class="login_bottom_button"alt="" src="image_popup/password_find.png">
				</button>
			</div>
		</div>
	</div>
	
	<div id="register" class="popUp hidden">
		<div id="clause">
			<img alt="" id="join_form_img" src="image_popup/join_form.png">
			<img alt="" id="clause_title_img" src="image_popup/clause_title.png">
			<div id="clause_box">
			<p>EVERYMARKET 회원약관</p>
			<div id="clause_content">
				<a>[제 1장 총칙]</a>
					<ul>
						<li>제1조(목적)
							<ul>
								<a>이 약관은 ㈜EVERTMARKET(이하 "회사"라고 합니다)가 운영하는 인터넷사이트를 통하여 제공하는 전자상거래 관련 서비스(이하 " 서비스"라고 합니다)를 이용함에 있어 회사와 이용자의 권리·의무 및 책임사항을 정하는 것을 목적으로 합니다.</a>
							</ul>
						</li>
						<li>제2조(정의)
							<ul>
								<a>
    ① "인터파크INT"라 함은 회사가 재화 또는 용역을 이용자에게 제공하기 위하여 컴퓨터 등 정보통신설비를 이용하여 재화 또는 용역을 거래할 수 있도록 설정한 가상의 영업장(www.interpark.com 또는 www.interpark.co.kr)을 말하며, 아울러 사이버 몰을 운영하는 사업자의 의미로도 사용합니다. 단, 아이포인트몰, 마트/할인점, 도서, 공연/영화 및 쇼핑에 한하며 다른 탭의 영업장 및 www.playdb.co.kr은 제외합니다.
    ② "이용자"라 함은 회사에 접속하여 이 약관에 따라 회사가 제공하는 서비스를 받는 회원 및 비회원을 말합니다.
    ③ "회원"이라 함은 회사에 개인정보를 제공하여 회원등록을 한 자로서, 회사의 정보를 지속적으로 제공받으며, 회사가 제공하는 서비스를 계속적으로 이용할 수 있는 자를 말합니다.
    ④ "비회원"이라 함은 회원에 가입하지 않고 회사가 제공하는 서비스를 이용하는 자를 말합니다.
    ⑤ "Tiki회원"이라 함은 회사의 티켓예매/ENT서비스에 개인정보를 제공하고, 회원등록을 한 자로서 회비를 납부한 후 Tiki회원 기간 내 회사의 정보를 지속적으로 제공받으며, 회사가 제공하는 유료회원 서비스를 이용할 수 있는 회원으로 티켓부문에 한합니 다.
    ⑥ "어린이 회원"이라 함은 회사에 보호자의 동의를 얻어 개인정보를 제공하고 회원으로 등록한 만14세 미만의 자로서, 회사의 정보를 제공받고, 회사가 제공하는 서비스를 계속적으로 이용할 수 있는 자를 의미합니다.
    ⑦ "오픈마켓"이라 함은 회사를 통하여 판매자와 구매자간에 물품 매매 거래가 이루어질 수 있는 사이버 거래장소를 온라 인으로 제공하는 서비스 및 관련 부가 서비스 일체를 말하며 www.interpark.com 사이트의 첫 화면 또는 쇼핑서비스를 말합니다.
    ⑧ "판매자"라 함은 본 약관 및 오픈마켓 판매자약관을 승인하고, 회사와 서비스 이용계약을 체결한 자를 말하며, 물품을 판매할 의사로 해당 물품을 회사가 온라인으로 제공하는 양식에 맞추어 등록한 자의 의미로도 사용합니다.
    ⑨ "구매자"라 함은 재화 또는 용역을 구입할 의사를 회사가 온라인으로 제공하는 양식에 맞추어 밝힌 이용자를 말하며, 회원 및 비회원 구매자 모두를 의미합니다.
    ⑩ "I-Point"라 함은 이용자가 인터파크INT 및 가맹사이트(인터파크투어, 인터파크HM등)에서 재화를 구입하거나 용역을 이용하고 그 대가를 지급하는데 사용하기 위하여 ㈜인터파크INT가 발행, 관리하는 마일리지 형태의 선불식 전자지급수단을 말합니다.
</a>
							</ul>
						</li>
					</ul>
			</div>
			<div class="agree">
			<input type="checkbox">
				<a>EVERYMARKET 회원약관에 동의합니다.</a>
			
			</div>
			<p>전자금융거래 이용약관</p>
			<div id="clause_content">
					<ul>
						<li>1. 목적
							<ul>
								<a>EVERYMARKET은 EVERYMARKET회원에게 쇼핑, 도서, 티켓 예매, 투어/숙박/항공 예매 서비스와 회원관리서비스, 그리고 보다 다양한 서비스 제공을 위하여 아래와 같이 회원의 개인정보를 수집, 활용합니다.</a>
							</ul>
						</li>
						<li>제2조(정의)
							<ul>
								<a>
    ① "인터파크INT"라 함은 회사가 재화 또는 용역을 이용자에게 제공하기 위하여 컴퓨터 등 정보통신설비를 이용하여 재화 또는 용역을 거래할 수 있도록 설정한 가상의 영업장(www.interpark.com 또는 www.interpark.co.kr)을 말하며, 아울러 사이버 몰을 운영하는 사업자의 의미로도 사용합니다. 단, 아이포인트몰, 마트/할인점, 도서, 공연/영화 및 쇼핑에 한하며 다른 탭의 영업장 및 www.playdb.co.kr은 제외합니다.
    ② "이용자"라 함은 회사에 접속하여 이 약관에 따라 회사가 제공하는 서비스를 받는 회원 및 비회원을 말합니다.
    ③ "회원"이라 함은 회사에 개인정보를 제공하여 회원등록을 한 자로서, 회사의 정보를 지속적으로 제공받으며, 회사가 제공하는 서비스를 계속적으로 이용할 수 있는 자를 말합니다.
    ④ "비회원"이라 함은 회원에 가입하지 않고 회사가 제공하는 서비스를 이용하는 자를 말합니다.
    ⑤ "Tiki회원"이라 함은 회사의 티켓예매/ENT서비스에 개인정보를 제공하고, 회원등록을 한 자로서 회비를 납부한 후 Tiki회원 기간 내 회사의 정보를 지속적으로 제공받으며, 회사가 제공하는 유료회원 서비스를 이용할 수 있는 회원으로 티켓부문에 한합니 다.
    ⑥ "어린이 회원"이라 함은 회사에 보호자의 동의를 얻어 개인정보를 제공하고 회원으로 등록한 만14세 미만의 자로서, 회사의 정보를 제공받고, 회사가 제공하는 서비스를 계속적으로 이용할 수 있는 자를 의미합니다.
    ⑦ "오픈마켓"이라 함은 회사를 통하여 판매자와 구매자간에 물품 매매 거래가 이루어질 수 있는 사이버 거래장소를 온라 인으로 제공하는 서비스 및 관련 부가 서비스 일체를 말하며 www.interpark.com 사이트의 첫 화면 또는 쇼핑서비스를 말합니다.
    ⑧ "판매자"라 함은 본 약관 및 오픈마켓 판매자약관을 승인하고, 회사와 서비스 이용계약을 체결한 자를 말하며, 물품을 판매할 의사로 해당 물품을 회사가 온라인으로 제공하는 양식에 맞추어 등록한 자의 의미로도 사용합니다.
    ⑨ "구매자"라 함은 재화 또는 용역을 구입할 의사를 회사가 온라인으로 제공하는 양식에 맞추어 밝힌 이용자를 말하며, 회원 및 비회원 구매자 모두를 의미합니다.
    ⑩ "I-Point"라 함은 이용자가 인터파크INT 및 가맹사이트(인터파크투어, 인터파크HM등)에서 재화를 구입하거나 용역을 이용하고 그 대가를 지급하는데 사용하기 위하여 ㈜인터파크INT가 발행, 관리하는 마일리지 형태의 선불식 전자지급수단을 말합니다.
								</a>
							</ul>
						</li>
					</ul>
			</div>
			<div class="agree">
			<input type="checkbox">
				<a>전자금융거래 이용약관에 동의합니다.</a>
			
			</div>
			</div>
		</div>
		
		<div id="join_box">
			<img alt="" id="join_title" src="image_popup/join_title.png">
		<form action="registerMember.do" method="Post">
			<div class="box-center">
				<table>
					<colgroup>
						<col width="20%">
						<col width="80%">
					</colgroup>
					<tr>
						<th>아이디</th>
						<td><input type="text" class="input_txt" name="m_id" id="m_id" maxlength="8" />
							<button id="id_eq">중복확인</button>
						</td>
					</tr>
					<tr>
						<th>닉네임</th>
						<td><input type="text" class="input_txt" name="m_nick" id="nickname"  maxlength="10" /></td>
					</tr>
					<tr>
						<th>이름</th>
						<td><input type="text" class="input_txt" name="m_name" id="m_name"  /></td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td><input type="password" class="input_txt" name="m_pwd" id="m_pwd"  maxlength="12" /></td>					
					</tr>
					<tr>
						<th>비밀번호 확인</th>
						<td><input type="password" class="input_txt" name="m_pwdConfirm" id="m_pwdConfirm"  maxlength="12" /></td>
					</tr>
					<tr>
						<th>전화번호</th>
						<td><select id="phone_choice" name="m_phone_1">
								<option value="010">010</option>
								<option value="011">011</option>
								<option value="017">017</option>
								<option value="019">019</option>
							</select> 
								<input type="text" class="number_txt" name="m_phone_2" id="m_phone_2"  size="4" maxlength="4" />
								<input	type="text" class="number_txt" name="m_phone_3" id="m_phone_3"  size="4" maxlength="4" />
								<input type="hidden" class="number_txt" name="m_phone" id="m_phone"><br>
				</td>
					</tr>
					<tr>
						<th>메일</th>
						<td>
							<input type="text" name="m_mail" id="m_mail">
							<input type="button" id="m_mailConfirm" value="인증메일발송">
							<input type="text" name="reg_confirm" id="reg_confirm">						
						</td>
					</tr>
				</table>
			
			</div>
			<div class="box-footer">
			
				<img alt="" id="join_popup" src="image_popup/join_btn.png">
				<input class="box-btn" id="join_btn"  type="submit" value=""/> 
				
			</div>
		</form>	
		</div>
			
	</div>
	
	<div id="chargeCash" class="popUp hidden">
		<form id="form1" action="chargeCash.do" method="post">
			<div>
				<h3 id="cash-title">EVERYMARKET 캐쉬충전</h3>
			</div>
			<h3 id="info-title">충전금액</h3>
			<div id="cash-choose">
				<p class="cash-meter">
					<input type="radio" name="m_cash" class="m_cash" value="5000"><label>5000</label>
				</p>
				<p class="cash-meter">
					<input type="radio" name="m_cash" class="m_cash" value="10000"><label>10000</label>
				</p>
				<p class="cash-meter">
					<input type="radio" name="m_cash" class="m_cash" value="15000"><label>15000</label>
				</p>
				<p class="cash-meter">
					<input type="radio" name="m_cash" class="m_cash" value="20000"><label>20000</label>
				</p>
				<p class="cash-meter">
					<input type="radio" name="m_cash" class="m_cash" value="30000"><label>30000</label>
				</p>
				<p class="cash-meter">
					<input type="radio" name="m_cash" class="m_cash" value="50000"><label>50000</label>
				</p>
				<p class="cash-meter">
					<input type="radio" id="m_cash_txt"> <input id="cash_txt" class="number_txt" 
							type="text" name="cash_txt" disabled="disabled" size="8">
				</p>
			</div>
	
			<h3 id="info-title">결제방식</h3>
			<div id="visa">
				<select id="visa-choose" name="user.gender">
					<option value="">결제 방법을 선택하세요</option>
					<option value="cellphone">휴대폰 소액 결제</option>
					<option value="bank">계좌 이체</option>
					<option value="card">카드 결제</option>
				</select>
			</div>
			<div class="box-footer">
				<input class="box-btn" type="submit" value="충전하기"/> 
				<input class="box-btn" type="reset" value="취소하기"/>
			</div>
		</form>
	</div>
	
	<div id="list_message" class="popUp hidden"></div>
	<div id="notifier_message" class="popUp hidden">확인하지 않은 메시지가 있습니다!</div>
	
	
	<div id="find_ID" class="popUp hidden">
		<h3>아이디 찾기</h3>		
		<form id="form_find_ID" action="find_ID.do" method="POST">
			이름<input type="text" name="m_name" ><br>
			이메일<input type="text" name="m_email" ><br>
		</form>
			<button id="find_ID_result_button" >
				<img class="login_bottom_button"alt="" src="image_popup/id_find.png">
			</button>	
	</div>
	
	<div id="find_pwd" class="popUp hidden">
		<h3>비밀번호 찾기</h3>
		<form id="form_find_pwd" action="find_pwd.do" method="POST">
			아이디<input type="text" name="m_id"><br>
			이름 <input type="text" name="m_name"><br>
			이메일<input type="text" name="m_email"><br>
		</form>
		<button id="find_pwd_email" >
					<img class="login_bottom_button"alt="" src="image_popup/password_find.png">
	</div>
	
</body>
</html>