<%@page import="com.util.ConnectionProvider"%>
<%@page import="com.util.JdbcUtil"%>
<%@page import="net.sf.json.JSONSerializer"%> 
<%@page import="java.sql.Date"%>
<%@page import="net.sf.json.JSONArray"%> 
<%@page import="net.sf.json.JSONObject"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    // https://json-lib.sourceforge.net/index.html
   int pdeptno = 10;
   try{
       pdeptno =  Integer.parseInt( request.getParameter("deptno") );
   }catch(NumberFormatException e){  }
   
   //
   Connection con = null;
   PreparedStatement pstmt = null;
   ResultSet rs = null;
   
   String sql = "select empno, ename, sal, job, to_char(hiredate,'YYYY-mm-dd') hiredate, mgr, comm, deptno " 
               + " from emp "
               + " where deptno = ? "
              + " order by sal desc";
    
   // json 데이타로 결과를 생성해서 응답..
   // {  }
   JSONObject  jsonData = new JSONObject();
     
   try{      
      con = ConnectionProvider.getConnection();
      pstmt = con.prepareStatement(sql);
      pstmt.setInt(1, pdeptno);  // 20
      rs = pstmt.executeQuery(); 
       
      // [ {emp} , {} , {}]  배열
      JSONArray jsonEmpArray = new JSONArray();
      while( rs.next() ){ 
         int empno = rs.getInt("empno");
         String ename = rs.getString("ename");         
         String job = rs.getString("job");
         Date hiredate = rs.getDate("hiredate");
         int mgr = rs.getInt("mgr");
         double sal = rs.getDouble("sal");  
         double comm = rs.getDouble("comm");
         int deptno = rs.getInt("deptno");
         
         JSONObject jsonEmp = new JSONObject();
         jsonEmp.put("empno", empno);
         jsonEmp.put("ename", ename);
         jsonEmp.put("job", job);
         
         // java -> json java.util.Date X
         jsonEmp.put("hiredate", hiredate.toLocaleString());        
         jsonEmp.put("mgr", mgr);
         jsonEmp.put("sal", sal);
         jsonEmp.put("comm", comm);
         jsonEmp.put("deptno", deptno);
         
         jsonEmpArray.add(jsonEmp);
          
      } // while
         
      jsonData.put("emp", jsonEmpArray)   ;
      
//       System.out.println( jsonData.toString()  );
   }catch(Exception e){
      e.printStackTrace();
   }finally{
      JdbcUtil.close(rs);
      JdbcUtil.close(pstmt);
      JdbcUtil.close(con);
   } // try  
%>
<%=  jsonData %>