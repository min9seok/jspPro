<%@page import="java.net.URLDecoder"%>
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
  ex06_03.jsp
 </xmp>
 <form action="">
 <%
  // js document.cookie
  Cookie[] cookies = request.getCookies();
 for(Cookie c : cookies){
	 String cname = c.getName();
	 // 주의) 인코딩 > 디코딩 
// 	 String cvalue = c.getValue();
	 String cvalue = URLDecoder.decode(c.getValue(),"UTF-8");
//    System.out.printf(">domain:%s, path:%s, maxAge:%d\n",c.getDomain(),c.getPath(),c.getMaxAge());
%>
<input type="checkbox" name="ckbCookie" value="<%=cname %>" />
<%=cname %> - <%=cvalue %>
<br>
<%
 }
 %>
 </form>
 <a href="ex06.jsp">쿠키 Home</a><br><br>
 <a href="ex06_02.jsp">쿠키 생성</a><br>
 수정, 삭제할 쿠키를 체크 한 후 쿠키 수정, 삭제<br>
 <a href="ex06_04.jsp">쿠키 삭제</a><br><br>
 <a href="ex06_05.jsp">쿠키 수정</a><br><br>
</div>
<script>
// $("a").click(function(event){
// 	event.preventDefault(); //
// 	let url = $(this).attr("href");
// 	$("form").attr("action",value).submit();
// });
$("a").click(function(event){
	event.preventDefault(); //
	let url = $(this).attr("href");
	
 let queryString =	$("form").serialize(); // 직렬화
//  alert(str);
 location.href = `\${url}?\${queryString}`;
});
</script>
</body>
</html>

