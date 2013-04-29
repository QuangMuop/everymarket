<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
     
     <table>
     <tr>
       <th>주문번호</th>
       <th>상품명/옵션정보</th>
       <th>총 결제금액</th>
       <th>진행상태</th>
     </tr>
     
     <c:forEach var="buyTrade" items="${buyTradeList}">
       <tr> 
        <td></td>
        <td></td>
        <td></td>
        <td></td>
       </tr>
     </c:forEach>
     
       
       
       
     
     
     
     
     
     
     
     
     </table>
      

       

</body>
</html>