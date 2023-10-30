<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="/WEB-INF/error/viewErrorMessage.jsp" %>
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
     ex01_02.jsp 예외 발생하면 viewErrorMessage(예외페이지)로 이동 -> 응답
  3. [WEB-INF 폴더 안에 설정파일 - web.xml]
   1) 응답 상태 코드별로 예외 페이지 지정
    ex01.jsp
     ㄴ a href="ex1000.jsp" 추가
     web.mxl 404 > 404.jsp 설정 코딩 추가
     
     [응답 상태 코드]
     404 : 요청URL 처리하기 위한 자원이 존재하지 않음
     500 : 서버 내부 에러가 발생( 자바 코딩 X)
     200 : 요청을 정상적으로 처리
     401 : 접근을 허용하지 않음
     400 : 클라이언트의 요청이 잘못된 구문으로 구성된 경우
     403 : 요청 메서드 방식 지원 X
     등등
   2) 예외 ㅏ입별로 예외 페이지 지정
     [예외 타입]
     NullPointerexception
     XXXEXception
     
 </xmp>
 <%
 	  String name = null;
	  name = request.getParameter("name");
	  name = name.toUpperCase();

 %>
 name 파라미터값 : <%=name %><br>
 
</div>
<script>
</script>
</body>
</html>

