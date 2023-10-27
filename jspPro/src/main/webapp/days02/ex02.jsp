<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
  [서블릿]
  1. 서블릿 규약 클래스
  2. 서블릿 등록 + URL 매핑
     1) web.xml
     2) @ 어노테이션 사용
 </xmp>
<!-- <a href="Hello">Hello 서블릿 호출</a> -->
<a href="/jspPro/Hello">Hello 서블릿 호출</a>
<br>
<a href="/jspPro/days02/Hello.html">Hello.html 서블릿 호출</a>
<br>
</div>
<script>
</script>
</body>
</html>

