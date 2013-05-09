$(document).ready(function(){
	callMemberList();
	
	$(".tab:eq(0)").click(tab_memberList);
	$(".tab:eq(1)").click(tab_boardReport);
	
	$(document).on('click', ".boardReport", toggleReportContents);
	$(document).on('change', ".boardReport select", reportAction);
	
	$("#callMemberList").click(function(){ alert("���Ӹ�"); });
	
		/*memberList, boardReport �� ����*/	
		function tab_memberList(){
			callMemberList();
			$("#board_report").hide();
			$("#memberList").fadeIn("slow"); }
		function tab_boardReport(){
			callReportedList();
			$("#memberList").hide();
			$("#board_report").fadeIn("slow"); }
	
	function toggleReportContents(){
		$(".boardReport").not($(this)).find(".contents").slideUp();
		$(this).find(".contents").slideDown();
	}
	
	function reportAction(){
		var rep_id = $(this).attr("rep_id");
		var rep_memberId = $(this).attr("rep_memberId");
		var actionCode = $(this).val();
		
		if(actionCode != '����'){
			if(confirm("����� '" + rep_memberId + "'�� ���� ó���� Ȯ���Ͻðڽ��ϱ�?")){
				boardReportDwr.reportAction(rep_id, actionCode);
				alert("ó���Ǿ����ϴ�.");
				callReportedList();
			}
		}
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
					var rep_regdate = (boardReport.rep_regdate.year + 1900) + "�� " +
									(boardReport.rep_regdate.month + 1) + "�� " +
									boardReport.rep_regdate.date + "�� " + 
									boardReport.rep_regdate.hours + ":" +
									boardReport.rep_regdate.minutes; 
					$("#reportedProductList").append(
						"<div class='boardReport'>" +
							"<div class='normal'>" + boardReport.rep_reason + "</div>" +
							"<div class='normal'>" + boardReport.rep_writer + "</div>" +
							"<div class='wide'>" + rep_regdate + "</div>" +
							"<div class='normal'>" + boardReport.rep_productId + 
								" (" + boardReport.rep_memberId + ")</div>" +
							"<div class='contents hidden'>" + boardReport.rep_content + 
								"<select rep_id='" + boardReport.rep_id +
										"' rep_memberId='" + boardReport.rep_memberId + "'>" +
									"<option selected='selected'>����</option>" +
									"<option value='�׽�Ʈ�� : 20��'>�׽�Ʈ�� : 20��</option>" +
									"<option value='1�� ����Ʈ ���� ����'>1�� ����Ʈ ���� ����</option>" +
									"<option value='3�� ����Ʈ ���� ����'>3�� ����Ʈ ���� ����</option>" +
									"<option value='5�� ����Ʈ ���� ����'>5�� ����Ʈ ���� ����</option>" +
								"</select>"	+
							"</div>" +
						"</div>");
				});
				$.each(data.listReportedMember, function(index, boardReport){
					var rep_regdate = (boardReport.rep_regdate.year + 1900) + "�� " +
									(boardReport.rep_regdate.month + 1) + "�� " +
									boardReport.rep_regdate.date + "�� " + 
									boardReport.rep_regdate.hours + ":" +
									boardReport.rep_regdate.minutes;					
					$("#reportedMemberList").append(
						"<div class='boardReport'>" +
							"<div class='normal'>" + boardReport.rep_reason + "</div>" +
							"<div class='normal'>" + boardReport.rep_writer + "</div>" +
							"<div class='wide'>" + rep_regdate + "</div>" +
							"<div class='normal'>" + boardReport.rep_memberId + "</div>" +
							"<div class='contents hidden'>" + boardReport.rep_content +
								"<select rep_id='" + boardReport.rep_id +
										"' rep_memberId='" + boardReport.rep_memberId + "'>" +
									"<option selected='selected'>����</option>" +
									"<option value='�׽�Ʈ�� : 20��'>�׽�Ʈ�� : 20��</option>" +
									"<option value='1�� ����Ʈ ���� ����'>1�� ����Ʈ ���� ����</option>" +
									"<option value='3�� ����Ʈ ���� ����'>3�� ����Ʈ ���� ����</option>" +
									"<option value='5�� ����Ʈ ���� ����'>5�� ����Ʈ ���� ����</option>" +
								"</select>"	+
							"</div>" +
						"</div>");
				});
			}
		);
	}
});