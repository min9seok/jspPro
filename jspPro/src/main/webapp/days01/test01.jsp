<%@page import="domain.EmpVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.util.ArrayList"%>
<%@page import="domain.DeptVO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.sql.Connection"%>    
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
%>    
<%
    Connection conn2;
 	String pDeptno = request.getParameter("deptno");
 	if(pDeptno == null || pDeptno.equals("")){
 		pDeptno = "10";
 	}
	int deptno2 = Integer.parseInt(pDeptno); 			
	String sql2 = "SELECT empno,ename,job,mgr,to_char(hiredate,'yyyy-MM-dd') hiredate,sal,comm,deptno "
			   + "FROM EMP "
			   + "WHERE deptno = ?";
	PreparedStatement pstmt2;
	ResultSet rs2;
	ArrayList<EmpVO> list2 = null;
	 int empno;
	 String ename;
	 String job;
	 int mgr;
	 String hiredate;
	 double sal;
	 double comm;
	 EmpVO vo2 = null;
	
	conn2 =  DBConn.getConnection();
	
	pstmt2 = conn2.prepareStatement(sql2);
	pstmt2.setInt(1, deptno2);
	rs2 = pstmt2.executeQuery();
	if(rs2.next()) {
		list2 = new ArrayList();
		do {
			empno = rs2.getInt("empno");
			ename = rs2.getString("ename");
			job = rs2.getString("job");
			mgr = rs2.getInt("mgr");
			hiredate = rs2.getString("hiredate");
			sal = rs2.getDouble("sal");
			comm = rs2.getDouble("comm");
			
			vo2 = new EmpVO(empno, ename, job, mgr, hiredate, sal, comm, deptno2);
			list2.add(vo2);
			
		}while(rs2.next());
	}
	pstmt2.close();
	rs2.close();
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
<select name="deptno" id="deptno">	
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
if(list2 == null){
%>
<tr>
<td colspan="9">사원 없다구용~~</td>
</tr>
<% 
}else{
	Iterator<EmpVO> ir2 = list2.iterator();
	while(ir2.hasNext()){
		 vo2 = ir2.next();
%>	
<tr>
        <td><input type="checkbox" name="ck" /></td>
        <td><%=vo2.getEmpno() %></td>
        <td><%=vo2.getEname() %></td>
        <td><%=vo2.getJob() %></td>
        <td><%=vo2.getMgr() %></td>
        <td><%=vo2.getHiredate()%></td>
        <td><%=vo2.getSal() %></td>
        <td><%=vo2.getComm() %></td>
        <td><%=vo2.getDeptno() %></td>
</tr>	 
<%
	}
}
%> 
</tbody>
<tfoot>
<tr>
<td colspan="9">
 <button id="go" style="margin-left: 45%">확인</button>
</td>
</tr>
</tfoot>
</table>
<p id="demo"></p>
<script>
$(function(){
	let deptno = '${param.deptno}';
	if(deptno==""){
		deptno = "10";	
	}
	$("#deptno").val(deptno);	
	
	$("#deptno").change(function(){
		let deptno = $(this).val(); // 10,20,30,40
		location.href=`test01.jsp?deptno=\${deptno}`;
	});	
});
</script>
<script type="text/javascript">
$(function(){
	$("#go").click(function(){
		var rowData = new Array();		
		var checkbox = $("input[name=ck]:checked");
		checkbox.each(function(i) {
			var tr = checkbox.parent().parent().eq(i);
			var td = tr.children();
			rowData.push(td.eq(1).text());									
			location.href=`test01_02.jsp?empno=\${rowData}`;
		});
	});	
});
</script>
<script type="text/javascript">
let allckb = document.querySelector(".all");
let ckbs = document.querySelectorAll("input[name=ck]");
let button = document.querySelector("button"); 
allckb.onclick = function (){
	  for (var i = 0; i < ckbs.length; i++) {
		  ckbs[i].checked = this.checked;
	  } 
}

for (var i = 0; i < ckbs.length; i++) {
	  ckbs[i].onclick = function (){
		  let isCkbsAllChecked = true;
		  for (var j = 0; j < ckbs.length; j++) {
			  isCkbsAllChecked = ckbs[j].checked
			  if( !isCkbsAllChecked ) break;
	      } 
		  allckb.checked = isCkbsAllChecked;
	  }
} 
</script>
</body>
</html>

