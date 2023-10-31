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
<h3><span class="material-symbols-outlined">view_list</span> jsp days06</h3>
<div>

<a href="/jspPro/board/list.do">/board/list.do</a><br>
<a href="/jspPro/board/write.do">/board/write.do</a><br>
 <xmp class="code">
  1.days05/ex05_02.jsp 회원가입 페이지로 사용
    bmember 테이블 생성
  2.days06/ex01_default.jsp 로그인 페이지로 사용
  3.header 세션따라 로그인 회원가입 or 로그인한사람 이름 환영합니다 로그아웃 뜨도록
  4. 글쓰기 버튼은 로그인 해야지만 사용할 수 있도록 처리
  5. 상세보기에서
     수정하기 삭제하기 Home
     수정하기,삭제하기는 로그인한 사람이 작성자일경우에만 버튼 보이게 세션처리   
 </xmp>
 <xmp class="code">
  모델2 MVC 패턴 
  - 자바 개발자라면 반드시 습득해야 할 기본 기법
  - MVC 패턴 이해
  
  모델1구조 모델2구조
  -JSP 웹 애플리케이션의 구조는 모델1 모델2 구조로 나뉜다.
    1) 모델1구조
    list.jsp > 요청 > list.jsp
             < 응답 <
    2) 모델2구조
    list.jsp > 요청 > 서블릿 응답 결과물 생성
                   > 출력 담당 list.jsp
             < 응답 <
             
    MVC 패턴         
    모델(Model) : 비즈니스 영역 ( 로직 처리)
    뷰(View)   : 프리젠테이션 영역 ( 화면 담당)
    컨트롤러(Controller) : 요청 > 응답 컨트롤 담당
    
    MVC 패턴 처리 과정
    A[write.htm] > 요청
                                              핸들러(커맨드) > 서비스 > DAO > DB
    B[list.htm]  > 요청  > 컨트롤러 > 요청(로직처리) > 모델
    C[logon.htm] > 요청
                         결과물(모델) > 뷰(Write.jsp)
                 < 응답   출력담당 파악
     
    [실습]
    1.days04.board 폴더 
      d
      e
      l
      v
      w
    
    2. days04.board : 서블릿          
       days04.board.domain : VO , DTO
       days04.board.persistence : DAO
       
    MVC 패턴으로 수정    
    1) 모든 요청은 컨트롤러에서 받는다.
    2) list.htm 등 모든 요청 > 하나의 서블릿 처리    
    3) DispatcherServlet.java
       1. 모든 요청 > 모델 처리 파악(매핑)
          파일 선언 - commandHandler.properties
          list.do=ListHandler
          writer.do=writerHandler
       2. 결과물 저장
       3. 리다이렉트, 포워딩 결정
    4) 모델(커맨드핸들러)
       인터페이스 CommandHandler
    5) DAO DTO 복사 
    6) service 패키지 추가
    7) jsp 복사
 </xmp>

</div>
<script>
</script>
</body>
</html>

