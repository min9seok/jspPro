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
  jq ajax  : JSON/JS/XML 등등
  
    - GET  : getJSON(), getScript(), get()
    - POST : POST()
        
    GET/POST : load()  $.ajax()
 </xmp>
<h2>회원 가입 페이지</h2>
<form action="" method="get">
    deptno : <input type="text" name="deptno" value="10" /><br>
    empno : <input type="text" name="empno" value="7369" />
    <input type="button" id="btnEmpnoCheck" value="empno 중복체크 - jquery ajax" />
    <p id="notice"></p>
    <br>
    ename : <input type="text" name="ename" value="" /><br>
    job : <input type="text" name="job" value="" /><br>
    <input type="submit" value="회원(emp) 가입" />
 </form>
</div>
<script>
$(function(){
	$("#btnEmpnoCheck").click(function(){
	  let params = $("form").serialize();
// 	  alert(params);
	  $.ajax({
         type:"GET"
        ,url:"ex04_idcheck.jsp"
        ,dataType:"JSON"
        ,data: params
        ,cache: false
//         ,success: function(data, textStatus, jqXHR){
// 			alert(data.count);
	    ,success: function(result){
//         	alert(result.count);
			if(result.count==1){
				$("#notice").css("color","red").text("이미 사용중~");
			}else{
				$("#notice").css("color","red").text("사용 가능~");
			}			
		 }         
        ,error: function(jqXHR, textStatus, errorThrown){
        	alert('error'); 
         }
			
	  });	
	});
	
});
</script>
</body>
</html>

