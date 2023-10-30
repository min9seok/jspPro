<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>
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
<h3><span class="material-symbols-outlined">view_list</span> jsp days00</h3>
<div> 
<h3>viewErrorMessage.jsp - 에러 처리하는 페이지</h3>
<xmp class="code">
  요청 처리 과정에서 에러가 발생했습니다.
  빠른 시간 내에 문제를 해결하도록 하겠습니다.  
 </xmp>
 <p>
  jsp 기본 내장 객체 중 : exception<br>
  예외 타입 :<%=exception.getClass().getName() %> <br> 
  예외 메시지 :<%=exception.getMessage() %> <br>
 </p>
 
</div>
<script>
</script>
</body>
</html>

