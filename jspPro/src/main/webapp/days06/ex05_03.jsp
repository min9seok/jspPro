<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
  EL
  JSTL
  Filter
  ServletListener
 </xmp>
 <form action="">
   국어 : <input type="text" name="kor" />
 </form>
 kor = ${param.kor }<br>
 empty = ${ empty param.kor } <br>
 <hr>
 <c:if test="${not empty param.kor }">
   <c:set var="score" value="${Math.floor(param.kor / 10) }" />
   <c:choose>
     <c:when test="${score eq 10 or score eq 9 }">수</c:when>
     <c:when test="${score eq 8 }">우</c:when>
     <c:when test="${score eq 7 }">미</c:when>
     <c:when test="${score eq 6 }">양</c:when>
     <c:otherwise>가</c:otherwise>
   </c:choose>
 </c:if>
<%--   <c:set var="score" value="${ param.kor }"/> --%>

<%-- <c:choose> --%>
<%--    <c:when test="${score >= 90 && score <= 100}">수</c:when> --%>
<%--    <c:when test="${score >= 80 && score  < 90}">우</c:when> --%>
<%--    <c:when test="${score >= 70 && score  < 80}">미</c:when> --%>
<%--    <c:when test="${score >= 60 && score< 70}">양</c:when> --%>
<%--    <c:otherwise>가</c:otherwise> --%>
<%-- </c:choose> --%>
</div>
<script>
</script>
</body>
</html>

