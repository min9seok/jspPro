<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
 //http://localhost/jspPro/days05/ex06_04.jsp?ckbCookie=name&ckbCookie=bgimg
 String[] delcnames = request.getParameterValues("ckbCookie");
for(int i=0; i<delcnames.length; i++){	  
	  String cookieName = delcnames[i];	  	  	
	 	Cookie c = new Cookie(cookieName,"");
	 	c.setMaxAge(0); // 브라우저 닫으면 쿠키 제거//	 
	  response.addCookie(c);
}
// alert() 쿠키 삭제 알림 ex06_03.jsp 이동

%>
<script type="text/javascript">
alert("쿠키 삭제");
location.href = "ex06_03.jsp";
</script>