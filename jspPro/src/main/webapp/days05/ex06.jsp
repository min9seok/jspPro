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
  [JS 쿠키(cookie) document.cookie 속성]
  [JSP 쿠키(cookie) ]
  
  - 쿠키 ?
  클라이언트(브라우저)에 텍스트 형식의 저장된 파일
  - 상태관리
  - JSP 쿠키 생성 + 처리 과정 이해
   1) 클라이언트 > 요청(쿠키) > 서버 
  					      쿠키생성
	 		  < 응답
      클라이언트
     X 쿠키저장
      클라이언트 > 요청(X 쿠키) > 서버 X 쿠키
       						 X 쿠키삭제,수정
   			  < 응답
      클라이언트
      X 쿠키 삭제,수정   
  - JS 쿠키 : document.cookie 속성 생,확,삭,수
  - JSP 쿠키 :
    1) Cookie 클래스 > 쿠키 생성
    2) 응답 클라이언트
       response.addCookie(생성된 쿠키)
  - 쿠키 수성
    1) "쿠키이름=쿠키값;_만료시점=X;_도메인=localhost;_경로=/;_보안"
    만료시점-1 - 브라우저 닫을 떄 자동 쿠키 제거
    만료시점 0 - 쿠키 제거
         별도의 만료시점을 설정하지 않으면 브라우저가 종료될 때 쿠키 제거
         
  - 실습
    ex06_02.jsp                   
    ex06_02_ok.jsp                   
 </xmp>
 <a href="ex06_02.jsp">ex06_02.jsp 쿠키 생성</a><br>
 <a href="ex06_03.jsp">ex06_03.jsp 쿠키 확인</a><br>
</div>
<script>
</script>
</body>
</html>

