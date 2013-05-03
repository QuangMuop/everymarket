<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title> :: EveryMart v2 by gBom :: </title>
<link href="<%=request.getContextPath()%>/styles/main_template.css" rel="stylesheet" type="text/css"/>
<link href="<%=request.getContextPath()%>/styles/popup_productInfo.css" rel="stylesheet" type="text/css"/>
<link href="<%=request.getContextPath()%>/styles/css_youngjun/basic.css" rel="stylesheet" type="text/css"/>
<link href="<%=request.getContextPath()%>/styles/css_youngjun/content.css" rel="stylesheet" type="text/css"/>
<link href="<%=request.getContextPath()%>/styles/css_youngjun/style.css" rel="stylesheet" type="text/css"/>
<script src="<%=request.getContextPath()%>/scripts/lib/jquery-1.9.1.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/scripts/lib/jquery.form.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/scripts/lib/jquery.bpopup.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/scripts/lib/blocksit.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/dwr/engine.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/dwr/interface/boardReportDwr.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/dwr/interface/productDwr.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/scripts/administer.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/scripts/footer.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/scripts/header.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/scripts/indivMarket.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/scripts/list.js" type="text/javascript"></script>
</head>
<body>
<center>
		
	<tiles:insertAttribute name="header"/>
		
	<hr>
		
	<tiles:insertAttribute name="body"/>
	<tiles:insertAttribute name="popup"/>	
	
	<hr>
	
	<tiles:insertAttribute name="footer"/>
		
</center>
</body>
</html>