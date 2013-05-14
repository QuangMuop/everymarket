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
			����:		<input type="text" name="qna_title"><br>
			</div>
			<div id="insert_q_content">
			<textarea name="qna_content" id="i_q_c_text" rows="6" cols="30" placeholder="���ͳ��� �츮�� �Բ� ������ ������ �����Դϴ�. �� �ۼ� ��  Ÿ�ο� ���� ����� å���� ����ּ���."/></textarea>
			</div>
			<div id="q_c_input_btn">
				<img alt="" id="q_c_img" src="image_board/q_c_input.png">
				<input type="submit" id="q_c_i_input" value="">
			</div>
		</form>
		</div>
	</div>
	
	<div id="answerBoardQna" class="hidden">
		<h2>�亯 ��</h2>
		<form action="answerQna.do" method="post">
			����:		<textarea name="qna_answer" rows="6" cols="30"></textarea><br>
			<input type="hidden" name="qna_id" value="">
			<input type="submit" value="�亯�ϱ�">		
		</form>
	</div>
	
	<div id="updateBoardQna" class="hidden">
		<h2>�� ���� ��</h2>
		<form action="updateQna.do" method="post">
			����:		<input type="text" name="qna_title" readonly="readonly"><br>
			����:		<textarea name="qna_content" rows="6" cols="30"></textarea><br>
			<input type="hidden" name="qna_id" value="">
			<input type="submit" value="�����ϱ�"/>		
		</form>
	</div>
	
</body>
</html>