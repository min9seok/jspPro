<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="shortcut icon" href="http://localhost/images/SiSt.ico">
<link rel="stylesheet" href="/resources/cdn-main/example.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="/resources/cdn-main/example.js"></script>
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
<h3><span class="material-symbols-outlined">view_list</span> jsp days01</h3>
<div>
 <xmp class="code">
  js or jquery 사용해서 
  정수를 입력받아 엔터치면 결과물이 demo 출력
 </xmp>
 	정수 : <input type="text" id="num" name="num" /><br>
<!-- 	정수 : <input type="number" id="num" name="num" /><br> -->
 <p id="demo"></p>
</div>
<script>
$(function(){
	$("#num").css("text-align","center").keyup(function(){		
		if(event.which==13){
			$("#demo").html("");
			var num = $(this).val();
			let sum = 0;
			for (var i = 1; i <= num; i++) {
				sum+=i;
				$("#demo").html(function(index,oldhtml){
					return oldhtml + i + (i==num?"":"+");
				});
			}
			$("#demo").html(function(index,oldhtml){
				return oldhtml + "=" + sum;
			});	
			$(this).select();
		}
	});
});
</script>
</body>
</html>

