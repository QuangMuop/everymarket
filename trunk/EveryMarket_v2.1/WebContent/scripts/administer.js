$(document).ready(function(){
	callMemberList();
	
	$(".tab:eq(0)").click(tab_memberList);
	$(".tab:eq(1)").click(tab_boardReport);
	
	$(document).on('click', ".boardReport", toggleReportContents);
	$(document).on('change', "select", reportAction);
	
	$("#callMemberList").click(function(){ alert("���Ӹ�"); });
	
		/*memberList, boardReport �� ����*/	
		function tab_memberList(){
			callMemberList();
			$("#board_report").fadeOut("slow");
			$("#memberList").fadeIn("slow"); }
		function tab_boardReport(){
			callReportedList();
			$("#memberList").fadeOut("slow");
			$("#board_report").fadeIn("slow"); }
	
	function toggleReportContents(){
		$(".boardReport").not($(this)).find(".contents").slideUp();
		$(this).find(".contents").slideDown();
	}
	
	function reportAction(){
		var memberId = $(this).attr("m_id");
		var actionCode = $(this).val();
		
		boardReportDwr.test(memberId, actionCode);
	}
	
	function callMemberList(){
		$("#memberList table tr:gt(0)").remove();
		$.getJSON(
			"http://localhost:8081/EveryMarket_v2.1/callMemberList.do",
			function(data){
				$.each(data.listMember, function(index, member){
					$("#memberList > table").append(
						"<tr>" +
							"<td>" + member.m_id + "</td>" +
							"<td>" + member.m_pwd + "</td>" +
							"<td>" + member.m_nick + "</td>" +
							"<td>" + member.m_name + "</td>" +
							"<td>" + member.m_phone + "</td>" +
							"<td>" + member.m_cash + "</td>" +
							"<td>" + member.m_report + "</td>" +
							"<td>" + member.m_status + "</td>" +
						"</tr>");
				});
			}
		);
	}
	
	function callReportedList(){
		$("#board_report .list .boardReport").remove();
		$.getJSON(
			"http://localhost:8081/EveryMarket_v2.1/callReportedList.do",
			function(data){
				$.each(data.listReportedProduct, function(index, boardReport){
					var r_regdate = (boardReport.r_regdate.year + 1900) + "�� " +
									(boardReport.r_regdate.month + 1) + "�� " +
									boardReport.r_regdate.date + "�� " + 
									boardReport.r_regdate.hours + ":" +
									boardReport.r_regdate.minutes; 
					$("#reportedProductList").append(
						"<div class='boardReport'>" +
							"<div class='normal'>" + boardReport.r_reason + "</div>" +
							"<div class='normal'>" + boardReport.r_writer + "</div>" +
							"<div class='wide'>" + r_regdate + "</div>" +
							"<div class='normal'>" + boardReport.r_productId + 
								" (" + boardReport.r_memberId + ")</div>" +
							"<div class='contents hidden'>" + boardReport.r_contents + 
								"<select m_id='" + boardReport.r_memberId + "'>" +
									"<option value='0' selected='selected'>����</option>" +
									"<option value='1'>���系��1</option>" +
									"<option value='2'>���系��2</option>" +
									"<option value='3'>���系��3</option>" +
								"</select>"	+
							"</div>" +
						"</div>");
				});
				$.each(data.listReportedMember, function(index, boardReport){
					var r_regdate = (boardReport.r_regdate.year + 1900) + "�� " +
									(boardReport.r_regdate.month + 1) + "�� " +
									boardReport.r_regdate.date + "�� " + 
									boardReport.r_regdate.hours + ":" +
									boardReport.r_regdate.minutes;					
					$("#reportedMemberList").append(
						"<div class='boardReport'>" +
							"<div class='normal'>" + boardReport.r_reason + "</div>" +
							"<div class='normal'>" + boardReport.r_writer + "</div>" +
							"<div class='wide'>" + r_regdate + "</div>" +
							"<div class='normal'>" + boardReport.r_memberId + "</div>" +
							"<div class='contents hidden'>" + boardReport.r_contents +
								"<select m_id='" + boardReport.r_memberId + "'>" +
									"<option value='0' selected='selected'>����</option>" +
									"<option value='1'>���系��1</option>" +
									"<option value='2'>���系��2</option>" +
									"<option value='3'>���系��3</option>" +
								"</select>"	+
							"</div>" +
						"</div>");
				});
			}
		);
	}
});