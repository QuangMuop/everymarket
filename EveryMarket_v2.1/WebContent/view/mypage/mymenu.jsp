<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body>
	<div id="mypage_body">
		<div id="side_bar">
			<div id="b_bottomline">
				<img alt="" src="image_mypage/mymarket.png">
			</div>
			<div id="my_inf">

				<a id="m_nickname">${member.m_name}</a> <a id="m_nickplus">님의
					등급정보</a>
				<div id="m_class">
					<div id="my_cash">
						<div>
							<a>보유 CASH량은</a> <a id="my_cash_view">${member.m_cash }</a> <a>입니다.</a>
						</div>
					</div>
				</div>


			</div>
			<div id="out_menu">
				<ul id="m_menu_bar">
					<li id="menu1">회원정보 조회/수정</li>
					<li id="menu2">cash 충전/환급</li>
					<li id="menu3">거래내역</li>
				</ul>
			</div>
		</div>

		<div id="contents">
			<div class="out_hidden" id="contents1">
				<div id="c_top">
					<img alt="" id="c_inner_img" src="image_mypage/statuschange.png">
					<a class="c_font">|</a> <a class="c_font">고객님의 회원정보를 수정하실 수
						있습니다. 회원정보를 변경하시고 반드시 하단에 있는 확인 버튼을 클릭해 주셔야 합니다.</a>
				</div>
				<div id="c_inner1">
					<img alt="" id="c_repass" src="image_mypage/repassword.png">
					<div id="c_inner_block">
						<div class="c_inner_input">
							<img alt="" class="repass_img" id="repass_id"
								src="image_mypage/id.png"> <a>${member.m_id}</a>
						</div>
						<div class="c_inner_input">
							<img alt="" class="repass_img" src="image_mypage/password.png">
							<input id="c_inner_pass_input1" name="c_inner_pass_input1"
								type="password"> 회원님의 정보를 안전하게 보호하기 위해 비밀번호를 다시 한번 확인
							합니다.
						</div>
					</div>
					<button class="c_button" id="c_ok1" pass="${member.m_pwd}">확인</button>
					<button class="c_button" id="c_cencle1">취소</button>
				</div>

				<div id="re_member" class="c_inner_hidden">
					<img alt="" id="c_remember" src="image_mypage/c_title.png">
					<table id="c_table">

						<tr>
							<th class="row">
								<p>이름</p>
							</th>
							<td>${member.m_name}</td>
						</tr>
						<tr>
							<th class="row">
								<p>아이디</p>
							</th>
							<td id="memberinfo_m_id">${member.m_id }</td>
						</tr>
						<tr>
							<th class="row">
								<p>새비밀번호</p>
							</th>
							<td><input id="re_password" class="c_input" type="password"
								name="re_password"></td>
						</tr>
						<tr>
							<th class="row">
								<p>새비밀번호재확인</p>
							</th>
							<td><input id="re_password" class="c_input" type="password"
								name="re_password2"></td>
						</tr>
						<tr>
							<th class="row">
								<p>이메일주소</p>
							</th>
							<td><input id="re_email_first" class="c_input" type="text"
								value="이메일" name="re_email_first"> @ <input
								id="re_email_second" class="c_input" type="text" value="이메일"
								name="re_email_second"></td>
						</tr>
						<tr>
							<th class="row">
								<p>휴대폰 번호</p>
							</th>
							<td><select id="select_phone">
									<option>010</option>
									<option>011</option>
									<option>017</option>
							</select> <input id="re_phone_first" class="c_input" type="text"
								value="앞번호" name="re_phone_first"> <input
								id="re_phone_second" class="c_input" type="text" value="뒷번호"
								name="re_phone_second"></td>
						</tr>
					</table>
					<button class="c_button" id="c_ok_update">확인</button>
					<button class="c_button" id="c_cencle">취소</button>
				</div>
			</div>


			<div class="out_hidden" id="contents2">
				<div id="c_top">
					<img alt="" id="c_inner_img" src="image_mypage/cash_title.png">
					<a class="c_font">|</a> <a class="c_font">고객님의 포인트를 충전이나 환급하실 수
						있습니다.</a>
				</div>
				<div id="c_inner2">
					<img alt="" id="c_repass" src="image_mypage/repassword.png">
					<div id="c_inner_block">
						<div class="c_inner_input">
							<img alt="" class="repass_img" id="repass_id"
								src="image_mypage/id.png"> <a>${member.m_id}</a>

						</div>

						<div class="c_inner_input">
							<img alt="" class="repass_img" src="image_mypage/password.png">
							<input id="c_inner_pass_input2" type="password"> 회원님의 정보를
							안전하게 보호하기 위해 비밀번호를 다시 한번 확인 합니다.
						</div>
					</div>
					<button class="c_button" id="c_ok2" pass="${member.m_pwd}">확인</button>
					<button class="c_button" id="c_cencle2">취소</button>
					</div>
				
					<div id="m_cash_detail" class="c_inner_hidden">
						<div id="c_inner_box">
							<img alt="" id="c_remember" src="image_mypage/cash_add.png">
						</div>
						<div id="m_cash_view" class="cash_recharge">
							<ul>
								<li>캐시 충전은 실시간 계좌이체, 무통장입금, 휴대폰, 신용카드 등으로 가능합니다.</li>
								<li>무통장입금으로 충전 시 입금 기한은 5영업일로 입금기한이 지나도입금이 되지 않을 경우 자동
									취소됩니다.</li>
								<li>캐시 1회 최소 충전 금액은 1000원이면, 최대 충전 금액은 200만원으로 한도를 제한합니다.</li>
								<li>충전 신청 후 입금 전에는 취소가 가능하며, 입금 후에는 인출하기를 통해 현금으로 인출하실 수
									있습니다.</li>
								<li>타행으로 입금 시 수수료는 고객부담입니다.</li>
							</ul>
							<button class="c_button" id="c_recharge_button">충전하기</button>
						</div>
						<div id="c_inner_box">
							<img alt="" id="c_remember" src="image_mypage/cash_down.png">
						</div>
						<div id="m_cash_view">
							<ul>
								<li>CASH는 계좌이체나 신용카드, 휴대폰결제 등을 통해 충전가능하며 다른 사용자와 거래간에
									사용됩니다.</li>
								<li>CASH 사용처는 EVERYMARKET입니다.</li>
								<li>전자금융거래법 등 관계 법령에 따라 적용 중인 "포인트 통합 한도 200만원 제한"에 포함됩니다.</li>
								<li>전자금융 시행령에 의해 포인트/마일리지 합산 금액이 50만원 초과일 경우 실명인증 후 사용이
									가능합니다.</li>
							</ul>
						</div>
						<button class="c_button" id="c_respond_button">환급하기</button>
					</div>
				</div>
				<!-- <<<<<<< .mine -->
				<!-- 	////////////////////////////////////거래내역 -->
				<%-- <center> --%>
				 <!-- 	<div class="out_hidden" id="contents3">
						=======
						<button class="c_button" id="c_respond_button">환급하기</button>
					</div>  -->
			<!-- </div> -->
			<!-- 	////////////////////////////////////거래내역 -->
			<center>
				<div id="contents3">
				
					<div id="trade_menubar">
						<ul class="trade_menu">
							<li id="trade_tab1" class="nonselect selected"><img
								id="trade_tab1" src="image_trade/buy_info_tab.png"></li>
							<li id="trade_tab2" class="nonselect"><img id="trade_tab2"
								class="t_tab_img" src="image_trade/sell_info_tab_back.png"></li>
							<li id="trade_tab3" class="nonselect"><img id="trade_tab3"
								class="t_tab_img" src="image_trade/trade_info_tab_back.png"></li>
							<li id="trade_tab4" class="nonselect"><img id="trade_tab4"
								class="t_tab_img" src="image_trade/jjim_info_tab_back.png"></li>
						</ul>
					</div>

					<div id="trade_tab_inner1">
						<table id="buying" class="trade_table_box">
							<colgroup>
								<col width="15%">
								<col width="45%">
								<col width="20%">
								<col width="20%">
							</colgroup>
							<tr>
								<th>주문번호</th>
								<th>상품명</th>
								<th>사용포인트</th>
								<th colspan="2">진행상태</th>
							</tr>

							<c:forEach var="bl" items="${buyingList}">
								<tr class="bl" t_id="${bl.t_id }">

									<c:choose>
										<c:when test="${bl.t_status == 1 }">
											<td>승인대기</td>

										</c:when>
										<c:otherwise>
											<td>${bl.t_del_number}</td>
										</c:otherwise>

									</c:choose>
									<td>${bl.p_name }</td>
									<td><img class="coin" alt="" src="images/smarket/coin.png">${bl.p_price
										}</td>
									<c:choose>
										<c:when test="${bl.t_status == 1}">
											<td colspan="2">배송준비중</td>
										</c:when>
										<c:when test="${bl.t_status == 2 }">
											<td id="${bl.t_id}3">배송중</td>
											<td class="td_db_trace">
												<button class="db_trace" id="trace_page" t_id="${bl.t_id}">배송추적</button>
											</td>
										</c:when>
										<c:when test="${bl.t_status == 3}">
											<td id="db_text">배송완료</td>
											<td><button id="accept" value="수취확인" t_id="${bl.t_id}">수취확인</button>
												<button id="report" value="신고하기" t_id="${bl.t_id}">신고하기</button></td>
										</c:when>
									</c:choose>
								</tr>
							</c:forEach>
						</table>



						<div id="main_report" class="popUp hidden">
							<div id="main_report_inner">
								<img alt="" id="main_report_title"
									src="image_trade/report_title_img.png">
								<div class="notice_report">
									<p>신고시 꼭 확인해주세요!</p>
									<ul>
										<li>해당 회원을 신고할 경우 관리자가 사실여부 판단 뒤 조치를 취합니다.</li>
										<li>신고사유가 적절하지 않을 경우 해당 신고는 기각될 수 있습니다.</li>
										<li>무의미한 신고행위의 반복은 신고자의 제재사유가 될 수 있습니다.</li>
									</ul>
								</div>
								<form action="reportAction.do" method="post">
									<div id="r_box_top">
										<a id="trade_number"></a> <a id="trade_name"></a> <select
											id="report_choice" name="rep_reason">
											<!-- 					<option>사유 선택</option> -->
											<option value="본 제품과 다른 제품">본 제품과 다른 제품</option>
											<option value="배송지연">배송 지연</option>
											<option value="제품 불량">제품 불량</option>
											<option value="기타 사유">기타 사유</option>
										</select>
										<textarea name="rep_content" id="rep_content"></textarea>
									</div>
									<input type="hidden" id="rep_memberId" name="rep_memberId"
										value=""> <input type="hidden" id="rep_writer"
										name="rep_writer" value=""> <input type="hidden"
										id="rep_productId" name="rep_productId" value=""> <input
										type="submit" id="rp_ok" value="신고 완료">

								</form>
							</div>
						</div>
					</div>

					<div id="trade_tab_inner2" class="trade_tab_hidden">
						<table id="selling" class="trade_table_box">
							<tr>
								<th>주문번호</th>
								<th>상품명</th>
								<th>총 결제금액</th>
								<th colspan="2">진행상태</th>
							</tr>

							<c:forEach var="sl" items="${sellingList}">
								<c:choose>

									<c:when test="${sl.t_status > 0 }">

										<tr t_ids="${sl.t_id}" t_status="${sl.t_status}">
											<c:choose>
												<c:when test="${sl.t_status == 1 }">
													<td id="${sl.t_id}4">주문대기</td>
												</c:when>
												<c:otherwise>
													<td>${sl.t_del_number}</td>
												</c:otherwise>

											</c:choose>
											<td class="t_id" type="hidden" value="${sl.t_id}">${sl.p_name}</td>
											<td id="t_status" name="${sl.t_status}">${sl.p_price}</td>

											<c:choose>
												<c:when test="${sl.t_status == 1}">
													<form>
														<td id="${sl.t_id}1s"><input class="${sl.t_id}5"
															type="text" id="s_num_input"
															placeholder="송장번호를 입력해주세요(8자리)"> <!-- 거래번호 or 프로덕트 아이디 -->
														</td>
														<td id="${sl.t_id}2"><input class="dn_bt"
															type="button" value="확인" t_id="${sl.t_id}"
															name="${sl.t_status}"></td>

													</form>
												</c:when>


												<c:when test="${sl.t_status == 2 }">
													<td id="${sl.t_id}3">배송중</td>
													<td><input class="db_trace" type="button" value="배송추적"
														t_id="${sl.t_id}" /></td>
												</c:when>

												<c:when test="${sl.t_status == 3 }">
													<td id="db_text">배송완료</td>
													<td id="db_ok1">
														<!-- <input class="db_trace" type="button" value="배송추적"/ >-->
														수취확인 대기
													</td>
												</c:when>




											</c:choose>
										</tr>
									</c:when>
								</c:choose>

							</c:forEach>
						</table>
					</div>


					<div id="trade_tab_inner3" class="trade_tab_hidden">
						<div id="traded">
							<table id="buy" class="trade_table_box">
								<tr>
									<th>주문번호</th>
									<th>상품명</th>
									<th>총 결제금액</th>
									<th colspan="2">진행상태</th>
								</tr>

								<c:forEach var="cb" items="${completeBList}">
									<tr>
										<td>${cb.t_del_number }</td>
										<td>${cb.p_name}</td>
										<td>${cb.p_price }</td>
										<td id="R_td" class=${cb.p_id }><c:choose>
												<c:when test="${cb.t_status == 4}">
													<button id="review_in_btn" class="${cb.p_id }"  value="${cb.p_id}">리뷰쓰기</button>
												</c:when>
												<c:when test="${cb.t_status == 6 }">
							   리뷰작성완료
							</c:when>

											</c:choose></td>
									</tr>
								</c:forEach>

							</table>


							<table id="sell" class="trade_table_box">
								<tr>
									<th>주문번호</th>
									<th>상품명</th>
									<th>총 결제금액</th>
									<th>진행상태</th>
								</tr>


								<c:forEach var="cs" items="${completeSList}">
									<tr>
										<td>${cs.t_del_number }</td>
										<td>${cs.p_name}</td>
										<td>${cs.p_price }</td>
										<td>판매완료</td>
									</tr>
								</c:forEach>

							</table>
						</div>
					</div>
					<div id="trade_tab_inner4" class="trade_tab_hidden">

						<table class="trade_table_box">
							<colgroup>
								<col width="15%">
								<col width="15%">
								<col width="25%">
								<col width="15%">
								<col width="15%">
								<col width="15%">
							</colgroup>
							<tr>
								<th>상품이미지</th>
								<th>상품명</th>
								<th>상세설명</th>
								<th>상품금액</th>
								<th>판매자</th>
								<th>선택</th>
							</tr>

							<c:forEach var="JP" items="${jjimList}">
								<tr class="${JP.p_id}j">
									<td><img id="jjim_list_img"
										src="image_product/${JP.p_img}"></td>
									<td>${JP.p_name}</td>
									<td>${JP.p_detail}</td>
									<td>${JP.p_price}</td>
									<td>${JP.m_id}</td>
									<td><button class="delete_button" p_id="${JP.p_id}">삭제</button>
										<button class="buyj_button" p_id="${JP.p_id}">구입하기</button></td>
								</tr>
							</c:forEach>
						</table>
					</div>
				</div>
			</center>
		</div>
	</div>


	<!-- 리뷰쓰기 팝업  -->
	<div id="review_pop" class="popUp hidden">
		<!-- <form> -->
			<div id="rp_name"></div>
			<input type="hidden" id="rp_id" name="p_id" value=""> <br>
			평점 :<select id="r_score" name="r_score">
				<option value="-2">-2</option>
				<option value="-1">-1</option>
				<option value="0">0</option>
				<option value="1">1</option>
				<option value="2">2</option>
			</select><br> 리뷰내용
			<textarea name="r_content" id="r_content"></textarea>
			<br> <!-- <input type="submit" id="rp_ok1" value="작성 완료"> -->
			<button id="rp_ok1" value="">작성 완료</button>
			 <input
				type="reset" value="취소">
	<!-- 	</form> -->
	</div>
</body>
</html>