<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%
 String id = request.getParameter("id");
 String passwd = request.getParameter("passwd");
 
 String location;
 if(id.equals("admin") && passwd.equals("1234")){
	 // 성공
	 String name = "관리자";
// 	 한글파라미터 포함시 인코딩필수
	 location = "ex11.jsp?ok&name="+URLEncoder.encode(name,"UTF-8");
 }else{
	// 실패
	 location = "ex11.jsp?error";
 }
 response.sendRedirect(location);
%>

