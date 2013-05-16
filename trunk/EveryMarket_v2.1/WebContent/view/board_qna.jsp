<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="./styles/board_qna.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<center>
<div id="qna_body">
	<div id="qna_title">
		<img alt="" id="qna_title_img" src="image_board/qna_title.png">
		<img alt="" id="qna_title_plus_img" src="image_board/qna_title_plus.png">
	</div>
	<div id="listBoardQna">
		<table id="qna_table">
			<colgroup>
				<col width="15%">
				<col width="45%">
				<col width="15%">
				<col width="10%">
				<col width="25%">
			</colgroup>		
			<tr>
				<th>글번호</th>
				<th>글제목</th>
				<th>작성자</th>
				<th>조회수</th>
				<th>등록일</th>
			</tr>
		</table>

		<c:forEach var="boardQna" items="${listBoardQna }">
			<div class="boardQna" qna_id="${boardQna.qna_id }">
				<a id="qna1">${boardQna.qna_id }</a>
				<a id="qna2">${boardQna.qna_title }</a>
				<a id="qna3">${boardQna.qna_writer }</a>
				<a id="qna4"><span class="data">${boardQna.qna_hitcount }</span></a>
				<a id="qna5">${boardQna.qna_regdate }</a>
				<div class="contents hidden">
					<div id="qna_content">${boardQna.qna_content }
						<c:if test="${member.m_id == boardQna.qna_writer }">
							<div>
							<button class="modify_boardQna" id="update_btn" qna_id="${boardQna.qna_id }">
								<img alt="" id="update_btn_img" src="image_board/update_btn.png">
							</button>
							<button class="delete_boardQna" id="delete_btn" qna_id="${boardQna.qna_id }">
								<img alt="" id="delete_btn_img" src="image_board/delete_btn.png">
							</button>
							</div>
						</c:if>
						<c:if test="${member.m_id == 'admin' }">
						<div>
							<button class="answer_boardQna"  id="answer_btn" qna_id="${boardQna.qna_id }">
								<img alt=""  id="answer_btn_img" src="image_board/answer_btn.png">
							</button>
							<button class="delete_boardQna" id="delete_btn"  qna_id="${boardQna.qna_id }">
								<img alt="" id="delete_btn_img" src="image_board/delete_btn.png">
							</button>
						</div>		
					</c:if>
					</div>
					<c:if test="${boardQna.qna_answer != null }">
					<a class="answer" id="qna_answer">
							관리자 답변 : ${boardQna.qna_answer }
					</a>
					</c:if>
					
					
				</div>
			</div>
		</c:forEach>
	</div>
	
	<c:if test="${member != null && member.m_id != 'admin'}">
		<div>
			<button id="button_popupInsert">
				<img alt="" id="q_i_btn" src="image_board/qna_insert_btn.png">
			</button>
		</div>
	</c:if>
</div>
</center>
</body>
</html>