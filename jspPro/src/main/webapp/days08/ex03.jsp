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
  ex03_dept.xml
  ex03_dept.json
 </xmp>
<button type="button" onclick="loadJSON()">ex03_dept.json</button>
 <br />
 <br />
 <p id="demo"></p>
</div>
<script>
function getXMLHttpRequest(){
	   if(window.ActiveXObject){  // IE          6
	      try {
	         return new ActiveXObject("Msxml2.XMLHTTP");
	      } catch (e) {
	         try {
	            return new ActivXObject("Microsoft.XMLHTTP");
	         } catch (e) {
	            return null;
	         }

	      }
	   }else if(window.XMLHttpRequest){
	      return new XMLHttpRequest();       
	   }else {
	      return null;
	   }
	}
function loadJSON(){
 let xhr = getXMLHttpRequest();
 xhr.onreadystatechange = function(){
	if(this.readyState == 4 && this.status == 200){
	  let deptJSON = this.responseText;	  
	  let dnameArr = [];
	  var deptjs = JSON.parse(deptJSON);
	  for (var i = 0; i < deptjs.departments.length; i++) {
	    let  dept = deptjs.departments[i];
	    dnameArr.push(dept.dname);
	  }
	 $("#demo").html("<li>"+dnameArr.join("</li><li>")+"</li>");
	}
}
 xhr.open("GET","ex03_dept.json",true);
 xhr.send();
}
</script>
</body>
</html>

