$(document).ready(function() {

	var t_status = $("#t_status").attr("name");

	// ��۹�ȣ �Է������� db���¹ٲ��ִ� ��
	$(".dn_bt").click(function(event) {

		var t_id = $(this).attr("t_id");

		var db_nb = $(".dn_bt_nb").val();

		// db trade status�ٲ��ְ�
		tradeDwr.update_db_nb(db_nb, t_id);
		
		location.href(trade_list);
				
	/*	var html = '<input class="db_trace" type="button" value="�������" onclick="db_pop()" />';
		
		
		$("#status2_text").html("�����");
		$("#status1_text").html(html);*/


	});

});

// ��� �˾�â
function db_pop() {

	var t_id = $("#t_id").attr("value");

	tradeDwr.update_status(t_id);
	window.open("view/popup_deliver.jsp", "�����ȸ",
			"width=450,height=300,resizalbe=no");

	/*$("#status2_text").html("��ۿϷ�");*/
	$("#db_text").text("��ۿϷ�");

}