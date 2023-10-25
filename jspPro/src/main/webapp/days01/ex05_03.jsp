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
<h3><span class="material-symbols-outlined">view_list</span> jsp days01</h3>
<div>
 <xmp class="code">
  submit() 하여 서버 작업후 demo에 입력
 </xmp>
 <form>
 	정수 : <input type="text" id="num" name="num" /><br>
</form>
 <p id="demo">
 <%
   // 암기
   // ex05_02.jsp    null
   // ex05_02.jsp?num=    ""
   // ex05_02.jsp?num=5    "5"
  String num = request.getParameter("num");
 int n ;
 int sum=0;
 if(num != null && !num.equals("")){
	 n= Integer.parseInt(num);
	 for(int i=1; i<=n; i++){
		 %><%=i %>+<%
				 sum+=i;
	 }
	 %>=<%=sum %><%
 }
 %>
 </p>
</div>
<script>
$(function (){
	$("#num").val("");
	  $(":text[name=num]")
	    .css("text-align","center")
	  	.val('${param.num}')
	    .keyup(function(event) {	    	
	    	if(event.which == 13){	    			    		
	    	} // if	    	
	    });
// 	 var input = '${param.num}';
// 	 $("#num").val(input);
	 $("#num").select();
});
</script>
</body>
</html>

