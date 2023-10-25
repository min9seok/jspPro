<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.util.ArrayList"%>
<%@page import="domain.DeptVO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.sql.Connection"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%
    Connection conn = DBConn.getConnection();
	PreparedStatement pstmt = null;	
	String sql = "SELECT deptno, dname, loc FROM DEPT";
	ResultSet rs = null;
	int deptno = 0;
	String dname = "";
	String loc = "";
	DeptVO vo;
	ArrayList<DeptVO> list = null;
	try {
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		if(rs.next()) {
			list = new ArrayList();				
			do {
				deptno = rs.getInt("deptno");
				 dname = rs.getString("dname");
				 loc = rs.getString("loc");
				 vo = new DeptVO(deptno, dname, loc);
				 list.add(vo);
			}while (rs.next()); 											
		}		
	} catch (SQLException e) {			
		e.printStackTrace();
	}finally {
		try {
			pstmt.close();
			rs.close();
			DBConn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}			
	}
	System.out.println(" end ");
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
  
 </xmp>
<select name="deptno" id="deptno">
	<option>선택하세요.</option> 
<!--     <option value="10">ACCOUNTING</option> -->
<!--     <option value="20">RESEARCH</option> -->
<!--     <option value="30">SALES</option> -->
<!--     <option value="40">OPERATIONS</option> -->
<%
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
$("#deptno").change(function(){
	let deptno = $(this).val(); // 10,20,30,40
	location.href=`ex06_emp.jsp?deptno=\${deptno}`;
});
});
</script>
</body>
</html>

