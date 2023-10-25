<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Ky Ky Ky Ky</title>
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
    1. JSPClass 작업 폴더 생성
    2. encoding : UTF-8
       html, css 등 모든 encoding : UTF-8
    3. Installed JREs : jdk-11.0.17 설정  
    4. Compiler       : 11 설정
    5. Dynamic Web Project  생성 
       ㄱ. 프로젝트명 : jspPro 
       ㄴ. web.xml
    6. webPro
       ㄴ resources 폴더 
       ㄴ images 폴더  
    7. html  , jsp  템플릿 설정   
    8. Web Brower : Chrome 설정    
    9. webapp
       ㄴ days01
           ㄴ ex01.jsp  
    10. server.xml : 63 줄 80 포트 수정  
 </xmp>
 <xmp>
 1. JSP/Servlet ? Java 웹 기술
   ㄱ. Servlet
   ㄴ. JSP 
 2. 웹 프로그래밍
    웹서버  <-요청(request)-       클라이언트
          -응답(response)->
          전송 데이터를 생성해주는 프로그램    
 3. JSP = Java Server Page
         자바언어 + 서버에서 실행되는 페이지
 4. 처리 과정
   클라이언트                  웹서버   +   WAS(웹 어플리케이션 서버)
   (브라우저)    -> 요청 ->     (아파치) ->  (톰캣), 웹로직, 제티, JBoss 등등
                                      [톰캣, 웹 컨테이너]
   ex01.jsp                       ->  서블릿 클래스 변환
                                       서블릿 객체 생성
              <- 응답 <-
 5. 톰캣(WAS) = 자바코딩 컴파일,실행
                  javac.exe  java.exe
               JAVA_HOME  bin 폴더         
    1) JAVA_HOME 환경설정
    2) CATALINA_HOME  = C:\apache-tomcat-8.5.XX  환경설정.
    3) Path  =  %CATALINA_HOME%\bin  추가                     
 6. WAS(톰캣 8.5.xx)
    JSP 2.3
    Servlet 4.0
    EL 3.0
 7. ex02.html  정적 자원
    ex02.jps   동적 자원
        
 </xmp>
 <xmp>
 [2주 JSP 수업 내용]
 1. JSP 페이지의 구성요소
 2. JSP 3가지 지시자 - page,include,taglib
 3. JSP 스크립트 - 스크립트릿,표현식,선언문 
 4. JSP 처리 과정
 5. 웹 어플리케이션 배포
 6. 페이지 모듈화
 7. 자바빈(java bean)과 액션태그
 8. JSP 쿠키, 세션 - 상태관리
 9. EL 3.0 (표현언어)
    Expression Language
 10. JSTL( 표준 태그 라이브러리)
 11. 커넥션풀 (Connection Pool)
 12. 서블릿(Servlet)
 13. MVC 패턴
 14. 필터(Filter)
 15. ServletContextListener
 16 실습 예제
   방명록
   게시판
   답변형 게시판
   파일 첨부 게시판(자료실)
   회원가입 + 인증처리
 </xmp>
</div>
<script>
</script>
</body>
</html>

