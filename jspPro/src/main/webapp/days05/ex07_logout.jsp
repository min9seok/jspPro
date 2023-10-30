<%@page import="com.util.Cookies"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="/WEB-INF/inc/auth.jspf" %>
<%-- <%
 // 쿠키 사용 로그인(인증) 처리할 예정
 // 로그인 성공(인증처리) 하면 auth 쿠키이름 로그인ID 쿠키값 저장
 String cname = "auth";
 String logonid = null;
 
 Cookies cookies = new Cookies(request);
 if( cookies.exists(cname) ){
	 logonid = cookies.getValue(cname);
 }
%> --%>
<%
Cookie c = Cookies.createCookie("auth", "", "/", 0);
response.addCookie(c);
%>
<script type="text/javascript">
 alert("<%=logonid%>님 로그아웃하셨습니다.");
 location.href = "ex07_default.jsp";
</script>
