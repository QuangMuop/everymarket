$(document).ready(function(){
	$("#goAdminister").click(goAdminister);
	$("#goQnaBoard").click(goQnaBoard);	
	
	/*관리자모드 / QnA게시판 이동 펑션*/
	function goAdminister(){ location.href="administer.go"; }
	function goQnaBoard(){ location.href="qnaBoard.go"; }

});