<%@page import="domain.EmpVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="domain.DeptVO"%>
<%@page import="java.util.Iterator"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
 ArrayList<EmpVO> list = (ArrayList)request.getAttribute("list");
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
  [ex13_emp.jsp]
 </xmp>
<h2>emp list</h2>
<table>
<thead>
<tr style="text-align: center;">
		<td><input type="checkbox" class="all" />전체선택</td>
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
<%
if(list == null){
%>
<tr>
<td colspan="9">사원 없다구용~~</td>
</tr>
<% 
}else{
	EmpVO vo = null;
	Iterator<EmpVO> ir = list.iterator();
	while(ir.hasNext()){
		 vo = ir.next();
%>	
<tr>
        <td><input type="checkbox" /></td>
        <td><%=vo.getEmpno() %></td>
        <td><%=vo.getEname() %></td>
        <td><%=vo.getJob() %></td>
        <td><%=vo.getMgr() %></td>
        <td><%=vo.getHiredate()%></td>
        <td><%=vo.getSal() %></td>
        <td><%=vo.getComm() %></td>
        <td><%=vo.getDeptno() %></td>
</tr>	 
<%
	}
}
%> 
</tbody>
<tfoot>
<tr>
<td colspan="9">
 <button style="margin-left: 45%">확인</button>
 <a href="javascript:history.back();">뒤로가기</a>
</td>
</tr>
</tfoot>
</table>
</div>
<script>

</script>
</body>
</html>

