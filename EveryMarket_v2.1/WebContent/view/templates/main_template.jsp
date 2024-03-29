<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title> :: EveryMart v2 by gBom :: </title>
<link href="<%=request.getContextPath()%>/styles/main_template.css" rel="stylesheet" type="text/css"/>
<link href="<%=request.getContextPath()%>/styles/indivMarket.css" rel="stylesheet" type="text/css"/>
<link href="<%=request.getContextPath()%>/styles/popup_productInfo.css" rel="stylesheet" type="text/css"/>
<link href="<%=request.getContextPath()%>/styles/css_youngjun/basic.css" rel="stylesheet" type="text/css"/>
<link href="<%=request.getContextPath()%>/styles/css_youngjun/content.css" rel="stylesheet" type="text/css"/>
<link href="<%=request.getContextPath()%>/styles/css_youngjun/style.css" rel="stylesheet" type="text/css"/>
<link href="<%=request.getContextPath()%>/styles/css_sujeong/shopstyle.css" rel="stylesheet" type="text/css"/>
<link href="<%=request.getContextPath()%>/styles/css_sujeong/general.css" rel="stylesheet" type="text/css"/>
<link href="<%=request.getContextPath()%>/styles/trade.css" rel="stylesheet" type="text/css"/>
<!-- 마이페이지 -->
<link href="<%=request.getContextPath()%>/styles/css_mypage/mypage.css" rel="stylesheet" type="text/css"/>
<!-- 마이페이지 -->
<!-- 마켓슬라이드 -->
<link href="<%=request.getContextPath()%>/styles/skitterstyles.css" media="all" rel="stylesheet" type="text/css"/>
<!-- 마켓슬라이드 -->
<script src="<%=request.getContextPath()%>/scripts/lib/jquery-1.9.1.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/scripts/lib/jquery.form.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/scripts/lib/jquery.bpopup.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/scripts/lib/blocksit.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/scripts/lib/blocksit.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/scripts/lib/blocksit_container7.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/scripts/lib/jqeury-ui-1.10.2.custom.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/scripts/lib/jquery.easing.1.3.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/scripts/lib/tabs.js" type="text/javascript"></script>
<!-- 마켓슬라이드 -->
<script src="<%=request.getContextPath()%>/scripts/lib/jquery.skitter.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/scripts/lib/highlight.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/scripts/lib/jquery.wookmark.js" type="text/javascript"></script>
<!-- 마켓슬라이드 -->
<script src="<%=request.getContextPath()%>/dwr/engine.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/dwr/interface/boardQnaDwr.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/dwr/interface/boardReportDwr.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/dwr/interface/indivMarketDwr.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/dwr/interface/listDwr.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/dwr/interface/headerDwr.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/dwr/interface/memberDwr.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/dwr/interface/tradeDwr.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/scripts/administer.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/scripts/footer.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/scripts/header.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/scripts/indivMarket.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/scripts/list.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/scripts/remote.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/scripts/tradeList.js" type="text/javascript"></script>

<!-- 마켓슬라이드 -->
<script src="<%=request.getContextPath()%>/scripts/slide_market.js" type="text/javascript"></script>
<!-- 마켓슬라이드 -->
<!-- 마이페이지 -->
<script src="<%=request.getContextPath()%>/scripts/mypage.js" type="text/javascript"></script>
<!-- 마이페이지 -->
<style type="text/css">
body{
background-image: url(image_mypage/ema5.png);
}
#backcolor{
width:1020px;
background-color: rgba(255,255,255,0.8); 

}
</style>
</head>
<body>
<center>
		
	<tiles:insertAttribute name="header"/>
	
	<div id="backcolor">
	<tiles:insertAttribute name="body"/>
	</div>
	<tiles:insertAttribute name="popup"/>	

	<tiles:insertAttribute name="footer"/>
		
</center>
</body>
</html>