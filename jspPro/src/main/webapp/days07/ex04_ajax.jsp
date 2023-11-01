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
<h3><span class="material-symbols-outlined">view_list</span> jsp days07</h3>
<div>
 <xmp class="code">
  1. Ajax 에이작스 아작스
  [A]synchronous [J]avascript [A]nd [X]ml
      비동기적인      자바스크립트     +    XML
  > XML 데이터를 자바스크립트언어를 사용해서 비동기적으로 처리하는 기술
  
  2. 비동기적
   페이지 로드 된 후에도 웹 서버에서 데이터를 읽어와서 사용 가능
   페이지 전체가 새로 고침되지 않고 웹 페이지 일부분만 업데이트 가능
   현재 페이지 유지된 채로 백그라운드에서 웹 서버와 통신하는 것
  3. 네이버 메인 페이지에서 환율, 증시, 날씨 정보
   - 회원 가입
    ㄴ 아이디 중복체크 등등
  4. ajax 장점
    성능 향상
    개발 향상
   각각 서버로 부터 분산 처리 가능
  5. ajax 단점
    js 보안적인 측면 취약
    차별화 X
    브라우저 호환성 체크
  6. js ajax 처리과정
   1) 웹 페이지에서 이벤트 발생
   2) XMLHttpRequest 객체 생성
   3) XMLHttpRequest 객체 설정
     ㄱ. 요청 설정 
       open() 메서드 - 요청 필요한 설정
       send() 메서드 - 실제 서버에 요청
     ㄴ. XMLHttpRequest 객체.onreadystatechange 이벤트 속성
       = function(){
           if(state = 200, readState = 4){
             1) 텍스트 : responsText 속성
             2) xml  : responsXML 속성
           }
         } 
   4) get 방식 ajax 요청
     XMLHttpRequest객체.open("GET","/test.jsp?id=admin",true);
     XMLHttpRequest객체.send();
      post 방식 ajax 요청
      XMLHttpRequest객체.open("POST","/test.jsp",true);
     XMLHttpRequest객체.send("id=admin");
     
     [실습] ex05.jsp         js  ajax   
           ex05_02.jsp      jq  ajax
           
           ex05_ajax_info.txt
           
  ***7. jq ajax
 </xmp>

</div>
<script>
</script>
</body>
</html>

