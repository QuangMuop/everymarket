<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style type="text/css">
*{
	padding: 0px;
	margin: 0px;
}
img{
	position: absolute;
}
#deliveryTruck{
	width: 150px;
	height: 75px;
	top: 275px;
	left: 50px;
	z-index: 100;
}
.background{
	width: 800px;
	height: 420px;
	z-index: 10;
}
</style>
<script src="../scripts/lib/jquery-1.9.1.min.js" type="text/javascript"></script>
<script type="text/javascript">
$(document).ready(function(){
	$(".background").animate({ 'top': '-10px' }, 1000)
	.delay(500).animate({ 'top': '0px' }, 1000).delay(500);
	
	setInterval(function(){
		$(".background").animate({ 'top': '-10px' }, 1000)
		.delay(500).animate({ 'top': '0px' }, 1000).delay(500);		
	}, 3000);	
	
	$("#deliveryTruck").animate({ 'top': '260px', 'left': '150px' }, 1500)
		.animate({ 'top': '290px', 'left': '250px' }, 1500)
		.animate({ 'top': '275px', 'left': '350px' }, 1500)
		.animate({ 'top': '290px', 'left': '450px' }, 1500)
		.animate({ 'top': '275px', 'left': '550px' }, 1500, function(){
			var t_id = $("#deliveryTruck").attr("t_id");
		
			$("#" + t_id + "3", opener.document).text("배송완료");
			$(".db_trace[t_id="+t_id+"]", opener.document).addClass("none");
			
			$(".bl[t_id='"+t_id+"'] .td_db_trace", opener.document).append(
				'<input type="button" id="accept"  t_id='+t_id+' value="수취확인" />' +
				'<input id="report" type="button"  t_id='+t_id+'  value="신고하기" />'
			);
		
			close();
		}
	);
});
</script>
</head>
<body>
	<img id="deliveryTruck" t_id="${param.t_id }" src="../images/truck.PNG">
	<img class="background" src="../images/transport_background_1.png">
</body>
</html>