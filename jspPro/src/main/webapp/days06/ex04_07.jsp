<%@page import="java.text.DecimalFormat"%>
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
<h3><span class="material-symbols-outlined">view_list</span> jsp days06</h3>
<div>
 <xmp class="code">
  EL 객체 메서드 호출
  EL 객체 정적메서드 호출
  days06.FormatUtil 클래스 추가
 </xmp>
<%
 long price = 22345;
%>
 price(표현식) = <%=price %><br>
 price(표현식) = <%= String.format("%,d", price) %><br>
 <%
  String pattern = "##,###";
  DecimalFormat df = new DecimalFormat(pattern);
 %>
  price(표현식) = <%=df.format(price)%><br>
  <hr>
  <%
   request.setAttribute("price",price);
  %>
  price(EL) = ${requestScope.price }<br>
  price(EL) = ${price }<br>
  price(EL) = <fmt:formatNumber pattern="##,###" value="${price }" />
</div>
<script>
</script>
</body>
</html>

