<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
 String path = request.getContextPath();
 String status = request.getParameter("status");
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
<header class="sticky">
<h1 class="main">
	<a href="#" style="position: absolute;top:30px;">Home</a>
</h1>
<ul>
	<li><a href="main.jsp">메인</a></li>	
</ul>
</header>
<body>
<div>
 <xmp class="code">
  로그인화면 
 </xmp>
  <form action="<%=path %>/member/logon.do" method="POST" >    
    아이디	: <input type="text" name="id" id="id" value="admin" /><br>
    비밀번호	: <input type="password" name="pwd" id="pwd" value="1234" /><br>     
    <input type="submit" value="로그인" />        
  </form>
</div>
<script>
	if( "<%=status%>" == "success") {
		alert("로그인 성공!")
		$("form")[0].reset();
		location.href="/jspPro/member/list.do";
	}else if ("<%=status%>" == "failed") {
		alert("로그인 실패!")
		$("form")[0].reset();
	}	
</script>
</body>
</html>

