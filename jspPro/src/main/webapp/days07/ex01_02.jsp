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
<h3><span class="material-symbols-outlined">view_list</span> jsp days07</h3>
<div>
 <xmp class="code">
  c:forEach 
   begin="" 루프 시작값
   end=""   루프 끝값
   items="" 루프 Map, 배열, 컬렉션 대상 객체
   step=""  루프 증가치
   var=""   변수명
   varStatus=""
 </xmp>
 <c:set var="sum" value="0"></c:set>
 <c:forEach begin="1" end="10" step="1" var="i" varStatus="status">
<%--  <c:if test="${i eq 10 }"> --%>
<%--   ${ i } --%>
<%--  </c:if> --%>
<%--  <c:if test="${i ne 10 }"> --%>
<%--  ${ i += "+" } --%>
<%--  </c:if> --%>
<%-- ${ i += (i==10?"":"+") } --%>
	${ i += (status.last?"":"+") }
 <c:set var="sum" value="${sum + i }"></c:set> 
 </c:forEach>
 = ${sum }
 <hr>
<%--  ${status.current } --%>
 <c:forEach begin="5" end="12" var="i" step="2" varStatus="status">
   ${i } - ${status.index } - ${status.count } - ${status.first } - ${status.last }<br>
   
 </c:forEach>
</div>
<script>
</script>
</body>
</html>

