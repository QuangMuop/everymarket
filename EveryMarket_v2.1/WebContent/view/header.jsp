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
				<a class="h_tag" id="cash">${member.m_cash }
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
		<div id="h_logo">
			
		</div>
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
					<a href="list.do?category=전자기기">
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
	
	<br><br>
	
	<!-- Header 팝업창들 -->
	<div id="login" class="popUp hidden">
		<form action="login.do" method="post">
			<input name="m_id" type="text" placeholder="아이디를 입력하세요" size="20"><br><br>
			<input name="m_pwd" type="password" placeholder="비밀번호를 입력하세요" size="20"><br><br>
			<input type="submit" value="로그인"><br><br>
		</form>
	</div>
	
	<div id="register" class="popUp hidden">
		<form action="registerMember.do" method="Post">
			<div>
				<h2 id="sign-up-title">EVERYMARKET 회원가입</h2>
			</div>
			<h3 id="info-title">정보 입력</h3>
			<div class="box-center">
				<input type="text" class="input_txt" name="m_id" id="m_id" placeholder="아이디 (최대 8자)" maxlength="8" /><br>
				<input type="text" class="input_txt" name="m_nick" id="m_nick" placeholder="닉네임 (최대 10자)" maxlength="10" /><br>
				<input type="text" class="input_txt" name="m_name" id="m_name" placeholder="이름" /><br>	
				<input type="password" class="input_txt" name="m_pwd" id="m_pwd" placeholder="비밀번호 입력" maxlength="12" /><br>
				<input type="password" class="input_txt" name="m_pwdConfirm" id="m_pwdConfirm" placeholder="비밀번호 확인" maxlength="12" />	<br>
				<select id="phone_choice" name="m_phone_1">
					<option value="010">010</option>
					<option value="011">011</option>
					<option value="017">017</option>
					<option value="019">019</option>
				</select> 
				<input type="text" class="number_txt" name="m_phone_2" id="m_phone_2" placeholder="전화번호 앞자리" size="4" maxlength="4" />
				<input	type="text" class="number_txt" name="m_phone_3" id="m_phone_3" placeholder="전화번호 뒷자리" size="4" maxlength="4" />
				<input type="hidden" class="number_txt" name="m_phone" id="m_phone"><br>
				<input type="text" name="m_mail" id="m_mail">
				<input type="button" id="m_mailConfirm" value="인증메일발송"> <br>
				<input type="text" name="reg_confirm" id="reg_confirm"><br>
			</div>
			<div class="box-footer">
				<input class="box-btn" id="submit"  type="submit" value="회원가입" /> 
				<input class="box-btn" type="reset" value="취소" />
			</div>
		</form>		
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
	
</body>
</html>