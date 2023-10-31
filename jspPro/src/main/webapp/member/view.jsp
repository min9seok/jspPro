<%@page import="days04.board.domain.BoardDTO"%>
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
<title>설문 작성</title>
<link rel="shortcut icon" href="http://localhost/jspPro/images/SiSt.ico">
<link rel="stylesheet" href="/jspPro/resources/cdn-main/example.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="/jspPro/resources/cdn-main/example.js"></script>
<style type="text/css">
.material-symbols-outlined {
	vertical-align: text-bottom;
}
</style>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="https://www.jquery.com/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script> 
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
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
       [ <%= id %> ]님 환영합니다<br>
       <a href="logout.jsp">로그아웃</a>
</ul>
</c:otherwise>
</c:choose>
</header>
<h3><span class="material-symbols-outlined">view_list</span> jsp days00</h3>
<div>
 <xmp class="code">
  설문 상세
 </xmp>
<h2>내용 보기</h2>
   <table>     
     <tr>
       <td>이름</td>
       <td>${dto.writer }</td>
       <td>등록일</td>
       <td>${dto.writedate }</td>
     </tr>         
     <tr>
       <td>이메일</td>
       <td>${dto.email }</td>
       <td>조회수</td>
       <td>${dto.readed }</td>
     </tr>
     <tr>
       <td>제목</td>
       <td colspan="3">${dto.title }</td>
     </tr>
     <tr>       
       <td colspan="4" class="full" style="height:200px ">${dto.content }</td>
     </tr>
     <tfoot>
     <tr>
       <td colspan="4" align="center">
       <c:choose>
         <c:when test="${dto.writer eq id }">
          <a href="<%=path%>/member/edit.do?seq=${dto.seq}">수정하기</a>
          <a href="<%=path%>/member/delete.do?seq=${dto.seq}">삭제하기</a>
          <input type="button" id="modal" value="모달삭제" />
          </c:when>          
       </c:choose>          
<!--           <a href="javascript:history.back()">Home</a> -->
		  <a href="<%= path %>/member/list.do">Home</a>
       </td> 
     </tr>
     </tfoot>              
   </table>
</div>
<!--  삭제 모달 창 -->
<div id="dialog_form" align="center" title="삭제">
<h2>삭제하기</h2>
 <form method="POST" action="<%=path%>/member/delete.do?seq=${param.seq}">
 <table>
   <tr>
     <td colspan="2" align="center">
       <b>글을 삭제합니다.</b> 
     </td>
   </tr>
   <tr>
     <td>비밀번호</td>
     <td><input type="password" name="pwd" size="15" autofocus /></td>
   </tr>
   <tr>
     <td colspan="2" align="center">
     <input type="submit" value="삭제">&nbsp;&nbsp;&nbsp;
     <input type="button"onclick="window.close();" value="취소" id="cancel"> 
     </td>
   </tr>
 </table>
 <span style="color:red;display: none" id="spn">비밀번호가 잘못되었습니다.</span>
</form>
</div>
<script type="text/javascript">
let dialog  = $("#dialog_form").dialog({
	autoOpen: false,
    height: 400,
    width: 350,
    modal: true,
    buttons:{},
    close: function (){
       form[0].reset();
    }
});
$( "#modal" ).on( "click", function() {
    dialog.dialog( "open" );
  });
$( "#cancel" ).on( "click", function() {
    dialog.dialog( "close" );
  });
  form = dialog.find("form")
</script>
<script>
$(function(){
	// list.htm?write=success
  if('<%= request.getParameter("edit")%>'=="success" ){
	  alert("글 수정 성공");
  }
  if('<%= request.getParameter("delete")%>'=="fail" ){	  
	  dialog.dialog( "open" );
	  $("#spn").show().slideToggle(3000);
	  history.replaceState({}, null, location.pathname);
  }
});
</script>
<script type="text/javascript">
$("tfoot a:last-of-type").attr("href",function(i,oldhref){
	return `\${oldhref}?currentpage=${param.currentpage}&searchCondition=${param.searchCondition}&searchWord=${param.searchWord}`;  
})
$("tfoot a:not(a:last-of-type)").attr("href",function(i,oldhref){
	return `\${oldhref}&currentpage=${param.currentpage}&searchCondition=${param.searchCondition}&searchWord=${param.searchWord}`;  
})
</script>
</body>
</html>

