<%@page import="java.util.Enumeration"%>
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
<h3><span class="material-symbols-outlined">view_list</span> jsp days03</h3>
<div>
 <xmp class="code">
  
 </xmp>
 <%
  String name = request.getParameter("name");
  String age = request.getParameter("age");
 %>
<form action="ex03_03.jsp">      
  주소 : <input type="text" name="address" value="서울 역삼동" /><br>
  연락처 : <input type="text" name="tel" value="010-1234-5678" /><br>
  <input type="button" value="Prev" onclick="history.back();" />
  <input type="submit" value="Next" />
<%--   <input type="hidden" name="name" value="${param.name}" /><br> --%>
<%--   <input type="hidden" name="age" value="${param.age }" /><br> --%>
</form>
</div>
<script>
let content;
<%
  Enumeration<String> en = request.getParameterNames();
    while(en.hasMoreElements()){
    	String pname = en.nextElement();
    	String pvalue = request.getParameter(pname);
%>

  content = `<input type="hidden" name="<%=pname%>" value="<%=pvalue%>"/><br>`;
$("form").append(content);
<%
    }
%>
</script>
</body>
</html>

