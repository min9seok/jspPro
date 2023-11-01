<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
 // days07.AuthInfo.java 
 String id = request.getParameter("id");
 String pwd = request.getParameter("pwd");
 
 // DB 연동 id/passwd/authrotiy
 // 인증 정보 저장
 session.setAttribute("auth", id);
 
 String location = "/jspPro/days07/ex03.jsp";
 String uri = (String)session.getAttribute("uri");
 if(uri != null){
	 location = uri;
	 session.removeAttribute("uri");
 }
 response.sendRedirect(location);

%>
