<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="./scripts/board_qna.js" type="text/javascript"></script>
</head>
<body>
	
	<div id="insertBoardQna" class="hidden">
		<div id="qna_insert_inner">
		<img alt="" id="qna_insert_title" src="image_board/qna_insert_title.png">
		<form action="insertQna.do" method="post">
			<div id="insert_title">
			제목:		<input type="text" name="qna_title"><br>
			</div>
			<div id="insert_q_content">
			<textarea name="qna_content" id="i_q_c_text" rows="6" cols="30" placeholder="인터넷은 우리가 함께 만들어가는 소중한 공간입니다. 글 작성 시  타인에 대한 배려와 책임을 담아주세요."/></textarea>
			</div>
			<div id="q_c_input_btn">
				<img alt="" id="q_c_img" src="image_board/q_c_input.png">
				<input type="submit" class="q_a_input" value="">
			</div>
		</form>
		</div>
	</div>
	
	<div id="answerBoardQna" class="hidden">
	<div id="qna_insert_inner">
		<img alt=""  id="answer_btn_img" src="image_board/answer_btn.png">
		<form action="answerQna.do" method="post">
			<textarea name="qna_answer" rows="6" cols="30" class="q_a_text" placeholder="답변을 달아주세요"></textarea><br>
			<input type="hidden" name="qna_id" value="">
			<input type="submit" class="q_a_input" value="답변하기">		
		</form> 
	</div>
	</div>
	
	<div id="updateBoardQna" class="hidden">
	<div id="qna_insert_inner">
		<img alt="" id="update_btn_img" src="image_board/update_btn.png">
		<form action="updateQna.do" method="post">
			<div id="insert_title">
			제목:		<input type="text" name="qna_title" readonly="readonly">
			</div>
			<textarea name="qna_content" rows="6" cols="30" class="q_a_text" placeholder="인터넷은 우리가 함께 만들어가는 소중한 공간입니다. 글 작성 시  타인에 대한 배려와 책임을 담아주세요."></textarea><br>
			<input type="hidden" name="qna_id" value="">
			<input type="submit"class="q_a_input"  value="수정하기"/>		
		</form>
	</div>
	</div>
	
</body>
</html>