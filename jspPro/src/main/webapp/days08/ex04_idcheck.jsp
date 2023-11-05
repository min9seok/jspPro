<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page import="com.util.ConnectionProvider"%>
<%@page import="com.util.JdbcUtil"%>
<%-- <%@page import="net.sf.json.JSONObject"%> --%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>

<%
      // json        {  "count":  1 }   또는  {  "count":  0}     ?empno=7369
      String empno = request.getParameter("empno");
      String sql = " select count(*) cnt " + 
                      " from emp  " + 
                      " where empno =  ?";
      Connection conn = null;
      PreparedStatement pstmt = null;
      ResultSet rs = null; 
      
      String jsonResult = "{ \"count\":";
      
      try{
         conn = ConnectionProvider.getConnection();
         pstmt = conn.prepareStatement(sql);
          pstmt.setString(1, empno);
          rs = pstmt.executeQuery();
          rs.next();
          int cnt = rs.getInt("cnt");  // 1      0
          jsonResult += cnt;  
          jsonResult += " }";
      }catch(Exception e){
         e.printStackTrace();
      }finally{
         JdbcUtil.close(pstmt);
         JdbcUtil.close(rs);
         JdbcUtil.close(conn);
      }
%>
<%= jsonResult %> 