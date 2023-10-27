<%@page import="domain.EmpVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	ResultSet rs = null;
	String sql = "SELECT deptno, dname, loc FROM DEPT";
	
	int deptno = 0;
	String dname = "";
	String loc = "";
	
	DeptVO dvo=null;
	ArrayList<DeptVO> dlist = null;
	try {
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		if(rs.next()) {
			dlist = new ArrayList();				
			do {
				deptno = rs.getInt("deptno");
				 dname = rs.getString("dname");
				 loc = rs.getString("loc");
				 dvo = new DeptVO(deptno, dname, loc);
				 dlist.add(dvo);
			}while (rs.next()); 											
		}		
	} catch (SQLException e) {			
		e.printStackTrace();
	}finally {
		try {
			pstmt.close();
			rs.close();
// 			DBConn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}			
	}
%>
<%    
 	String pDeptno = request.getParameter("deptno");
 	if(pDeptno == null || pDeptno.equals("")){
 		pDeptno = "10";
 	}
	deptno = Integer.parseInt(pDeptno); 			
	sql = "SELECT empno,ename,job,mgr,to_char(hiredate,'yyyy-MM-dd') hiredate,sal,comm,deptno "
			   + "FROM EMP "
			   + "WHERE deptno = ?";
	
	ArrayList<EmpVO> elist = null;
	 int empno;
	 String ename;
	 String job;
	 int mgr;
	 String hiredate;
	 double sal;
	 double comm;
	 EmpVO evo = null;
			
	pstmt = conn.prepareStatement(sql);
	pstmt.setInt(1, deptno);
	rs = pstmt.executeQuery();
	if(rs.next()) {
		elist = new ArrayList();
		do {
			empno = rs.getInt("empno");
			ename = rs.getString("ename");
			job = rs.getString("job");
			mgr = rs.getInt("mgr");
			hiredate = rs.getString("hiredate");
			sal = rs.getDouble("sal");
			comm = rs.getDouble("comm");
			
			evo = new EmpVO(empno, ename, job, mgr, hiredate, sal, comm, deptno);
			elist.add(evo);
			
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
<h3><span class="material-symbols-outlined">view_list</span> jsp days02</h3>
<div>
 <xmp class="code">
  
 </xmp>
<select name="deptno" id="deptno">
	<option>선택하세요.</option> 
<%
	Iterator<DeptVO> ir = dlist.iterator();
	while (ir.hasNext()) {
	 dvo = ir.next();
%>
<option value="<%=dvo.getDeptno()%>"><%=dvo.getDname()%></option>
<%	
}
%>
</select>

<h2>emp list</h2>
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
<%
if(elist == null){
%>
<tr>
<td colspan="9">사원 없다구용~~</td>
</tr>
<% 
}else{
	Iterator<EmpVO> eir = elist.iterator();
	while(eir.hasNext()){
		 evo = eir.next();
%>	
<tr>
        <td><input type="checkbox" data-empno="<%=evo.getEmpno()%>" value="<%=evo.getEmpno()%>"/></td>
        <td><%=evo.getEmpno() %></td>
        <td><%=evo.getEname() %></td>
        <td><%=evo.getJob() %></td>
        <td><%=evo.getMgr() %></td>
        <td><%=evo.getHiredate()%></td>
        <td><%=evo.getSal() %></td>
        <td><%=evo.getComm() %></td>
        <td><%=evo.getDeptno() %></td>
</tr>	 
<%
	}
}
%> 
</tbody>
<tfoot>
<tr>
<td colspan="9">
 <span class="badge left red"><%= elist==null?0:elist.size()%></span>
 <a href="javascript:history.back()">뒤로가기</a>
 <button>선택한 empno 확인</button>
</td>
</tr>
</tfoot>
</table>
</div>
<script>
$(function(){
	let deptno = '${param.deptno}';	
	if(!deptno)deptno = "10";
	$("#deptno").val(deptno);
	$("#deptno").change(function(){
		let deptno = $(this).val();
		let url = `http://localhost/jspPro/days02/ex01.jsp?deptno=\${deptno}`;
		location.href = url;
	});
// 	  풀이 1
// 	   $("tfoot button").on("click", function (event){
		   
// 		   // ex01_ok.jsp?empnos=1111/2222/3333 
		   
// 	       let empnos = [];
// 		   // 체크된 체크박스
// 		   $("tbody :checkbox:checked").each(function(i, element) { 
// 			 // DOM 탐색  
// 			 // empno = element.parentElement.nextElementSibling.innerText;
// 			 // data-empno="7569"
// 		   	 let empno = $(element).data("empno");
// 			 empnos.push(empno);
// 		   }); 
// 		   location.href = "ex01_ok.jsp?empnos=" + empnos.join("/"); 
// 	   });	   	  
	    // 풀이 2
	   $("tfoot button").on("click", function (event){		   
		   // ex01_ok.jsp?empno=1111&empno=2222&empno=3333  *** 
		   
	       let empnos = []; 
		   $("tbody :checkbox:checked").each(function(i, element) { 
			 
		   	 let empno = $(element).data("empno");
			 empnos.push(empno);
		   }); 
		   location.href = "ex01_ok_02.jsp?empno=" + empnos.join("&empno="); 
});
});
</script>
<script type="text/javascript">
// 모두 선택
$("#ckbAll").click(function(){
	$("table tbody tr").find("td:first-child :checkbox").prop("checked",$(this).prop("checked"));
});
// 각 사원 선택 
$("table tbody tr")
          .find("td:first-child :checkbox").on("click", function (){
             let ck = $("tbody :checkbox").length == $("tbody :checkbox:checked").length;
             $("#ckbAll").prop("checked", ck );
});
// $(":checkbox.all").click(function(event) {
//     $(":checkbox:not(.all)").prop("checked", $(this).prop("checked"));

//  })
//  $(":checkbox:not(.all)").click(function(event) {
//     let count = $(":checkbox:not(.all)").length;
//     let checkedCount = $(":checkbox:not(.all):checked").length;
//     $(":checkbox.all").prop("checked", count == checkedCount ? true : false);
//  });
</script>
</body>
</html>

