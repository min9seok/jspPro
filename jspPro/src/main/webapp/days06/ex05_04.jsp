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
  ex05_04.jsp?num=???
 </xmp>
<c:set var="pnum" value="${param.num }"  />
<c:if test="${pnum mod 2 eq 0 }">짝수</c:if>
<c:if test="${pnum mod 2 ne 0 }">홀수</c:if>

<c:choose>
 <c:when test="${pnum mod 2 eq 0 }">짝수</c:when>
 <c:otherwise>홀수</c:otherwise>
</c:choose>
</div>
<script>
</script>
</body>
</html>

