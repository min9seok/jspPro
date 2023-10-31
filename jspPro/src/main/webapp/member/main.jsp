<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
 String id = (String) session.getAttribute("id");
%>

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
	<a href="#" style="position: absolute;top:30px;">Home</a>
</h1>
<c:choose>
<c:when test="${empty id }">
<ul>    
	<li><a href="logon.jsp">로그인</a></li>
	<li><a href="join.jsp">회원가입</a></li>
</ul>
</c:when>
<c:otherwise>
<ul>
       [ <%= id %> ]님 환영합니다<br>
       <a href="logout.jsp">로그아웃</a>
</ul>
</c:otherwise>
</c:choose>
</header>
<h3><span class="material-symbols-outlined">view_list</span> jsp days00</h3>
<div>
 <xmp class="code">
  메인 화면 
 </xmp>
 <a href="/jspPro/member/list.do">게시판 이동</a><br>

<script>
</script>
</body>
</html>

