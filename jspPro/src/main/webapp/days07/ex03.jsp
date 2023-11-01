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
<c:choose>
 <c:when test="${empty auth }">
   <li><a href="/jspPro/days07/member/logon.jsp">로그인</a></li>
 </c:when>
 <c:otherwise>
   <li><a href="/jspPro/days07/member/logout.jsp">[${auth }] 로그아웃</a></li>
 </c:otherwise>
</c:choose>
	<li><a href="/jspPro/days07/member/join.jsp">회원가입</a></li>
</ul>
</header>
<h3><span class="material-symbols-outlined">view_list</span> jsp days07</h3>
<div>
 <xmp class="code">
  필터 예제 - 요청  인증,권한
  LoginCheckFilter.java
  
  days07.admin : 관리자만 사용 가능
        회원관리.jsp 
        급여관리.jsp
     필터 : 관리자 인증/권한 체크   
  days07.board : 관리자외 사용 가능
        글목록.jsp
        글쓰기.jsp
  days07.member : 제한없음
        회원가입.jsp
        로그인.jsp
 </xmp>
<a href="${pageContext.request.contextPath }/days07/board/list.jsp">글목록</a><br>
<a href="/jspPro/days07/board/write.jsp">글쓰기</a><br>
<a href="/jspPro/days07/admin/member.jsp">회원관리</a><br>
</div>
<script>
</script>
</body>
</html>

