<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="./scripts/board_qna.js" type="text/javascript"></script>
</head>
<body>
	
	<div id="insertBoardQna" class="hidden">
		<h2>글쓰기 폼</h2>
		<form action="insertQna.do" method="post">
			제목:		<input type="text" name="qna_title"><br>
			내용:		<textarea name="qna_contents" rows="6" cols="30"/></textarea><br>
			<input type="submit" value="글 작성하기">
		</form>
	</div>
	
	<div id="answerBoardQna" class="hidden">
		<h2>답변 폼</h2>
		<form action="answerQna.do" method="post">
			내용:		<textarea name="qna_answer" rows="6" cols="30"></textarea><br>
			<input type="hidden" name="qna_id" value="">
			<input type="submit" value="답변하기">		
		</form>
	</div>
	
	<div id="updateBoardQna" class="hidden">
		<h2>글 수정 폼</h2>
		<form action="updateQna.do" method="post">
			제목:		<input type="text" name="qna_title" readonly="readonly"><br>
			내용:		<textarea name="qna_contents" rows="6" cols="30"></textarea><br>
			<input type="hidden" name="qna_id" value="">
			<input type="submit" value="수정하기"/>		
		</form>
	</div>
	
	<center><div>popup_qna</div></center>
	
</body>
</html>