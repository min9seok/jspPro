<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<h3><span class="material-symbols-outlined">view_list</span> jsp days02</h3>
<div>
  <xmp class="code">
  
  </xmp>   
<form action="ex06_02.jsp" method="GET"> 
   이름 : <input type="text" name="name" value="밥줘" placeholder="이름을 입력하세요" autocomplete="off"><br>
   성별 : 
     <input type="radio" name="gender" value="m" checked autocomplete="off"> 남자
     <input type="radio" name="gender" value="f" autocomplete="off">여자<br>    
   좋아하는 동물 :
      <input type="checkbox" name="pet" value="dog" checked autocomplete="off">개 
      <input type="checkbox" name="pet" value="cat" autocomplete="off">고양이
      <input type="checkbox" name="pet" value="pig" checked autocomplete="off"> 돼지
      <br>    
   <input type="submit" autocomplete="off">
</form>
</div>
<script>
</script>
</body>
</html>

