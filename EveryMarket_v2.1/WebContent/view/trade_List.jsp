<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">



<title>Insert title here</title>
</head>
<body>


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
				<tr id="${bl.t_id}">

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
							<td id="button"><input class="db_trace" type="button"
								value="배송추적" t_id="${bl.t_id}" /></td>
						</c:when>
						<c:when test="${bl.t_status == 3}">
							<td id="db_text">배송완료</td>



							<td><input type="button" id="accept" value="수취확인"
								t_id="${bl.t_id}" /> <input type="button" id="report"
								value="신고하기" t_id="${bl.t_id}" /></td>

							<%-- <td><button id="accept" value="수취확인" t_id="${bl.t_id}" >수취확인</button> 
							<button id="report" value="신고하기" t_id="${bl.t_id}" >신고하기</button></td> --%>

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
					<input type="hidden" id="rep_memberId" name="rep_memberId" value="">
					<input type="hidden" id="rep_writer" name="rep_writer" value="">

					<input type="hidden" id="rep_productId" name="rep_productId"
						value=""> <input type="submit" id="rp_ok" value="신고 완료">

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
										<td id="${sl.t_id}1s">송장번호입력: <input class="${sl.t_id}5"
											type="text"> <!-- 거래번호 or 프로덕트 아이디 -->
										</td>
										<td id="${sl.t_id}2"><input class="dn_bt" type="button"
											value="확인" t_id="${sl.t_id}" name="${sl.t_status}"></td>

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
				<%-- 	<td>${cb.t_del_number }</td>
					<td>${cb.p_name}</td>
					<td>${cb.p_price }</td> 
					<td>구매완료<button id="review_in_btn" value="${cb.p_id }">리뷰쓰기</button></td> --%>
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
						<td>구매완료</td>
						<td>
						<c:choose>
							<c:when test="${cb.t_status == 4}">
								<button id="review_bt" value="${cb.p_id}">리뷰쓰기</button>
							</c:when>
							<c:when test="${cb.t_status == 6 }">
							   리뷰작성완료
							</c:when>

						</c:choose>
						</td>
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
					<td><img id="jjim_list_img" src="image_product/${JP.p_img}"></td>
					<td>${JP.p_name}</td>
					<td>${JP.p_detail}</td>
					<td>${JP.p_price}</td>
					<td>${JP.m_id}</td>
					<td><button class="delete_button" p_id="${JP.p_id}">삭제</button>
						<button class="buyj_button" p_id="${JP.p_id}">구입하기</button>
					</td>
				</tr>
			</c:forEach>

			<tr>
				<td colspan="5">총 금액 ${jjim_sum}</td>
			</tr>

		</table>

	</div>


	<!-- <!-- 신고하기 팝업 -->
	<div id="main_report" class="popUp hidden">
		<form action="reportAction.do" method="post">
			<div id="trade_number"></div>
			<div id="trade_name"></div>
			<br> 신고 사유 :<select id="report_choice" name="rep_reason">
				<option value="본 제품과 다른 제품">본 제품과 다른 제품</option>
				<option value="배송지연">배송 지연</option>
				<option value="제품 불량">제품 불량</option>
				<option value="기타 사유">기타 사유</option>
			</select><br> 신고의 내용
			<textarea name="rep_content" id="rep_content"></textarea>
			<br> <input type="hidden" id="rep_memberId" name="rep_memberId"
				value=""> <input type="hidden" id="rep_writer"
				name="rep_writer" value=""> <input type="hidden"
				id="rep_productId" name="rep_productId" value=""> <input
				type="submit" id="rp_ok" value="신고 완료">
			<button type="submit">신고완료</button>
			<button type="reset">취소</button>
		</form>
	</div>




	<!-- 리뷰쓰기 팝업  -->
	<div id="review_pop" class="popUp hidden">
		<form action="reviewAction.do" method="post">
			<div id="rp_name"></div>
			<input type="hidden" id="rp_id" name="p_id" value=""> <br>
			평점 :<select id="r_score" name="r_score">
				<option value="1">1</option>
				<option value="2">2</option>
				<option value="3">3</option>
				<option value="4">4</option>
				<option value="4">5</option>
			</select><br> 신고의 내용
			<textarea name="r_content" id="r_content"></textarea>
			<br> <input type="submit" id="rp_ok1" value="작성 완료"> <input
				type="reset" value="취소">
		</form>
	</div>


</body>
</html>