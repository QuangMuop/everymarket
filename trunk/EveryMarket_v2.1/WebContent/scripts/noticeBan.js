$(document).ready(function(){
	
	var remainingTime = Number($("#counter").attr("remainingTime"));

	$('#counter').timeTo({
		seconds: remainingTime,
	    theme: "black",
	    displayCaptions: true,
	    fontSize: 48,
	    captionSize: 14,
	    callback: releaseBan
	});
	
	function releaseBan(){
		$("#noticeBan_lower").slideUp(1000);
		$("#noticeBan_tryLogin").fadeIn(3000);
		
		setInterval(function(){
			$("#noticeBan_tryLogin").append(".");
		}, 1000);
		
		setTimeout(function(){
			location.href="login.do?" +
				"m_id=" + $("#triedInfo").attr("m_id") + "&" +
				"m_pwd=" + $("#triedInfo").attr("m_pwd");
		}, 6000);
	}
	
});