<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% // 스크립트릿 자바 코딩
 Date now = new Date();
 String pattern = "yyyy-MM-dd hh:mm:ss";
 SimpleDateFormat sdf = new SimpleDateFormat(pattern) ;
 String strNow = sdf.format(now);
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
<h3><span class="material-symbols-outlined">view_list</span> jsp days01</h3>
<div>
 <xmp class="code">
<%--   [ex02.jsp]
  JSP 스크립트 3가지 종류
  1. 스크립트릿 <% %>
  2. 표현식    <%= %>
  3. 선언문    <%! %>
  
  JSP 9가지 구성 요소
  1. 3가지 지시자 - page 지시자 <%@ %>
                 include 지시자 <%@ %>
                 taglib 지시자 <%@ %> --%>
  
 </xmp>
 <h3>ex02.jsp - 표현식<%=strNow %></h3>
</div>
<script>
let now = "<%=strNow %>";
$("xmp").html(now);
</script>
</body>
</html>

