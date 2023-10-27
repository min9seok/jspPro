<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%
// Dispatcher 발송담당자 , 운전 지시 장치
 String path = "ex12_finish.jsp";
 RequestDispatcher dispatcher = request.getRequestDispatcher(path);
 dispatcher.forward(request, response);

%>
