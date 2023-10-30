<%@page import="java.util.Date"%>
<%@page import="days05.MemberInfo"%>
<%@page import="java.lang.reflect.Member"%>
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
<h3><span class="material-symbols-outlined">view_list</span> jsp days05</h3>
<div>
 <xmp class="code">
  ex05_04.jsp
 </xmp>
<%
 String id = request.getParameter("id");
 String name = request.getParameter("name");
 String passwd = request.getParameter("passwd");
 String email = request.getParameter("email");
 // jsp:useBean 액션태그 
%>
 <jsp:useBean id="mi" class="days05.MemberInfo" scope="page"> </jsp:useBean>
 <jsp:setProperty property="id" value="<%=id %>" name="mi"/>
 <jsp:setProperty property="name" value="<%=name %>" name="mi"/>
 <jsp:setProperty property="passwd" value="<%=passwd %>" name="mi"/>
 <jsp:setProperty property="email" value="<%=email %>" name="mi"/>
 <jsp:setProperty property="registerDate" value="<%=new Date() %>" name="mi"/>
아이디 : <jsp:getProperty property="id" name="mi"/><br>
이름 : <%=mi.getName() %><br>
비밀번호 : <%=mi.getPasswd() %><br>
등록일 : <%=mi.getRegisterDate() %><br>
이메일 : <%=mi.getEmail() %><br>
</div>
<script>
</script>
</body>
</html>

