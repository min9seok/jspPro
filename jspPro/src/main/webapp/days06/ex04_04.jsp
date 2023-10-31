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
  EL 산술 연산자 사용 가능
 </xmp>
<%--  ${10+3 } <br> --%>
<%--  ${10-3 } <br> --%>
<%--  ${10*3 } <br> --%>
<%--  ${10/3 } <br> --%>
<%--  ${10%3 } <br> --%>
<%--  ${10mod3 } <br> --%>
<!-- EL 연산자는 기본 덧셈 기능 -->
<%-- ${"10"+ 10 } <br> --%>
<%-- ${"한글"+ 10 } <br> NumberFormat Exception --%>
<%-- ${null+ 10 } <br> --%>

</div>
<script>
</script>
</body>
</html>

