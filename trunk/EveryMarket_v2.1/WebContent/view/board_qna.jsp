<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="./styles/board_qna.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<center>

	<div id="listBoardQna">
		<div id="listBoardQna_head">
			<div class="narrow">글번호</div>
			<div class="widest">글제목</div>
			<div class="narrow">작성자</div>
			<div class="narrow">조회수</div>
			<div class="wide">등록일</div>
		</div>
		<c:forEach var="boardQna" items="${listBoardQna }">
			<div class="boardQna">
				<div class="narrow">${boardQna.qna_id }</div>
				<div class="widest">${boardQna.qna_title }</div>
				<div class="narrow">${boardQna.qna_writer }</div>
				<div class="narrow">${boardQna.qna_hitcount }</div>
				<div class="wide">${boardQna.qna_regdate }</div>
				<div class="contents hidden">
					${boardQna.qna_contents }
					<c:if test="${boardQna.qna_answer != null }">
						<div class="answer">
							<p>replied by Admin :</p>
							${boardQna.qna_answer }
						</div>
					</c:if>
					<c:if test="${member.m_id == boardQna.qna_writer }">
						<div>
							<button class="modify_boardQna" qna_id="${boardQna.qna_id }">글 수정하기</button>
							<button class="delete_boardQna" qna_id="${boardQna.qna_id }">글 삭제하기</button>
						</div>
					</c:if>
					<c:if test="${member.m_id == 'aa' }">
						<div>
							<button class="answer_boardQna" qna_id="${boardQna.qna_id }">답변하기</button>
							<button class="delete_boardQna" qna_id="${boardQna.qna_id }">글 삭제하기</button>
						</div>		
					</c:if>
				</div>
			</div>
		</c:forEach>
	</div>
	
	<c:if test="${member != null }">
		<div>
			<button id="button_popupInsert">글 작성하기</button>
		</div>
	</c:if>

</center>
</body>
</html>