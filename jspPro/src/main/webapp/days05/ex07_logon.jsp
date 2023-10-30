<%@page import="com.util.Cookies"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
 String id = request.getParameter("id");
 String passwd = request.getParameter("passwd");
 
 String location = "ex07_default.jsp";
 if(id.equals("admin") && passwd.equals("1234") ){
	 Cookie c = Cookies.createCookie("auth", id, "/", -1);
	 response.addCookie(c);
	 	 
	 response.sendRedirect(location);
 }else if(id.equals("hong") && passwd.equals("1234") ){
	 Cookie c = Cookies.createCookie("auth", id, "/", -1);
	 response.addCookie(c);
	 	 
	 response.sendRedirect(location);
 }else if(id.equals("park") && passwd.equals("1234") ){
	 Cookie c = Cookies.createCookie("auth", id, "/", -1);
	 response.addCookie(c);
	 	 
	 response.sendRedirect(location);
 }else{
	 location += "?logon=fail";
	 response.sendRedirect(location);
 }
 
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
	<a href="#" style="position: absolute;top:30px;">ky Home</a>
</h1>
<ul>
	<li><a href="#">로그인</a></li>
	<li><a href="#">회원가입</a></li>
</ul>
</header>
<h3><span class="material-symbols-outlined">view_list</span> jsp days05</h3>
<div>
 <xmp class="code">
  ex07_logon.jsp
 </xmp>

</div>
<script>
</script>
</body>
</html>

