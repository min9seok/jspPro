<%@page import="java.util.Arrays"%>
<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
 <%
 	request.setCharacterEncoding("UTF-8");
 	String name = request.getParameter("name");
 	String gender = request.getParameter("gender");
 	if(gender.equals("m")){
 		gender = "남자";
 	}else{
 		gender = "여자";
 	}
 	String[] pet = request.getParameterValues("pet"); 
 %>
 이름 : <%=name %>  <br>
 이름(EL) : ${param.name} <br>
 성별 : <%=gender %> <br>
 좋아하는 동물 : <%= Arrays.toString(pet) %>
<%--  <% --%>
<!--  for(int i=0; i<pet.length; i++){ -->
<!-- %> -->
<%-- <%=pet[i] %>&nbsp; --%>
<%-- <%  --%>
<!--  	} -->
<%-- %> --%>
 <br>
<h3>요청 파라미터명 조회</h3>
<%	
 Enumeration<String> en = request.getParameterNames();
	while( en.hasMoreElements()){
		String pname = en.nextElement();
%><li><%=pname %></li><%		
	}
%>
</div>
<script>
</script>
</body>
</html>

