$(document).ready(function() {

	var t_status = $("#t_status").attr("name");

	// 배송번호 입력했을때 db상태바꿔주는 것
	$("#dn_bt").click(function(event) {

		var db_nb = $("#dn_bt_nb").val();
		var t_id = $("#t_id").attr("value");

		tradeDwr.update_db_nb(db_nb, t_id);
	});

});

// 배송 팝업창
function db_pop() {

	var t_id = $("#t_id").attr("value");

	tradeDwr.update_status(t_id);
	window.open("view/popup_deliver.jsp", "배송조회",
			"width=450,height=300,resizalbe=no");

	$("#db_text").text("배송완료");

}