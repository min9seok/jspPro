<%@page import="domain.EmpVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="domain.DeptVO"%>
<%@page import="java.util.Iterator"%>
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
<h3><span class="material-symbols-outlined">view_list</span> jsp days02</h3>
<div>
 <xmp class="code">
  [ex13_emp.jsp]
 </xmp>
<h2>emp list</h2>
<table style="width: 100%;">
<thead>
<tr style="text-align: center;">
        <td>empno</td>
        <td>ename</td>
        <td>job</td>
        <td>mgr</td>
        <td>hiredate</td>
        <td>sal</td>
        <td>comm</td>
        <td>deptno</td>
</tr>
</thead>
<tbody>
<%-- <c:choose> --%>
<%-- <c:when test="${fn:length(list)>0}"> --%> 
<%-- <c:when test="${list!=null}"> --%>
<%--  <c:forEach var="vo" items="${list}"> --%>
<!--  <tr> -->
<%-- 	<td>${vo.empno}</td>  --%>
<%-- 	<td>${vo.ename}</td> --%>
<%-- 	<td>${vo.job}</td> --%>
<%-- 	<td>${vo.mgr}</td> --%>
<%-- 	<td>${vo.hiredate}</td> --%>
<%-- 	<td>${vo.sal}</td> --%>
<%-- 	<td>${vo.comm}</td> --%>
<%-- 	<td>${vo.deptno}</td> --%>
<!-- </tr> -->
<%--  </c:forEach> --%>
<%-- </c:when> --%>
<%-- <c:otherwise> --%>
<!-- <tr> -->
<!-- <td colspan="8">사원 없다구용~~</td> -->
<!-- </tr> -->
<%-- </c:otherwise> --%>
<%-- </c:choose> --%>
<c:if test="${empty list }">
<tr>
<td colspan="8">사원 없다구용</td>
</tr>
</c:if>
<c:if test="${not empty list }">
  <c:forEach var="vo" items="${list }" >
    <tr>
	  <td>${vo.empno}</td> 
	  <td>${vo.ename}</td>
	  <td>${vo.job}</td>
	  <td>${vo.mgr}</td>
	  <td>${vo.hiredate}</td>
	  <td>${vo.sal}</td>
	  <td>${vo.comm}</td>
	  <td>${vo.deptno}</td>
    </tr>
  </c:forEach>
</c:if>
</tbody>
<tfoot>
<tr>
<td colspan="8">
<span class="badge left red">${empty list?0:list.size()}</span>
 <button style="margin-left: 45%">확인</button>
<!--  <a href="javascript:history.back();">뒤로가기</a> -->
<a href="dept">뒤로 가기</a>
</td>
</tr>
</tfoot>
</table>
</div>
<script>

</script>
</body>
</html>

