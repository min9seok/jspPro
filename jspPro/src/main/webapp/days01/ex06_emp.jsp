<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.util.ArrayList"%>
<%@page import="domain.EmpVO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.sql.Connection"%>    
<%
    Connection conn;
 	String pDeptno = request.getParameter("deptno");
 	if(pDeptno == null || pDeptno.equals("")){
 		pDeptno = "10";
 	}
	int deptno = Integer.parseInt(pDeptno); 			
	String sql = "SELECT empno,ename,job,mgr,to_char(hiredate,'yyyy-MM-dd') hiredate,sal,comm,deptno "
			   + "FROM EMP "
			   + "WHERE deptno = ?";
	PreparedStatement pstmt;
	ResultSet rs;
	ArrayList<EmpVO> list = null;
	 int empno;
	 String ename;
	 String job;
	 int mgr;
	 String hiredate;
	 double sal;
	 double comm;
	 EmpVO vo = null;
	
	conn =  DBConn.getConnection();
	
	pstmt = conn.prepareStatement(sql);
	pstmt.setInt(1, deptno);
	rs = pstmt.executeQuery();
	if(rs.next()) {
		list = new ArrayList();
		do {
			empno = rs.getInt("empno");
			ename = rs.getString("ename");
			job = rs.getString("job");
			mgr = rs.getInt("mgr");
			hiredate = rs.getString("hiredate");
			sal = rs.getDouble("sal");
			comm = rs.getDouble("comm");
			
			vo = new EmpVO(empno, ename, job, mgr, hiredate, sal, comm, deptno);
			list.add(vo);
			
		}while(rs.next());
	}
	pstmt.close();
	rs.close();
	DBConn.close();
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
</td>
</tr>
</tfoot>
</table>
</div>
<script>
$(function(){
	let deptno = '${param.deptno}';
	
});
</script>
</body>
</html>

