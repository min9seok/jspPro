<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
 String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>설문조사</title>
<link rel="shortcut icon" href="http://localhost/jspPro/images/SiSt.ico">
<link rel="stylesheet" href="/jspPro/resources/cdn-main/example.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="/jspPro/resources/cdn-main/example.js"></script>
<style type="text/css">
.material-symbols-outlined {
	vertical-align: text-bottom;
}
/* .title { */
/*    display: inline-block; */
/*    white-space: nowrap; */
/*    width: 90%; */
/*    overflow: hidden; */
/*    text-overflow: ellipsis; */
/* } */
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
<h3><span class="material-symbols-outlined">view_list</span> jsp days04</h3>
<div>
 <xmp class="code">
  설문목록
 </xmp>
 <h2>목록 보기</h2>
 <a href="<%=path%>/cstvsboard/write.htm">글쓰기</a>
 <table>
   <thead>
     <tr>
       <th width="10%">번호</th>
       <th width="45%">제목</th>
       <th width="17%">작성자</th>
       <th width="20%">등록일</th>
       <th width="10%">조회</th>
     </tr>
   </thead>
   <tbody>
     <c:choose>
       <c:when test="${not empty list }">
         <c:forEach var="dto" items="${list }">
           <tr>
             <td>${dto.seq }</td>
             <td class="title"><a href="<%=path%>/cstvsboard/view.htm?seq=${dto.seq }">${dto.title }</a></td>
             <td>${dto.writer }</td>
             <td>${dto.writedate }</td>
             <td>${dto.readed }</td>
           </tr>
         </c:forEach>      
       </c:when>
       <c:otherwise>
         <tr>
           <td colspan="5">등록된 게시글 없다람쥐.</td>
         </tr>
       </c:otherwise>
     </c:choose>
   </tbody>
   <tfoot>
     <tr>
       <td colspan="5" align="center">
       <div class="pagination">         
         <c:if test="${dto.prev }">
          <a href="<%=path%>/cstvsboard/list.htm?currentpage=${dto.start-1}">&lt;</a>
         </c:if>
         <c:forEach var="i" begin="${dto.start }" end="${dto.end }" step="1">
           <c:choose>
             <c:when test="${i eq dto.currentPage }">
               <a style="cursor: default;" class="active" href="#">${i }</a>
             </c:when>
             <c:otherwise>
               <a href="<%=path%>/cstvsboard/list.htm?currentpage=${i}">${i }</a>
             </c:otherwise>
           </c:choose>
  		</c:forEach>           		
  		 <c:if test="${dto.next }">   
  		   <a href="<%=path%>/cstvsboard/list.htm?currentpage=${dto.end+1}">&gt;</a>
  		 </c:if>
	   </div>		 
	   </td>
     </tr>
     <tr>
        <td colspan="5" align="center">
          <form method="get">
             <select name="searchCondition" id="searchCondition">
              <option value="1">title</option>
              <option value="2">content</option>
              <option value="3">writer</option>
              <option value="4">title+content</option>
            </select>
            <input type="text" name="searchWord" id="searchWord" value="${param.searchWord }" />
            <input type="submit" value="search" />          
            
          </form>
        </td>
      </tr>
   </tfoot>
 </table>
</div>
<script>
$(function(){
	// list.htm?write=success
  if('<%= request.getParameter("write")%>'=="success" ){
	  alert("글 쓰기 성공");
  }
  if('<%= request.getParameter("delete")%>'=="success" ){
	  alert("글 삭제 성공");
  }
});
//let ind = url.indexOf("searchCondition");
//let str = url.charAt(ind+"searchCondition".length+1);
//$("option").eq(str-1).prop("selected", true);
$("#searchCondition").val(${param.searchCondition});
</script>
<script type="text/javascript">
$(".pagination a:not(.active)").attr("href",function(i,oldhref){
	return `\${oldhref}&searchCondition=${param.searchCondition}&searchWord=${param.searchWord}`;  
})
$(".title a").attr("href",function(i,oldhref){
	return `\${oldhref}&currentpage=${param.currentpage}&searchCondition=${param.searchCondition}&searchWord=${param.searchWord}`;  
})
</script>
</body>
</html>

