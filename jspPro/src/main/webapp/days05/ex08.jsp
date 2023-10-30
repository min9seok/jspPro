<%@page import="com.util.ConnectionProvider"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.sql.Connection"%>
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
<h3><span class="material-symbols-outlined">view_list</span> jsp days05</h3>
<div>
 <xmp class="code">
  커넥션 풀(connection Pool)
  1. DBCP 이용 커넥션 풀 사용
  *** 2. WAS(톰캣)을 이용한 커넥션 풀 사용 ***
       1) tomcat-dbcp.jar 추가
       2) 커넥션 풀 설정 ...
         META-INF 폴더 context.xml
 </xmp>
<%
// Context initContext = new InitialContext();
// Context envContext  = (Context)initContext.lookup("java:/comp/env");
// DataSource ds = (DataSource)envContext.lookup("jdbc/myoracle");
// Connection conn = ds.getConnection();

 Connection conn = ConnectionProvider.getConnction();
%>
conn = <%=conn %><br>
conn.state = <%=conn.isClosed() %><br>
<%
 conn.close();
%>
</div>
<script>
</script>
</body>
</html>

