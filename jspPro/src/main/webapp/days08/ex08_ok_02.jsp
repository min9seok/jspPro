<%@page import="java.io.DataInputStream"%>
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
<h3><span class="material-symbols-outlined">view_list</span> jsp days08</h3>
<div>
 <pre class="code">
  <%
 Enumeration<String> en = request.getHeaderNames(); 
 while(en.hasMoreElements()){
	 String key = en.nextElement();
	 String value = request.getHeader(key);
	 out.print(key+ " : " + value + "<br>");
 }
%>
 </pre>
<h2>스트림(Stream) 전송된 데이터 정보</h2>
<%
 ServletInputStream sis = request.getInputStream();
 DataInputStream dis = new DataInputStream(sis);
 String line = "";
 while( (line = dis.readLine()) != null ){
	 out.print( new String(line.getBytes("ISO-8859-1"),"UTF-8") );
 }
%> 
</div>
<script>
</script>
</body>
</html>

