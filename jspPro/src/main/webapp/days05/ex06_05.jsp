<%@page import="java.io.UnsupportedEncodingException"%>
<%@page import="java.net.URLDecoder"%>
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
  ex06_05.jsp
  쿠키 구정
 </xmp>
 <%!
  public String getCookieValue(String cname,HttpServletRequest request){
	 Cookie[] cookies = request.getCookies();
	 for(Cookie c : cookies){
		 if(c.getName().equals(cname)){
// 			 return c.getValue();
			 try{
			 return URLDecoder.decode(c.getValue(),"UTF-8");
			 }catch(UnsupportedEncodingException e){}
		 }
	 }
	 return null;
 }
 %>
<form action="ex06_05_ok.jsp">
 <%
  String[] updates = request.getParameterValues("ckbCookie");
 for(int i=0; i<updates.length;i++){
	 String cname = updates[i];
	 String cvalue = getCookieValue(cname,request);
%>
<li><%=cname %> : <input type="text" name="<%=cname %>" value="<%=cvalue %>" /></li>
<% 
 };
 %>
 <input type="submit" value="쿠키수정" />
</form>
</div>
<script>
</script>
</body>
</html>

