<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
 String path = request.getContextPath();
 String id = (String) session.getAttribute("id");
%>
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
	<a href="#" style="position: absolute;top:30px;">Home</a>
</h1>
<c:choose>
<c:when test="${empty id }">
<ul>
	<li><a href="logon.jsp">로그인</a></li>
	<li><a href="join.jsp">회원가입</a></li>
</ul>
</c:when>
<c:otherwise>
<ul>
       ${vo.name}  님 환영합니다<br>  
       <a href="logout.jsp">로그아웃</a>
</ul>
</c:otherwise>
</c:choose>
</header>
<h3><span class="material-symbols-outlined">view_list</span> jsp days00</h3>
<div>
 <xmp class="code">
  설문 수정
 </xmp>
 <h2>글 수정</h2>
 <form method="POST">
   <table>
     <tr>
       <td colspan="2" align="center"><b>글을 수정합니다</b></td>
     </tr>
     <tr>
       <td align="center">이름</td>
       <td><input type="text" name="writer" size="15" disabled value="${dto.writer}"></td>
     </tr>
     <tr>
       <td align="center">비밀번호</td>
       <td><input type="password" name="pwd" size="15" required="required"></td>
     </tr>
     <tr>
       <td align="center">Email</td>
       <td><input type="email" name="email" size="50" value="${dto.email }" ></td>
     </tr>
     <tr>
       <td align="center">제목</td>
       <td><input type="text" name="title" size="50" required="required" value="${dto.title }"></td>
     </tr>
     <tr>
       <td align="center">내용</td>
       <td><textarea name="content" cols="50" rows="10" >${dto.content }</textarea></td>
     </tr>
     <tr>
       <td align="center">HTML</td>
       <td>         
         <input type="radio" name="tag" value="1">적용
         <input type="radio" name="tag" value="0">비적용
         <script type="text/javascript">
           $(":radio[name=tag]").each(function(i, e) {
           	  if(e.value == ${dto.tag}) e.checked = true;
           });         
         </script>
       </td>
     </tr>
     <tr>
       <td colspan="2" align="center">
         <input type="submit" value="수정 하기">&nbsp;&nbsp;&nbsp;          
         <a href="javascript:history.back();">이전으로</a>
       </td>
     </tr>
   </table>
 </form>
</div>
<script>

</script>
</body>
</html>

