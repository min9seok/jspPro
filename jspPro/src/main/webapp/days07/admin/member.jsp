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
<c:choose>
 <c:when test="${empty auth }">
   <li><a href="/jspPro/days07/member/logon.jsp">로그인</a></li>
 </c:when>
 <c:otherwise>
   <li><a href="/jspPro/days07/member/logout.jsp">[${auth }] 로그아웃</a></li>
 </c:otherwise>
</c:choose>
	<li><a href="/jspPro/days07/member/join.jsp">회원가입</a></li>
</ul>
</header>
<h3><span class="material-symbols-outlined">view_list</span> jsp days00</h3>
<div>
 <xmp class="code">
  
 </xmp>
<h2>회원관리</h2>
</div>
<script>
</script>
</body>
</html>

