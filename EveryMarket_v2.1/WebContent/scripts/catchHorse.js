$(document).ready(function(){
	/*��� ������*/
	var eventDice = getRandomInt(1, 12); 
	
	/*eventDice�� ���� �̺�Ʈ��� ����*/
	event_generateHorse(eventDice);
	
	/*�ּҰ��� �ִ밪���� ������ int�� ���ϱ�*/
	function getRandomInt (min, max) { return Math.floor(Math.random() * (max - min + 1)) + min; }
	
	/*������ int���� ���� ��� ���� �� ��ġ ����*/
	function event_generateHorse(eventDice){
		$("#indivMarketWrapper").append(
			"<img id='eventCoin' class='hidden' src=images/smarket/coin.png>"
		);
		
		var top, left;
		
		if(eventDice == 1){
			appendingHorse("top");
			
			top = $("#h_menu").offset().top - 50;
			left = getRandomInt(
					$("#h_logo").offset().left - 125,
					$("#h_logo").offset().left - 55);
		}else if(eventDice == 2){
			appendingHorse("top");
			
			top = $("#h_menu").offset().top - 50;
			left = $("#h_logo").offset().left + $("#h_logo").outerWidth() + 20;
		}else if(eventDice == 3){
			appendingHorse("top");
			
			top = $("#h_menu").offset().top - 50;
			left = getRandomInt(
					$("#h_searchbar").offset().left + $("#h_searchbar").outerWidth(),
					$("#h_searchbar").offset().left + $("#h_searchbar").outerWidth() + 150);
		}else if(eventDice == 4){
			appendingHorse("top");
			
			top = $("#blog_b_thumb").offset().top + $("#blog_b_thumb").height() - 50;
			left = getRandomInt(
					$("#b_s_line").offset().left + 15,
					$("#b_s_line").offset().left + $("#b_s_line").width() -65);
		}else if(eventDice == 5){
			appendingHorse("left");
			
			top = getRandomInt(
					$("#h_menu").offset().top + 15,
					$("#blog_b_thumb").offset().top + $("#blog_b_thumb").height() - 65);
			left = $("#blog_b_thumb").offset().left - 50;
		}else if(eventDice == 6){
			appendingHorse("right");
			
			top = getRandomInt(
					$("#h_menu").offset().top + 15,
					$("#blog_b_thumb").offset().top + $("#blog_b_thumb").height() - 65);
			left = $("#blog_b_thumb").offset().left + $("#blog_b_thumb").width() + 2;
		}else if(eventDice == 7){
			appendingHorse("left");
			
			top = getRandomInt(
					$("#productContainer").offset().top + 15,
					$("#b_banner1 > img").offset().top - 250);
			left = $("#productContainer").offset().left - 50;
		}else if(eventDice == 8){
			appendingHorse("right");
			
			top = getRandomInt(
					$("#productContainer").offset().top + 15,
					$("#b_banner1 > img").offset().top - 250);
			left = $("#productContainer").offset().left + $("#productContainer").width() - 10;
		}else if(eventDice == 9){
			appendingHorse("top");
			
			top = $("#b_banner1 > img").offset().top - 45;
			left = getRandomInt(
				$("#b_banner1 > img").offset().left + 15,
				$("#b_banner1 > img").offset().left + 520);
		}else if(eventDice == 10){
			appendingHorse("top");
			
			top = $("#b_banner1 > img").offset().top - 40;
			left = getRandomInt(
				$("#b_banner1 > img").offset().left + 600,
				$("#b_banner1 > img").offset().left + 900);
		}else if(eventDice == 11){
			appendingHorse("bottom");
			
			top = $("#b_banner2").offset().top + $("#b_banner2").outerHeight();
			left = getRandomInt(
				$("#b_banner2").offset().left + 100,
				$("#b_banner2").offset().left + 450);
		}else if(eventDice == 12){
			appendingHorse("bottom");
			
			top = $("#b_banner2").offset().top + $("#b_banner2").outerHeight();
			left = getRandomInt(
				$("#b_banner2").offset().left + 625,
				$("#b_banner2").offset().left + $("#b_banner2").width() - 65);
		}
		
		$("#eventCoin").css({ 'left': left + 18, 'top': top + 18 });
		$("#eventHorse").css({ 'left': left, 'top': top }).fadeIn(1000).click(event_clickHorse);
	}
	
	/*�̺�Ʈ�ָ� Ŭ������ �� ����Ʈ ���� ���*/
	function event_clickHorse(){
		var coinTop = $(this).offset().top;
		var heightLevel = coinTop / 200;
		
		$("#horseYelling").bPopup({
			fadeSpeed: 1000,
			follow: [false, false],
			modalClose: false,
			position: [$("#eventHorse").offset().left 
			           		+ $("#eventHorse").width()/2
			           		- $("#horseYelling").width()/2, 
			           $("#eventHorse").offset().top - 30],
            speed: 1000,
            opacity: 0.1,
            onOpen: function(){
            	setTimeout(function(){
            		$("#horseYelling").bPopup().close();
            	}, 2000);
            	
            	$("#eventHorse").fadeOut(1000);
        		$("#eventCoin").fadeIn(1000).delay(heightLevel * 100 + 1000)
        			.animate({ 'top': coinTop - 30 }, 500, "easeOutQuint")
        			.animate({ 
        				'top': $(".coin").offset().top, 
        				'left': $(".coin").offset().left 
        		}, heightLevel * 100 + 1000, updateEventCash);
        		
        		$('html, body').delay(heightLevel * 100 + 2000).animate({ 
        			'scrollTop': 0 
        		}, heightLevel * 100 + 1000);
            }
		});
	}
	
	/*�̺�Ʈ ĳ�� �߰� ���*/
	function updateEventCash(){
		var eventCash = getRandomInt(10, 100);
		indivMarketDwr.updateEventCash(eventCash, callback_addEventCash);
		
		function callback_addEventCash(m_cash){
			$("#eventCash_amount").html(eventCash);
			$("#notice_addEventCash").bPopup({
				easing: 'easeOutBack',
				fadeSpeed: 'slow',
				follow: [false, false],
				modalClose: false,
				opacity: 0.3,
				position: [$("#header_cash").offset().left - 165, 
				           $("#header_cash").offset().top + 20],
	            speed: 1000,
	            transition: 'slideDown',
	            onOpen: function(){
	            	setTimeout(function(){
	            		$("#notice_addEventCash").bPopup().close();
	            	}, 2500);
	            }
			});
			
			$("#header_cash").prepend(
				"<span class='hidden'>" + m_cash + "</span>"
			).find(".hidden").fadeIn(1000).end().find("span:eq(1)").remove();
		}
	}
	
	/*�ΰ� ���:*/
	
	/*ĳ���� �̹��� ��� �߰� ���*/
	function appendingHorse(direction){
		var image = "";
		var imageNum = getRandomInt(1, 3);
		
		switch (direction) {
		case "top":
			switch (imageNum){
			case 1:	image = "aema_top_spy.png"; break;
			case 2:	image = "aema_top_wink.png"; break;
			case 3:	image = "aema_top.png"; break; }
			break;
		case "right":
			switch (imageNum){
			case 1:	image = "aema_right_spy.png"; break;
			case 2:	image = "aema_right_wink.png"; break;
			case 3:	image = "aema_right.png"; break; }
			break;
		case "bottom":
			switch (imageNum){
			case 1:	image = "aema_bottom_spy.png"; break;
			case 2:	image = "aema_bottom_wink.png"; break;
			case 3:	image = "aema_bottom.png"; break; }
			break;
		case "left":
			switch (imageNum){
			case 1:	image = "aema_left_spy.png"; break;
			case 2:	image = "aema_left_wink.png"; break;
			case 3:	image = "aema_left.png"; break; }
			break;
		}
		
		$("#indivMarketWrapper").append(
			"<img id='eventHorse' class='hidden' src='images/catchHorse/" + image + "'>"
		);
	}
});