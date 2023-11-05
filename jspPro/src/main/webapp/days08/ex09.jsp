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
  cos.jar 외부 라이브러리 사용 - 파일 업로드
 </xmp>
<form action="ex09_ok.jsp" method="POST" enctype="multipart/form-data">
  메시지 : <input type="text" name="msg" value="아무개" /><br>
  <button type="button">첨부 파일 추가</button>
  <div id="file">
  첨부파일 1 : <input type="file" name="file1" /><br>
  </div>  
  <input type="submit" />
</form>
</div>
<script>
$(function(){
	$("button").click(function(){
		let no = $("#file :file").length +1;
		$("#file").append(`첨부파일 \${no} : <input type="file" name="file\${no}" /><br>`);
	});
});
</script>
</body>
</html>

