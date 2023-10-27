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
<h3><span class="material-symbols-outlined">view_list</span> jsp days01</h3>
<div>
 <xmp class="code">
  1. 서블릿(Servlet) 
   - 자바 웹 기술
  2. 서블릿 구현 방법(과정)
   1) [서블릿 규약]을 따르는 자바 클래스 선언
       ㄱ. 접근지정자 pubilc
       ㄴ. javax.servlet.http.HttpServlet 클래스 상속
       ㄷ. service(), get(), post() 메서드를 오버라이딩.
   2) 컴파일 -> ???.class (클래스파일)
   3) /WEB-INF/classes 폴더 안에 반드시 클래스 파일을 넣어둔다.
   4) 요청 URL 정하고         URL 매핑
      ㄱ. web.xml 서블릿 등록/URL 매핑
      ㄴ. 서블릿3.0 ~ @WebServlet 어노테이션으로 처리
   5) 브라우저 -> 요청 URL -> 서블릿 -> 응답
  3. 실습 예제
   1) [서블릿 규약]을 따르는 자바 클래스 선언
      days01.Now.java
   2) URL 패턴 설정하는 방법 4가지
      ㄱ. /  MVC 패턴처리
           웹 어플리케이션의 기본 서블릿으로 등록
      ㄴ. *. 확장자
      ㄷ. /경로명/경로명/.../*
      ㄹ. 위의 3가지를 제외한 나머지 하나는 정확한 URL 패턴 경로 지정               
 </xmp>
 <a href="/jspPro/days01/now.html">now.html 서블릿 요청</a>
 <br>
 <a href="/jspPro/days01/now">now 서블릿 요청</a>
 <br>
 <a href="/jspPro/days01/now.ss">now.ss 서블릿 요청</a>
</div>
<script>
</script>
</body>
</html>

