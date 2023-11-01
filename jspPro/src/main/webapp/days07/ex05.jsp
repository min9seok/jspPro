<%@page import="java.util.Date"%>
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
<h3><span class="material-symbols-outlined">view_list</span> jsp days07</h3>
<div>
 <xmp class="code">
  javascript ajax
  ex05_ajax_info.txt
 </xmp>
 서버 요청 시간 : <%=new Date().toLocaleString() %>
 <br>
 
 <input type="button" value="js ajax" onclick="load('ex05_ajax_info.txt')" />
 <br>
 
 <p id="demo"></p>
 
 
</div>
<script>
 let httpRequest; // XMLHttpRequest 객체
 
function getXMLHttpRequest(){
	if( window.ActiveXObject ){   // IE
        try{
           return new ActiveXObject("Msxml2.XMLHTTP");   // 
        }catch(e){
           try{
             return new ActiveXObject("Microsoft.XMLHTTP");
           }catch(e){
              return null;
           }
        }
  }else if( window.XMLHttpRequest ){
         return new XMLHttpRequest();
  }else{
     return null;
  }
}
 
function load(url){
	// 1. XMLHttpRequest 객체
	httpRequest = getXMLHttpRequest();
	// 2.
	httpRequest.onreadystatechange = callback;
	// 3. open() 요청 설정
	httpRequest.open("GET",url,true);
	// 4. send() 
	httpRequest.send();
}
function callback(){
	if(httpRequest.readyState==4){ // 서버 요청 완료
	  if(httpRequest.status == 200){ // 응답 성공
	    var rtext =  httpRequest.responseText;
		let names = rtext.split(",");
		for(let name of names){
			$("#demo")
			.append(
					$("<li></li>").text(name)
					);
		}
	  }
	}
}

</script>
</body>
</html>

