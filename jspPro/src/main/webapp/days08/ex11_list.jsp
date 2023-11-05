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
  자료실
 </xmp>
<table align="center">
  <tr>
    <td align="right" colspan="4">
       <a href="/jspPro/days08/write.ss">WRITE</a>
    </td>
  </tr>
  <tr>
    <td align="center" width="50">글번호</td>
    <td align="left" >제목</td>
    <td align="center" width="200">첨부파일</td>
    <td align="center" width="50">삭제</td>
  </tr>  
  <c:if test="${ empty list }">
    <tr>
      <td  colspan="4">
           게시글이 존재 X
      </td>
    </tr>
  </c:if>
  <c:forEach items="${ list }" var="dto">
     <tr>
       <td align="center" width="50">${ dto.num }</td>
       <td align="left" >${ dto.subject }</td>
       <td align="center" width="200">
       <c:choose>
       <c:when test="${ not empty dto.originalfilename}">
         <a href="/jspPro/days08/upload/${ dto.filesystemname }">${dto.originalfilename }</a>
         </c:when>
         <c:otherwise>없음</c:otherwise>
       </c:choose>
         </td>
       <td align="center" width="50">
          <a href="delete.ss?num=${ dto.num }&filesystemname=${ dto.filesystemname}">삭제</a>
          <a href="update.ss?num=${ dto.num }&filesystemname=${ dto.filesystemname}">수정</a>
       </td>
     </tr>
  </c:forEach>
</table>
</div>
<script>
</script>
</body>
</html>

