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
<h3><span class="material-symbols-outlined">view_list</span> jsp days09</h3>
<div>
 <xmp class="code">
  
 </xmp>
<h2>글쓰기</h2>
<form  method="post">
 <table border="1">
   <tr>
     <td colspan="2" align="right">
       <a href="list.do">글목록</a>
     </td>
   </tr>
   <tr>
     <td width="70" align="center">작성자</td>
     <td width="330">
       <input type="text" name="writer" size="12" >
     </td>
   </tr>
   <tr>
     <td width="70" align="center">이메일</td>
     <td width="330">
       <input type="text" name="email" size="30" >
     </td>
   </tr>
   <tr>
     <td width="70" align="center">제목</td>
     <td width="330">
       <!-- 만약에 답글 작성  write.do?num=2&ref=2&step=0&depth=0   부모글의 정보-->
       <input type="text" name="subject" size="50"   
       value='<c:if test="${ not empty param.ref }">[답글]</c:if>' >
     </td>
   </tr>
   <tr>
     <td width="70" align="center">내용</td>
     <td width="330">
       <textarea rows="13" cols="50" name="content"></textarea>
     </td>
   </tr>
   <tr>
     <td width="70" align="center">비밀번호</td>
     <td width="330">
       <input type="password" name="pass" size="10" >
     </td>
   </tr>
   <tr>
     <td colspan="2" align="center">
       <input type="submit" value="글쓰기">
       <input type="reset" value="다시작성">
       <input type="button" value="글목록" 
       onclick="location.href='list.do'">
     </td>
   </tr>
 </table>

</form>
</div>
<script>
</script>
</body>
</html>

