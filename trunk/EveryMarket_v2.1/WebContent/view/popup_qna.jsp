<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="./scripts/board_qna.js" type="text/javascript"></script>
</head>
<body>
	
	<div id="insertBoardQna" class="hidden">
		<h2>�۾��� ��</h2>
		<form action="insertQna.do" method="post">
			����:		<input type="text" name="qna_title"><br>
			����:		<textarea name="qna_contents" rows="6" cols="30"/></textarea><br>
			<input type="submit" value="�� �ۼ��ϱ�">
		</form>
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
			����:		<textarea name="qna_contents" rows="6" cols="30"></textarea><br>
			<input type="hidden" name="qna_id" value="">
			<input type="submit" value="�����ϱ�"/>		
		</form>
	</div>
	
	<center><div>popup_qna</div></center>
	
</body>
</html>