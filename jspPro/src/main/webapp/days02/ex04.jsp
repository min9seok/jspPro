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
  [jsp 스크립트 요소]
  1. 스크립트릿
  2. 표현식
  3. 선언문  
 </xmp>
<%
 //스크립트릿
 String name = "홍길동";
%>
<%= "표현식, 출력" %>

<%!
 //선언문 - 변수, 메서드
 int age = 20;

 public String printMsg(String msg){
	 return "안녕 : "+msg;
 }
%>
 이름 : <%=name %><br>
 나이 : <%=age %><br>
 메서드 호출 : <%=printMsg("헬로우") %> <br>
 <hr>
<%
 int sum = 0;
 for(int i =1; i<=10; i++){
 %><%=i %>+<%
	 sum+=i;
 }
%>=<%=sum%>
</div>
<script>
</script>
</body>
</html>

