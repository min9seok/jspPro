<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
 String error = request.getParameter("error");
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
<h3><span class="material-symbols-outlined">view_list</span> jsp days02</h3>
<div>
 <xmp class="code">
  [로그인 페이지]  
 </xmp>
<form action="ex09_ok.jsp"method="GET">
 아이디 : <input type="text" name="id" value="admin" /><br>
 비밀번호 : <input type="password" name="passwd" value="1234" /><br>
 <input type="submit" value="logon" />
</form>
</div>
<%
 if(error != null && error.equals("")){
%>
<script>
$(function(){
	alert("실패");
});
</script>
<%	 
 }
%> 
<script type="text/javascript">
<%-- alert( new Boolean(<%=error%>)); --%>
</script>
</body>
</html>

