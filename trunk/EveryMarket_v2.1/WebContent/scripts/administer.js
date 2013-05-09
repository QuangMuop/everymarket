$(document).ready(function(){
	/*��� ������*/
	var contextUrl = "/EveryMarket_v2.1/";

	callMemberList();
	
	$(".button_tab:eq(0)").click(showTab_memberList);
	$(".button_tab:eq(1)").click(showTab_uncheckedList_report);
	$(".button_tab:eq(2)").click(showTab_uncheckedList_tradeReport);
	$(".button_tab:eq(3)").click(showTab_checkedList_report);
	$(".button_tab:eq(4)").click(showTab_list_bannedMember);
	
	$(document).on('click', ".boardReport", toggleReportContents);
	$(document).on('change', ".boardReport select", reportAction);
	
	$("#callMemberList").click(function(){ alert("���Ӹ�"); });
	
		/*memberList, boardReport �� ����*/	
		function showTab_memberList(){
			callMemberList();
			$(".tabContent").hide();
			$("#memberList").fadeIn("slow"); }
		function showTab_uncheckedList_report(){
			callUncheckedList_report();
			$(".tabContent").hide();
			$("#uncheckedList_report").fadeIn("slow"); }
		function showTab_uncheckedList_tradeReport(){
//			callUncheckedList_tradeReport();
			$(".tabContent").hide();
			$("#uncheckedList_tradeReport").fadeIn("slow"); }
		function showTab_checkedList_report(){
			callCheckedList_report();
			$(".tabContent").hide();
			$("#checkedList_report").fadeIn("slow"); }
		function showTab_list_bannedMember(){
			callList_bannedMember();
			$(".tabContent").hide();
			$("#list_bannedMember").fadeIn("slow"); }
	
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
				callUncheckedList_report();
			}
		}
	}
	
	function callMemberList(){
		$("#memberList table tr:gt(0)").remove();
		$.getJSON(
			contextUrl + "callMemberList.do",
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
	
	function callUncheckedList_report(){
		$("#uncheckedList_report .list .boardReport").remove();
		$.getJSON(
			contextUrl + "callReportedList.do",
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
									"<option value='�Ű�Ⱒ'>�Ű�Ⱒ</option>" +
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
									"<option value='�Ű�Ⱒ'>�Ű�Ⱒ</option>" +
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
	
	function callUncheckedList_tradeReport(){
		$.getJSON(
			contextUrl + "",
			function(data){
				
			}
		);
	}
	
	function callCheckedList_report(){
		$("#checkedList_report .list .boardReport").remove();
		$.getJSON(
			contextUrl + "callCheckedReportList.do",
			function(data){
				$.each(data.listCheckedReportList, function(index, boardReport){
					var rep_checkTime = (boardReport.rep_checkTime.year + 1900) + "�� " +
										(boardReport.rep_checkTime.month + 1) + "�� " +
										boardReport.rep_checkTime.date + "�� " + 
										boardReport.rep_checkTime.hours + ":" +
										boardReport.rep_checkTime.minutes;
					$("#checkedReportList").append(
						"<div class='boardReport'>" +
							"<div class='normal'>" + boardReport.rep_id + "</div>" +
							"<div class='wide'>" + rep_checkTime + "</div>" +
							"<div class='normal'>" + boardReport.rep_memberId + "</div>" +
							"<div class='wide'>" + boardReport.rep_check + "</div>" +
						"</div>"
					);
				});
			}
		);
	}
	
	function callList_bannedMember(){
		$("#list_bannedMember .list .bannedMember").remove();
		$.getJSON(
			contextUrl + "callListBannedMember.do",
			function(data){
				$.each(data.listBannedMemberList, function(index, bannedMember){
					var judgeTime = (bannedMember.judgeTime.year + 1900) + "�� " +
									(bannedMember.judgeTime.month + 1) + "�� " +
									bannedMember.judgeTime.date + "�� " + 
									bannedMember.judgeTime.hours + ":" +
									bannedMember.judgeTime.minutes;
					var releaseTime = (bannedMember.releaseTime.year + 1900) + "�� " +
									(bannedMember.releaseTime.month + 1) + "�� " +
									bannedMember.releaseTime.date + "�� " + 
									bannedMember.releaseTime.hours + ":" +
									bannedMember.releaseTime.minutes;
					$("#bannedMemberList").append(
						"<div class='bannedMember'>" +
							"<div class='normal'>" + bannedMember.m_id + "</div>" +
							"<div class='normal'>" + bannedMember.m_name + "</div>" +
							"<div class='wide'>" + bannedMember.rep_reason + "</div>" +
							"<div class='wide'>" + judgeTime + "</div>" +
							"<div class='wide'>" + releaseTime + "</div>" +
							"<div class='normal'>" + bannedMember.m_report + "</div>" +
						"</div>"
					);
				});
			}
		);
	}
});