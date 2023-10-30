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
  [ jsp 예외처리 방법 ]
  1. try ~ catch ~ finally 문 사용
  2. 예외 처리하는 예외 페이지를 지정
    ㄴ /WEB-INF 폴더 안
      ㄴ error 폴더
        ㄴ viewErrorMessage.jsp
  3. 예외 처리의 우선 순위
    1) page 지시자 errorPage 
    2) 예외 타입별 처리 
    3) 예외 코드별 처리
    
    4) 웹컨테이너가 제공하는 기본 에러 페이지 
 </xmp>
 <%
 String name = null;
  try{	
	  name = request.getParameter("name");
	  name = name.toUpperCase();
  }catch(NullPointerException e){
	  name = "익명";
  }catch(Exception e){

  }
 %>
 name 파라미터값 : <%=name %><br><br>
 
 <a href="ex1000.jsp">ex1000.jsp</a>
</div>
<script>
</script>
</body>
</html>

