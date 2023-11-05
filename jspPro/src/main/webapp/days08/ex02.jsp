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
  XML -> JSON 형식을 ajax 더 많이 사용
 </xmp>
 <button onclick="getPersonJSON()">로컬 저장소 값 사용</button>
 <p id="demo"></p>
</div>
<script>
//  1. js Object
 var person = {
   name:"ky"
  ,age:29
  ,city:"seoul"
 };
//  2. person js Object -> JSON 변환
 let personJSON = JSON.stringify(person);
//  console.log(personJSON);
//  3. 로컬 저장소  personJSON 저장
 localStorage.setItem("personJSON", personJSON);
</script>
<script type="text/javascript">
function getPersonJSON(){
 let personJSON = localStorage.getItem("personJSON");
//  alert(personJSON);
 let person = JSON.parse(personJSON);
//  json -> js Object 변환  : JSON.parse()
 $("#demo").html(person.name + person.age + person.city);
//  localStorage.removeItem("personJSON");
//  localStorage.clear();
 
}
</script>
</body>
</html>

