$(document).ready(function(){
	/*상수 구현부*/
	var contextUrl = "/EveryMarket_v2.1/";

	callMemberList();
	
	$("#admin_m1").click(showTab_memberList);
	$("#admin_m2").click(showTab_uncheckedList_report);
	$("#admin_m3").click(showTab_uncheckedList_tradeReport);
	$("#admin_m4").click(showTab_checkedList_report);
	$("#admin_m5").click(showTab_List_refund);
	$("#admin_m6").click(showTab_list_bannedMember);
	
	$(document).on('click', ".boardReport", toggleReportContents);
	$(document).on('change', ".boardReport select", reportAction);
	$(document).on('click', ".refund", confirmRefund);
	
		/*memberList, boardReport 탭 구현*/	
		function showTab_memberList(){
			callMemberList();
			$(".tabContent").hide();
			$("#memberList").fadeIn("slow");
		}
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
		function showTab_List_refund(){
			callList_refund();
			$(".tabContent").hide();
			$("#list_refund").fadeIn("slow"); }
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
		
		if(actionCode != '선택'){
			if(confirm("사용자 '" + rep_memberId + "'에 대한 처리를 확정하시겠습니까?")){
				boardReportDwr.reportAction(rep_id, actionCode);
				alert("처리되었습니다.");
				callUncheckedList_report();
			}
		}
	}
	
	function confirmRefund(){
		if(confirm("해당 환급건을 진행하시겠습니까?")){
			boardReportDwr.confirmRefund($(this).attr("ref_id"), function(){
				callList_refund();
			});
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
					var rep_regdate = (boardReport.rep_regdate.year + 1900) + "년 " +
									(boardReport.rep_regdate.month + 1) + "월 " +
									boardReport.rep_regdate.date + "일 " + 
									boardReport.rep_regdate.hours + ":" +
									boardReport.rep_regdate.minutes; 
					$("#reportedProductList").append(
						"<div class='boardReport'>" +
							"<div class='r_title_1'>" + boardReport.rep_reason + "</div>" +
							"<div class='r_title_2'>" + boardReport.rep_writer + "</div>" +
							"<div class='r_title_3'>" + rep_regdate + "</div>" +
							"<div class='r_title_4'>" + boardReport.rep_productId + 
								" (" + boardReport.rep_memberId + ")</div>" +
							"<div class='contents hidden' id='r_content'><a>" + boardReport.rep_content + 
								"</a><select class='r_select' rep_id='" + boardReport.rep_id +
										"' rep_memberId='" + boardReport.rep_memberId + "'>" +
									"<option selected='selected'>선택</option>" +
									"<option value='신고기각'>신고기각</option>" +
									"<option value='테스트용 : 20초'>테스트용 : 20초</option>" +
									"<option value='1일 사이트 접근 불허'>1일 사이트 접근 불허</option>" +
									"<option value='3일 사이트 접근 불허'>3일 사이트 접근 불허</option>" +
									"<option value='5일 사이트 접근 불허'>5일 사이트 접근 불허</option>" +
								"</select>"	+
							"</div>" +
						"</div>");
				});
				$.each(data.listReportedMember, function(index, boardReport){
					var rep_regdate = (boardReport.rep_regdate.year + 1900) + "년 " +
									(boardReport.rep_regdate.month + 1) + "월 " +
									boardReport.rep_regdate.date + "일 " + 
									boardReport.rep_regdate.hours + ":" +
									boardReport.rep_regdate.minutes;					
					$("#reportedMemberList").append(
						"<div class='boardReport'>" +
							"<div class='r_title_1'>" + boardReport.rep_reason + "</div>" +
							"<div class='r_title_2'>" + boardReport.rep_writer + "</div>" +
							"<div class='r_title_3'>" + rep_regdate + "</div>" +
							"<div class='r_title_4'>" + boardReport.rep_memberId + "</div>" +
							"<div class='contents hidden' id='r_content'><a>" + boardReport.rep_content +
								"</a><select  class='r_select' rep_id='" + boardReport.rep_id +
										"' rep_memberId='" + boardReport.rep_memberId + "'>" +
									"<option selected='selected'>선택</option>" +
									"<option value='신고기각'>신고기각</option>" +
									"<option value='테스트용 : 20초'>테스트용 : 20초</option>" +
									"<option value='1일 사이트 접근 불허'>1일 사이트 접근 불허</option>" +
									"<option value='3일 사이트 접근 불허'>3일 사이트 접근 불허</option>" +
									"<option value='5일 사이트 접근 불허'>5일 사이트 접근 불허</option>" +
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
					var rep_checkTime = (boardReport.rep_checkTime.year + 1900) + "년 " +
										(boardReport.rep_checkTime.month + 1) + "월 " +
										boardReport.rep_checkTime.date + "일 " + 
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
	
	function callList_refund(){
		$("#list_refund .list .refund").remove();
		$.getJSON(
			contextUrl + "callListRefund.do",
			function(data){
				$("#totalFee .data").html(data.totalFee);
				
				$.each(data.uncheckedRefundList, function(index, refund){
					var requestDate = (refund.ref_requestDate.year + 1900) + "년 " +
										(refund.ref_requestDate.month + 1) + "월 " +
										refund.ref_requestDate.date + "일 ";
					$("#uncheckedRefundList").append(
						"<div class='refund' ref_id='" + refund.ref_id + "'>" +
							"<div class='r_title_5'>" + refund.m_id + "</div>" +
							"<div class='r_title_5'>" + 
								(refund.ref_refundAmount + refund.ref_refundFee) + 
							"</div>" +
							"<div class='r_title_5'>" + refund.ref_refundFee + "</div>" +
							"<div class='r_title_5'>" + refund.ref_bankName + "</div>" +
							"<div class='r_title_5'>" + refund.ref_account + "</div>" +
							"<div class='r_title_5'>" + refund.ref_accountName + "</div>" +
							"<div class='r_title_5'>" + requestDate + "</div>" +
						"</div>"
					);
				});
				
				$.each(data.checkedRefundList, function(index, refund){
					var refundDate = (refund.ref_refundDate.year + 1900) + "년 " +
										(refund.ref_refundDate.month + 1) + "월 " +
										refund.ref_refundDate.date + "일 ";
					$("#checkedRefundList").append(
						"<div class='refund'>" +
							"<div class='r_title_5'>" + refund.m_id + "</div>" +
							"<div class='r_title_5'>" + refund.ref_refundAmount + "</div>" +
							"<div class='r_title_5'>" + refund.ref_refundFee + "</div>" +
							"<div class='r_title_5'>" + refund.ref_bankName + "</div>" +
							"<div class='r_title_5'>" + refund.ref_account + "</div>" +
							"<div class='r_title_5'>" + refund.ref_accountName + "</div>" +
							"<div class='r_title_5'>" + refundDate + "</div>" +
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
					var judgeTime = (bannedMember.judgeTime.year + 1900) + "년 " +
									(bannedMember.judgeTime.month + 1) + "월 " +
									bannedMember.judgeTime.date + "일 " + 
									bannedMember.judgeTime.hours + ":" +
									bannedMember.judgeTime.minutes;
					var releaseTime = (bannedMember.releaseTime.year + 1900) + "년 " +
									(bannedMember.releaseTime.month + 1) + "월 " +
									bannedMember.releaseTime.date + "일 " + 
									bannedMember.releaseTime.hours + ":" +
									bannedMember.releaseTime.minutes;
					$("#bannedMemberList").append(
						"<div class='bannedMember'>" +
							"<div class='r_title_2'>" + bannedMember.m_id + "</div>" +
							"<div class='r_title_2'>" + bannedMember.m_name + "</div>" +
							"<div class='r_title_3'>" + bannedMember.rep_reason + "</div>" +
							"<div class='r_title_3'>" + judgeTime + "</div>" +
							"<div class='r_title_3'>" + releaseTime + "</div>" +
							"<div class='r_title_2'>" + bannedMember.m_report + "</div>" +
						"</div>"
					);
				});
			}
		);
	}
	
//	admintab
	$("#admin_tab_bar > span").click(function(e){
		switch(e.target.id){
			case "admin_m1":
				//change status & style menu
				$("#admin_m1").addClass("actived");
				$("#admin_m1").html(
					"<img id='admin_m1' class='admin_bar_img' src='image_board/admin_bar1.png'>"	
				);
				$("#admin_m2").removeClass("actived");
				$("#admin_m2").html(
					"<img id='admin_m2' class='admin_bar_img' src='image_board/admin_bar2_back.png'>"	
						);
				$("#admin_m3").removeClass("actived");
				$("#admin_m3").html(
						"<img id='admin_m3' class='admin_bar_img' src='image_board/admin_bar3_back.png'>"
						);
				$("#admin_m4").removeClass("actived");
				$("#admin_m4").html(
						"<img id='admin_m4' class='admin_bar_img' src='image_board/admin_bar4_back.png'>"	
						);
				$("#admin_m6").removeClass("actived");
				$("#admin_m6").html(
						"<img id='admin_m6' class='admin_bar_img' src='image_board/admin_bar5_back.png'>"	
						);
				//display selected division, hide others
	
			break;
			case "admin_m2":
				//change status & style menu
				$("#admin_m1").removeClass("actived");
				$("#admin_m1").html(
						"<img id='admin_m1' class='admin_bar_img' src='image_board/admin_bar1_back.png'>"
						);
				$("#admin_m2").addClass("actived");
				$("#admin_m2").html(
						"<img id='admin_m2' class='admin_bar_img' src='image_board/admin_bar2.png'>"
						);
				$("#admin_m3").removeClass("actived");
				$("#admin_m3").html(
						"<img id='admin_m3' class='admin_bar_img' src='image_board/admin_bar3_back.png'>"
						);
				$("#admin_m4").removeClass("actived");
				$("#admin_m4").html(
						"<img id='admin_m4' class='admin_bar_img' src='image_board/admin_bar4_back.png'>"
						);
				$("#admin_m6").removeClass("actived");
				$("#admin_m6").html(
						"<img id='admin_m6' class='admin_bar_img' src='image_board/admin_bar5_back.png'>"
						);
				//display selected division, hide others

			break;
			case "admin_m3":
				//change status & style menu
				$("#admin_m1").removeClass("actived");
				$("#admin_m1").html(
						"<img id='admin_m1' class='admin_bar_img' src='image_board/admin_bar1_back.png'>"
						);
				$("#admin_m2").removeClass("actived");
				$("#admin_m2").html(
						"<img id='admin_m2' class='admin_bar_img' src='image_board/admin_bar2_back.png'>"
						);
				$("#admin_m3").addClass("actived");
				$("#admin_m3").html(
						"<img id='admin_m3' class='admin_bar_img' src='image_board/admin_bar3.png'>"
						);
				$("#admin_m4").removeClass("actived");
				$("#admin_m4").html(
						"<img id='admin_m4' class='admin_bar_img' src='image_board/admin_bar4_back.png'>"	
						);
				$("#admin_m6").removeClass("actived");
				$("#admin_m6").html(
						"<img id='admin_m6' class='admin_bar_img' src='image_board/admin_bar5_back.png'>"	
						);

			break;
			case "admin_m4":
				//change status & style menu
				$("#admin_m1").removeClass("actived");
				$("#admin_m1").html(
						"<img id='admin_m1' class='admin_bar_img' src='image_board/admin_bar1_back.png'>"
						);
				$("#admin_m2").removeClass("actived");
				$("#admin_m2").html(
						"<img id='admin_m2' class='admin_bar_img' src='image_board/admin_bar2_back.png'>"
						);
				$("#admin_m3").removeClass("actived");
				$("#admin_m3").html(
						"<img id='admin_m3' class='admin_bar_img' src='image_board/admin_bar3_back.png'>"
						);
				$("#admin_m4").addClass("actived");
				$("#admin_m4").html(
						"<img id='admin_m4' class='admin_bar_img' src='image_board/admin_bar4.png'>"
						);
				$("#admin_m6").removeClass("actived");
				$("#admin_m6").html(
						"<img id='admin_m6' class='admin_bar_img' src='image_board/admin_bar5_back.png'>"	
						);

			break;
			case "admin_m6":
				//change status & style menu
				$("#admin_m1").removeClass("actived");
				$("#admin_m1").html(
						"<img id='admin_m1' class='admin_bar_img' src='image_board/admin_bar1_back.png'>"
						);
				$("#admin_m2").removeClass("actived");
				$("#admin_m2").html(
						"<img id='admin_m2' class='admin_bar_img' src='image_board/admin_bar2_back.png'>"
						);
				$("#admin_m3").removeClass("actived");
				$("#admin_m3").html(
						"<img id='admin_m3' class='admin_bar_img' src='image_board/admin_bar3_back.png'>"
						);
				$("#admin_m4").removeClass("actived");
				$("#admin_m4").html(
						"<img id='admin_m4' class='admin_bar_img' src='image_board/admin_bar4_back.png'>"
						);
				$("#admin_m6").addClass("actived");
				$("#admin_m6").html(
						"<img id='admin_m6' class='admin_bar_img' src='image_board/admin_bar5.png'>"
						);
	
			break;
			
			
		}

		return false;
	});
	
});