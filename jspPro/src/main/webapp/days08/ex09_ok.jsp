<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.FileRenamePolicy"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
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
<h3><span class="material-symbols-outlined">view_list</span> jsp days08</h3>
<div>
 <xmp class="code">
  
 </xmp>
<%
//  ㄴ
 String saveDirectory = pageContext.getServletContext().getRealPath("/days08/upload");
 System.out.println(saveDirectory);
 File f = new File(saveDirectory);
 if(!f.exists()){
	 f.mkdirs();
 }
//  ㄷ
 int maxSize = 5*1024*1024;
//  ㄹ
 String encType = "UTF-8";
//  ㅁ
FileRenamePolicy policy = new DefaultFileRenamePolicy();
 MultipartRequest mr = new MultipartRequest(request,saveDirectory,maxSize,encType,policy); 
%>
 <%=mr.getParameter("msg") %>
 <br>
<%
 Enumeration en = mr.getFileNames();
 while(en.hasMoreElements()){
	 String inputfname = (String)en.nextElement(); // file1 file2	 
	 File attF =  mr.getFile(inputfname);
	 if(attF != null){
		String fname =  attF.getName();
		String realfname = mr.getOriginalFileName(inputfname);
		String sysfname = mr.getFilesystemName(inputfname);
%>		
<hr>
		첨부 파일 이름  : <%=realfname %><br>
		첨부 채번파일 이름  : <%=fname %><br>
		첨부 실제파일 이름  : <%=sysfname %><br>
		첨부 파일 경로 : <%=attF %><br>
		첨부 파일 크기 : <%=attF.length() %>bytes<br>
		첨부 파일 name 이름 : <%=inputfname %><br>
<%
	 }
%>



<%
 }
 %>
</div>
<script>
</script>
</body>
</html>

