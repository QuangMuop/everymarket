$(document).ready(function(){
	$("#goAdminister").click(goAdminister);
	$("#goQnaBoard").click(goQnaBoard);	
	
	/*�����ڸ�� / QnA�Խ��� �̵� ���*/
	function goAdminister(){ location.href="administer.go"; }
	function goQnaBoard(){ location.href="qnaBoard.go"; }

});