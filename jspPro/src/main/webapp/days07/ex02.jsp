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
  1. MVC 패턴
  2. 세션 - 인증 처리, 권한 처리, 장바구니
  3. 페이징 모듈화
  4. 필터(Filter)
   1) http 요청 - 자원 접근 권한
                 파라미터 유무
                 사전에 체크할 수 있다.
                 요청 취소
           응답 - xml > JSON 변환
                 암호화 처리
  5. 처리 과정           
<!--                 다중필터(필터체이닝)가능 -->
  [클] > list.do 요청 > 필터 url패턴 > [서버] 처리
      <    응답      < 필터(xml>json 변환)
      
  6. 필터 구현시 핵심 3개 타입 
   1) javax.servlet.Filter 인터페이스 구현
      (1) init() 필터 초기화 메서드 오바라이딩
      (2) destroy()
      (3) *** doFilter() *** : 필터링할 작업. 코딩.
          암호화, 인증, 권한 체크
          > 다음 이동 chain.doFilter()
   2) ServletRequestWrapper 요청을 포장(변경)한 결과를 저장하는 객체      
   3) ServletResponseWrapper 응답을 포장(변경)한 결과를 저장하는 객체
  7. 필터 클래스를 사용하려면
    lib폴더 안에 servlet-api.jar 파일 추가
    이클립스 개발할 경우 추가할 필요 없다 (서버에 자동으로 있네?)
  8. 필터클래스 선언
     필터클래스 1) web.xml 등록
             2) @WebFilter 어노테이션
  9. 실습
    ex02_02.jsp  
    ex02_02_ok.jsp  
 </xmp>

</div>
<script>
</script>
</body>
</html>

