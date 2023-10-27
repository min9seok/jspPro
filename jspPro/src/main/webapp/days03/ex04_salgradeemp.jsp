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
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script> -->
<script src="/jspPro/resources/cdn-main/example.js"></script>

<style type="text/css">
.material-symbols-outlined {
	vertical-align: text-bottom;
}
</style>
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<link rel="stylesheet" href="https://jqueryui.com/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
  <script>
  $( function() {
    $( "#accordion" ).accordion();
    $( "#tabs" ).tabs();
  } );
</script>
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
<h3><span class="material-symbols-outlined">view_list</span> jsp days03</h3>
<div>
 <xmp class="code">
  [ ex04_salgradeemp.jsp]
 </xmp>
<div id="accordion">
<c:forEach var="entry" items="${map}">
     <h3>${entry.key }</h3>
  <div>
    <p>
      <ul>
         <c:forEach var="vo" items="${entry.value}">
           <li>${vo.deptno } ${vo.empno } ${vo.ename } ${vo.sal }</li>
         </c:forEach> 
      </ul>
    </p>
  </div>
</c:forEach>
</div>
<hr>
<div id="tabs">
  <ul>
 
    <c:forEach var="entry" items="${map}">
      <li><a href="#tabs-${entry.key.grade }">${entry.key.grade }등급</a></li>     
    </c:forEach>    
  </ul>
    <c:forEach var="entry" items="${map}">
      <div id="tabs-${entry.key.grade }">
        <p>
          <c:forEach var="vo" items="${entry.value}">
            <li>${vo.deptno } ${vo.empno } ${vo.ename } ${vo.sal }</li>
          </c:forEach> 
        </p>
      </div>    
    </c:forEach>


</div>


</div>
<script>
</script>
</body>
</html>

