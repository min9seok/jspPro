<%@page import="domain.EmpVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="domain.DeptVO"%>
<%@page import="java.util.Iterator"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
 ArrayList<DeptVO> list = (ArrayList)request.getAttribute("list");
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
  [ex13_dept.jsp]
 </xmp>
<select name="deptno" id="deptno">
	<option>선택하세요.</option> 
<%
	DeptVO vo = null;
	Iterator<DeptVO> ir = list.iterator();
	while (ir.hasNext()) {
	 vo = ir.next();
%>
<option value="<%=vo.getDeptno()%>"><%=vo.getDname()%></option>
<%	
}
%>
</select>
</div>
<script>
$(function(){
	$("#deptno").wrap("<form></form>").change(function(){
		$(this).parent()
		.attr({
			"method":"get"
		   ,"action":"/jspPro/scott/emp"
		}).submit();
	});
});
</script>
</body>
</html>
