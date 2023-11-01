<%@page import="java.time.LocalDate"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="shortcut icon" href="http://localhost/jspPro/images/SiSt.ico">
<link rel="stylesheet" href="/jspPro/resources/cdn-main/example.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="/jspPro/resources/cdn-main/example.js"></script>
<style type="text/css">
.material-symbols-outlined {
	vertical-align: text-bottom;
}
</style>
</head>
<body>
<header class="sticky">
<h1 class="main">
	<a href="#" style="position: absolute;top:30px;">ky Home</a>
</h1>
<ul>
	<li><a href="#">로그인</a></li>
	<li><a href="#">회원가입</a></li>
</ul>
</header>
<h3><span class="material-symbols-outlined">view_list</span> jsp days07</h3>
<div>
 <xmp class="code">
   JSTL
   1) 코어 c
   3) 국제화 fmt
     - 특정 지역에 따라 알맞은 메세지 출력할 때 사용하는 태그 
     - 주로 사용 : 숫자, 날짜 모맷팅
     formatNumber
     fmt:formatDate
     
     parseNumber
     parseDate
 </xmp>
<%
 Date now = new Date();
%>
now = <%=now %><br>
<c:set value="<%=now %>" var="now"></c:set>
<li><fmt:formatDate value="${now}" /></li>
<li><fmt:formatDate value="${now}" type="date"/></li>

<li><fmt:formatDate value="${now}" type="time"/></li>
<li><fmt:formatDate value="${now}" type="both"/></li>

<li><fmt:formatDate value="${now}" pattern="yyyy년 MM월 dd일"/></li>

<li><fmt:formatDate value="${now}" dateStyle="default"/></li>
<li><fmt:formatDate value="${now}" dateStyle="full"/></li>
<li><fmt:formatDate value="${now}" dateStyle="short"/></li>
<li><fmt:formatDate value="${now}" dateStyle="medium"/></li>
<li><fmt:formatDate value="${now}" dateStyle="long"/></li>
<hr>
<%
 long price = 22345;
 request.setAttribute("price",price);
%>
 price : ${price }<br>
 <fmt:formatNumber value="${price }" type="number" pattern="##,###.00" var="fmtprice" />
 price : ${fmtprice }<br>

 <fmt:formatNumber value="${price }" type="currency" currencySymbol="\\"/><br>
 
 <fmt:formatNumber value="${price }" type="percent" /><br>
</div>
<div>
<%
 String strPrice = "1,200.34";
 // String > double 형변환
 strPrice = strPrice.replaceAll(",", "");
 double dprice = Double.parseDouble(strPrice);
%>
 price : <%=dprice %><br>
 
 <fmt:parseNumber value="<%=strPrice %>" var="dprice" pattern="0,000.00" />
 price : ${dprice }<br>
 <hr>
 <%
  String strNow = "2023년 11월 01일";
 // String -> Date 형변환
 // 1) year, month, day
 // Date now = new Date(2023-1900,11-1,1)
 
//  2)
// String pattern = "yyyy년 mm월 dd일"; 
//  SimpleDateFormat sdf = new SimpleDateFormat(pattern);
//  Date now = sdf.parse(strNow);

//  3)
//  String pattern = "yyyy년 mm월 dd일";
//  DateTimeFormatter df = DateTimeFormatter.ofPattern(pattern);
//  LocalDate now = LocalDate.parse(strNow, df);
 %>
 <fmt:parseDate value="<%=strNow %>" pattern="yyyy년 MM월 dd일" var="pnow"/>
  now : ${pnow }<br>
</div>

<script>
</script>
</body>
</html>

