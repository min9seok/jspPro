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
 1.  파일 업로드 클 > 서   
       회원가입 : 가입자 사진 등록
       사이트 : 상품 사진 등록(여러 개)
       자료실 : 게시글 + 첨부파일 
       등등
    파일 다운로드 서 > 클
    
 2. 파일 업로드 주의사항
  1) 스트림 기반의 전송 방식인 method="POST"
  2) 인코딩 설정 enctype: "multipart/form-data"
     기본 인코딩 application/x-www-form-urlencoded 
 
 3. 실습
   1) upload 폴더 추가
   2) ex08.jsp
      ex08_ok.jsp
      ex08_ok_02.jsp
 4. 파일 업로드 방법     
   1) 개발자가 직접 request.getInputStream() 구현 (가능성 낮음)
   2) 외부 라이브러리 사용
    ㄱ. http://www.servlets.com/cos/
    ㄴ. cos.jar WEB-INF 폴더 저장
    ㄷ. request 객체 name, upload 파라미터 값 null X
    cos.jar 제공 MultipartRequest 클래스 제공
           ㄴ 객체 생성해서 파라미터값, 첨부파일 처리
  MultipartRequest m = new MultipartRequest(ㄱ,ㄴ,ㄷ,ㄹ,ㅁ)
    ㄱ - request 객체
    ㄴ - 서버에 저장될 위치(경로)        
    ㄷ - 최대 파일 크기
    ㄹ - 파일의 인코딩 방식
    ㅁ - 파일중복
    [실습]
    ex09.jsp
    ex09_ok.jsp      
   3) 서블릿 3.0 또는 3.1
   
   ㄱ) HttpServletReqeust request 의 [getPart()]를 이용해서 업로드된 데이터(파일) 접근할 수 있는 [Part 객체]
      .getName() : 파라미터 이름
      .getContentType() : Content Type 
      .getSize() : 업로드한 파일 크기
      .getSubmittedFileName() : 업로드한 파일명 
      .getInputStream()  
      .write() : Part의 업로드 데이터를 파일명이 지정한 파일에 복사.
      .delete() : 생성된 임시 파일을 삭제.
      .getHeader() : 해당 Part에서 지정한 이름의 헤더 값을 얻어온다.
      
   ㄴ) 서블릿이 [multipart 데이터]를 처리할 수 있도록
      -  web.xml 설정
      - @MultipartConfig 어노테이션을 사용해서 설정
      예) web.xml 복사 + 붙이기 -> web_days11_replyboard.xml
        ex03.jsp 복사 + 붙이기 -> ex04.jsp
        jspPro/days12/upload ->  UploadServlet.java 서블릿 추가
        
        에러 : java.lang.IllegalStateException: 
        어떤 [multi-part 설정]도 제공되지 않았기 때문에, part들을 처리할 수 없습니다.
      실습)
      ex10.jsp
      days08.UploadServlet.java
      web.xml 설정  
 </xmp>
<form action="" ></form>
</div>
<script>
</script>
</body>
</html>

