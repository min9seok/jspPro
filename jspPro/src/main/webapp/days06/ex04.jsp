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
 <xmp class="code">
  표현언어(Expression Language == EL 3.0)
  1. 다른 형태의 스크립트 언어
  2. 스크립트 요소 중에 하나.
  3. 표현식보다 간결하고 편리하다.
  4. JSP 2.0에서부터 EL 포함.
  
  5. EL 기능
    1) jsp 4가지 기본 영역     EL 내장 객체
        page scope  => pageContext
        request     => requestScope
        session     => sessionScope
        application => applicationScope 
    2) EL 연산자
      ==, eq, !=, ne, not, !, empty
    3) 자바클래스의 메서드 호출 가능 
    4) 람다식 사용 ( EL 3.0)
    5) 쿠키, jsp 기본 내장 객체
    6) 스트림 API, 정적 메서드 실행
    
  6. EL 형식
    ${ expression }
    
  7. JSP 기본 내장 객체 : 9가지
     EL 기본 내장 객체
     1) param == request.getParmeters()
       list.jsp?age=10 
       ${param.age}
       list.jsp?name=aaa&name=bbb
       String[] request.getParmeterValues("name");
       ${ paramValues}
     2) pageConext == page 객체 동일
     3) pageScope, request, session, application
     4) request.getHeader()     
     5) cookie
     6) initParam == application.getInitparameter
     
 </xmp>

</div>
<script>
</script>
</body>
</html>

