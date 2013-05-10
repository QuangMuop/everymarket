<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script src="jquery-1.9.1.min.js" type="text/javascript"></script>
<title>Insert title here</title>
<style type="text/css">
body{
margin: 0px;
}
#c_f_sidebar{
float: left;
width:150px;
height: 500px;
background-color: #49a33f;
}
#c_f_s_title{
margin: 5px;
margin-top: 20px;
}
#c_f_logo{
height: 30px;
}
#c_f_title{
height: 15px;
}
#c_s_bar_ad{
width:130px;
margin-left: 3px;
margin-top: 20px;
}
#c_f_s_b_ad{
width:130px;
margin-top: 30px;
margin-left: 3px;
}
#c_f_s_bottom{
margin-top: 10px;
margin-left:7px;
width:120px;
background-color: #30892c;
height: 20px;

}
#c_f_lang{
height: 16px;
padding-left: 40px;
}
#c_f_contents{
float:left;
margin: 10px;
margin-left: 20px;
margin-right: 20px;
width:355px;
}
#c_f_c_company{
text-align:right;
color: #275f9a;
font-size: 12px;
margin: 0px;
margin-bottom: 10px;
}
#c_f_c_process{
background-color: #eaeaea;
height: 20px;
padding-left: 20px;
}
.c_p{
font-size: 12px;
color:#929292;

}
#c_f_c_p_title{
height: 24px;
}
#c_f_c_inner_title{
margin-top: 10px;
}
#qe{
float: right;
}
#c_f_c_inner_table{
border-spacing: 0px;
margin-top:10px;
margin-bottom: 10px;
width:355px;
}
#c_f_c_inner_table_top1{
border-top: 4px groove #adafb0;
}
#c_f_c_inner_table_top2{
border-top: 4px groove #dcdee0;
}
#c_f_c_inner_table tr{
height: 25px;
}
#c_f_c_inner_table th{
background-color: #e5e7ea;
text-align: right;
font-size: 12px;
font-weight: normal;
color: #433f37;
border-bottom: 1px solid #cacac8;
}
#c_f_c_inner_table td{
background-color: #f2f4f5;
color :#433f37;
text-align: left;
padding-left: 10px;
border-bottom: 1px solid #dfe0de;
font-size: 12px;
}
#c_in_table_pay{
font-weight: bold;
}
#c_f_c_inner_select{
width:355px;
border-spacing: 0px;
}
#c_f_c_inner_table2_top1{
border-top: 4px groove #817e76;
}
#c_f_c_inner_table2_top2{
border-top: 4px groove #f4c46f;
}
#c_f_c_inner_select a{
font-size: 11px;
font-weight: bold;
color:#545456;
padding-right: 5px;
width:80px;
float: left;
}
#c_f_c_inner_select td{
background-color: #f8f6ea;
border-bottom: 1px solid #e8e0c0;
height: 25px;
}
#c_f_c_select{
background-color: white;
font-size: 11px;
color:#545456;
float: right;
margin-right: 20px;
}
.c_f_button{
font-size:13px;
width:80px;
height: 30px;
color:white;
border: 0px;
font-weight: bold;
margin-top: 200px;
}
#c_f_cencle{
background-color: #afb0b2;
margin-left:80px;
margin-right: 15px;
}
#c_f_next{
background-color: #275e9f;
}
#c_f_c_bottom_line{
margin-top:10px;
background-color: #ebebeb;
height: 20px;
width: 355px;
}
#c_f_c_bottom{
height:13px;
float: right;
margin-top: 10px;
}
</style>
<script type="text/javascript">
$(document).ready(function(){
	$("#c_f_next").click(function(){
		window.open("card_buy2.jsp","ff","width=480,height=500,location=no");	
	});
});
</script>
</head>
<body>
	<div id="c_f_sidebar">
		<div id="c_f_s_title">
			<img alt="" id="c_f_logo" src="../../image_mypage/ema4.png">
			<img alt="" id="c_f_title" src="../../image_mypage/c_f_title.png">
			<img alt="" id="c_s_bar_ad" src="../../image_mypage/c_s_bar_ad.png">
			<img alt="" id="c_f_s_b_ad" src="../../image_mypage/c_f_s_b_ad.png">
			<div id="c_f_s_bottom">
				<img alt="" id="c_f_lang" src="../../image_mypage/c_f_lang.png">
			</div>
		</div>
	</div>
	<div id="c_f_contents">
		<div id="c_f_c_title">
			<p id="c_f_c_company">(주)EVERY</p>
			<div id="c_f_c_process">
				<a class="c_p" id="c_p1">카드선택/인증</a>
					<img alt="" src="../../image_mypage/arrow.png">
				<a class="c_p" id="c_p2">정보확인</a>
					<img alt="" src="../../image_mypage/arrow.png">
				<a class="c_p" id="c_p3">결제완료</a>
			</div>
		</div>
		<div id="c_f_c_inner">
			<div id="c_f_c_inner_title">
				<img alt="" id="c_f_c_p_title" src="../../image_mypage/c_f_c_p_title.png">
				<img alt="" id="qe" src="../../image_mypage/qe.png">
			</div>
			<table id="c_f_c_inner_table">
				<colgroup>
					<col width="25%">
					<col width="75%">
				</colgroup>
				<tr>
					<th id="c_f_c_inner_table_top1">상품명</th>
					<td id="c_f_c_inner_table_top2">몰라</td>
				</tr>
				<tr>
					<th>상품금액</th>
					<td id="c_in_table_pay">몰라</td>
				</tr>
			</table>
			<table id="c_f_c_inner_select">
				<colgroup>
					<col width="25%">
					<col width="75%">
				</colgroup>
				<tr>
					<th id="c_f_c_inner_table2_top1"></th>
					<th id="c_f_c_inner_table2_top2"></th>
				</tr>
				<tr>
					<td colspan="2">
						<a>
							<input type="radio" name="card_select">
							현대카드
						</a>
						<a>
							<input type="radio" name="card_select">
							삼성카드
						</a>
						<a>
							<input type="radio" name="card_select">
							하나SK
						</a>
						<a>
							<input type="radio" name="card_select">
							신한카드
						</a>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<a>
							<input type="radio" name="card_select">
							NH채움
						</a>
						<a>
							<input type="radio" name="card_select">
							외환카드
						</a>
						<a>
							<input type="radio" name="card_select">
							KB국민
						</a>
						<a>
							<input type="radio" name="card_select">
							BC카드
						</a>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<a>
							<input type="radio" name="card_select">
							씨티카드
						</a>
						<a>
							<input type="radio" name="card_select">
							롯데카드
						</a>
						<select id="c_f_c_select"  name="card_select">
							<option>그 외의 카드</option>
							<option>이니포인트</option>
							<option>우리평화</option>
							<option>저축은행</option>
							<option>광주은행</option>
							<option>전북은행</option>
							<option>수협</option>
							<option>조흥은행</option>
							<option>제주은행</option>
						</select>
					</td>
				</tr>
			</table>
			<button class="c_f_button" id="c_f_cencle">취소</button>
			<button class="c_f_button" id="c_f_next">다음</button>
			<div id="c_f_c_bottom_line">
			</div>
			<img alt="" id="c_f_c_bottom" src="../../image_mypage/c_f_c_bottom.png">
		</div>
	</div>
</body>
</html>