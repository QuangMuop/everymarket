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
			����:		<input type="text" name="qna_title"/><br>
			����:		<textarea name="qna_contents" rows="6" cols="30"/></textarea><br>
			<input type="submit" value="�� �ۼ��ϱ�"/>
		</form>
	</div>
	
	<center><div>popup_qna</div></center>
	
</body>
</html>