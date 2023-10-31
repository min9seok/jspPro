<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
 String path = request.getContextPath();
 String write = request.getParameter("write");
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
<ul>
	<li><a href="main.jsp">메인</a></li>	
</ul>
</header>
<h3><span class="material-symbols-outlined">view_list</span> jsp days00</h3>
<div>
 <xmp class="code">
  메인 화면 
 </xmp>
  <form action="<%=path%>/member/join.do" method="POST">
    이름		: <input type="text" name="name" id="name" value="관리자" /><br>
    아이디	: <input type="text" name="id" id="id" value="admin" /><br>
    비밀번호	: <input type="password" name="pwd" id="pwd" value="1234" /><br>
    이메일 	: <input type="text" name="email" id="email" value="admin@naver.com" /><br>   
    <input type="submit" value="회원가입" />        
  </form>
</div>
<script>
	if( "<%=write%>" == "success") {
		alert("회원가입이 완료되었습니다!")
		$("form")[0].reset();
		location.href="main.jsp";
	}else if ("<%=write%>" == "failed") {
		alert("회원가입이 실패했습니다!");
		$("form")[0].reset();
	}
	
</script>
</body>
</html>

