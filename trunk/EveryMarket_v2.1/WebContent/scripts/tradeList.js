$(document).ready(function() {

	var t_status = $("#t_status").attr("name");

	// ��۹�ȣ �Է������� db���¹ٲ��ִ� ��
	$("#dn_bt").click(function(event) {

		var db_nb = $("#dn_bt_nb").val();
		var t_id = $("#t_id").attr("value");

		tradeDwr.update_db_nb(db_nb, t_id);
	});

});

// ��� �˾�â
function db_pop() {

	var t_id = $("#t_id").attr("value");

	tradeDwr.update_status(t_id);
	window.open("view/popup_deliver.jsp", "�����ȸ",
			"width=450,height=300,resizalbe=no");

	$("#db_text").text("��ۿϷ�");

}