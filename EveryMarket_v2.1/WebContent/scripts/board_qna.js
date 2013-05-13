$(document).ready(function(){		
	$(document).on('click', "#button_popupInsert", popUp_insertQna);
	$(document).on('click', ".answer_boardQna", popUp_answerQna);
	$(document).on('click', ".modify_boardQna", popUp_modifyQna);
	$(document).on('click', ".delete_boardQna", deleteQna);
	
	$(document).on('click', ".boardQna", toggleQnaContent);
	
	function popUp_insertQna(){ $("#insertBoardQna").bPopup(); }
	
	function popUp_answerQna(){
		$("#answerBoardQna").find("input[name='qna_id']").attr("value", $(this).attr("qna_id"));
		$("#answerBoardQna").bPopup();
	}
	
	function popUp_modifyQna(){
		boardQnaDwr.getBoardQnaByQna_id($(this).attr("qna_id"), function(data){
			$("#updateBoardQna").find("input[name='qna_title']").attr("value", data.qna_title);
		});		
		$("#updateBoardQna").find("input[name='qna_id']").attr("value", $(this).attr("qna_id"));
		$("#updateBoardQna").bPopup();
	}
	
	function deleteQna(){
		if(confirm("정말 삭제하시겠습니까?")){
			location.href="deleteQna.do?qna_id=" + $(this).attr("qna_id");
		}
	}
	
	function toggleQnaContent(){
		if($(this).find(".contents").css("display") == 'none'){
			$boardQna = $(this);
			boardQnaDwr.hitBoardQna($(this).attr("qna_id"), function(data){
				$boardQna.find(".qna_hitcount").append(
					"<span class='hidden'>" + data + "</span>"
				).find(".hidden").fadeIn(1000).end().find("span:eq(0)").remove();
			});
			$(".boardQna").not($(this)).find(".contents").slideUp();
			$(this).find(".contents").slideDown().end().find(".answer").fadeIn();
		}
	}
	
//	function refreshBoardQna(){
//		$.getJSON(
//			"http://localhost:8081/EveryMarket_v2.1/refreshQna.do",
//			function(data){
//				$.each(data.listBoardQna, function(index, boardQna){
//					var qna_regdate = (boardQna.qna_regdate.year + 1900) + "년 " +
//										(boardQna.qna_regdate.month + 1) + "월 " +
//										boardQna.qna_regdate.date + "일 " + 
//										boardQna.qna_regdate.hours + ":" +
//										boardQna.qna_regdate.minutes;
//					var boardHtml = "<div class='boardQna'>";
//						boardHtml += "<div class='narrow'>" + boardQna.qna_id + "</div>";
//						boardHtml += "<div class='widest'>" + boardQna.qna_title + "</div>";
//						boardHtml += "<div class='narrow'>" + boardQna.qna_writer + "</div>";
//						boardHtml += "<div class='narrow'>" + boardQna.qna_hitcount + "</div>";
//						boardHtml += "<div class='wide'>" + qna_regdate + "</div>";
//						boardHtml += "<div class='contents hidden'>" + boardQna.qna_contents;
//						
//						if(memberId == "aa"){
//							boardHtml += 'dddddddddddddddddddddddddddd';
//						}
//						
//						if(boardQna.qna_answer.length > 0){
//							boardHtml += "<div class='answer'>" + boardQna.qna_answer + "</div>";
//						}
//						
//						boardHtml += "</div></div>";
//					
//					$("#listBoardQna").append(boardHtml);
//				});
//				
//				
//				$(".contents").append("<button>내가쓴거야!</button>");
//			}
//		);
//	}
});