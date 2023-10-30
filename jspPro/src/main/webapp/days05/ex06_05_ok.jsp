<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
 Enumeration<String> en =  request.getParameterNames();
 while(en.hasMoreElements()){
	 String cookieName =  en.nextElement();
	 String cookieValue = request.getParameter(cookieName);
	 
	Cookie c = new Cookie(cookieName,cookieValue);
	c.setMaxAge(-1); // 브라우저 닫으면 쿠키 제거
	response.addCookie(c);
 }
 String location = "ex06_03.jsp";
 response.sendRedirect(location); // F12 name 쿠키 확인
%>

