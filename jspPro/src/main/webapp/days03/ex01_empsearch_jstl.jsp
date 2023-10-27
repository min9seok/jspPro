<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
  String contextPath = request.getContextPath(); // /jspPro
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
<h3><span class="material-symbols-outlined">view_list</span> jsp days03</h3>
<div>
 <xmp class="code">
  
 </xmp>
 <form action="<%=contextPath%>/days03/empsearch.htm">
   <fieldset>
     <legend>부서 선택</legend>
       <c:forEach var="vo" items="${dlist }">
         <input type="checkbox" name="deptno" value="${vo.deptno }" />${vo.dname }
       </c:forEach>
   </fieldset>
   <fieldset>
     <legend>잡(job) 선택</legend>
	   <c:forEach var="job" items="${jlist }">
         <input type="checkbox" name="job" value="${job }" />${job }
       </c:forEach>
   </fieldset>
   <input type="submit" value="search" />
   <input type="button" value="emp delete" />
 </form>
<div>
<h2>emp search list</h2>
<table style="width: 100%;">
<thead>
<tr style="text-align: center;">
		<td><input type="checkbox" id="ckbAll" class="all" />전체선택</td>
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
<c:choose>
<%-- <c:when test="${fn:length(list)>0}">  --%>
<c:when test="${not empty elist}">
 <c:forEach var="vo" items="${elist}">
 <tr>
    <td><input type="checkbox" data-empno="${vo.empno }" value="${vo.empno }"/></td>
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
</c:when>
<c:otherwise>
<tr>
<td colspan="9">사원 없다구용~~</td>
</tr>
</c:otherwise>
</c:choose> 
</tbody>
<tfoot>
<tr>
<td colspan="9">
 <span class="badge left red">3</span>명
 <a href="#">뒤로가기</a>
</td>
</tr>
</tfoot>
</table> 
</div>
</div>
<script>
let url = location.href;
$("input[name=deptno]").each(function(i, element) {
	let v = $(element).val();
	if (url.indexOf(`deptno=\${v}`) != -1) {
		$(element).prop("checked",true);
	};
});
$("input[name=job]").each(function(i, element) {
	let v = $(element).val();
	if (url.indexOf(`job=\${v}`) != -1) {
		$(element).prop("checked",true);
	};
});
</script>
</body>
</html>

