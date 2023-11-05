<%@page import="domain.EmpVO"%>
<%@page import="domain.DeptVO"%>
<%@page import="com.util.ConnectionProvider"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%> 
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
   String contextPath = request.getContextPath();
%>

<%
   int pdeptno = 10;
   try{
       pdeptno =  Integer.parseInt( request.getParameter("deptno") );
   }catch(NumberFormatException e){  }
   //
   
   Connection conn  = ConnectionProvider.getConnection();
   PreparedStatement pstmt = null;
   ResultSet rs = null;
   
   // 1. 부서 정보
   ArrayList<DeptVO> deptList = null;
   String sql = "SELECT deptno, dname, loc   "
                    +" FROM dept "; 
   
   try{
       pstmt =  conn.prepareStatement(sql);
       rs =  pstmt.executeQuery();
       
       if( rs.next() ){
         deptList = new ArrayList<>();
         do{
            DeptVO dto = new DeptVO( rs.getInt("deptno"), rs.getString("dname"), rs.getString("loc"));
             deptList.add(dto);
         }while( rs.next() );
       } // if
       
       pstmt.close();
       rs.close(); 
   }catch(Exception e){
      e.printStackTrace();
   } // try
   
   // 
   // 2. 해당 부서원 정보  
   ArrayList<EmpVO> empList = null;
   sql =      "SELECT * "
             +" FROM emp "
             +" WHERE deptno = ? "
             +" ORDER BY ename ASC";
   
         
   try{
       pstmt =  conn.prepareStatement(sql);
       pstmt.setInt(1,  pdeptno );
       rs =  pstmt.executeQuery();
       
       if( rs.next() ){
         empList = new ArrayList<>();
         do{
            //  empno,  ename,  job,  hiredate,  mgr,  sal,  comm,  deptno  
            EmpVO dto = new EmpVO(
                  rs.getInt("empno")
                  , rs.getString("ename")
                  , rs.getString("job")
                  , rs.getInt("mgr")
                  , rs.getDate("hiredate").toLocaleString()
// 				  , rs.getDate("hiredate")
                  , rs.getDouble("sal")
                  , rs.getDouble("comm")
                  , rs.getInt("deptno")
                  );
            empList.add(dto);
         }while( rs.next() );
       } // if
       
       pstmt.close();
       rs.close(); 
   }catch(Exception e){
      e.printStackTrace();
   } // try
   
   conn.close();
   
   // deptList, empList => request 객체 저장.
   request.setAttribute("deptList", deptList);
   request.setAttribute("empList", empList);
   request.setAttribute("name", "hong gil dong");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2023. 11. 02. - 오전 11:41:00</title>
<link rel="shortcut icon" type="image/x-icon" href="../images/SiSt.ico">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<style>
 table{
   width:100%;
   min-width: 700px;
 } 
 table, th, td{
   border:1px solid gray;
 }
</style>
</head>
<body>
<h3>ex05_deptEmp.jsp</h3>
<select id="selDept" name="deptno"> 
   <c:forEach items="${ deptList }"  var="dto">
       <option value= "${ dto.deptno }">${ dto.dname }</option>
   </c:forEach>
</select>
<br>
<br>
<table>
  <thead>
    <tr>
     <th><input type="checkbox" id="ckbAll" name="ckbAll">전체 선택</th>
     <th>empno</th>
     <th>ename</th>
     <th>job</th>
     <th>hiredate</th>
     <th>mgr</th>
     <th>sal</th>
     <th>comm</th>
     <th>deptno</th>
    </tr>
  </thead>
  <tbody>
  
  <c:choose>
     <c:when test="${  not empty empList }">
        <c:forEach items="${ empList }" var="dto">        
           <tr>
              <td><input type="checkbox" name="ckbEmp" data-empno="${ dto.empno }"></td>
              <td>${ dto.empno }</td>
              <td>${ dto.ename }</td>
              <td>${ dto.job }</td>
              <td>${ dto.hiredate }</td>
              <td>${ dto.mgr }</td>
              <td>${ dto.sal }</td>
              <td>${ dto.comm }</td>
              <td>${ dto.deptno }</td>
           </tr>        
        </c:forEach>
     </c:when>     
     <c:otherwise>
        <tr>
           <td colspan="9"  style="text-align: center">employee does not exist.</td>
        </tr>
     </c:otherwise>
  </c:choose> 
 
  </tbody>
  <tfoot>
    <tr>
       <td colspan="9"  style="text-align: center">
          <button id="checkedEmpno">선택한 empno 확인</button>
       </td>
    </tr>
  </tfoot>
</table>

<p id="demo"></p>

<script>
  $("#selDept").change(function (){
     // jquery  ajax     해당 부서원들을 json데이타로 받아서 DOM 으로 처리.
     var params = "deptno="+$(this).val();
     //  alert( params )   deptno=20
     
     // get()/ getJSON() / post()
     $.ajax({
        url:"ex06_deptemp.jsp",
        dataType:"json",
        type:"GET", 
        data:params, 
        cache:false,
        success:function (data, textStatus, jqXHR){
           // [ json -> Object  자동 형변환. ]
            // alert( data ); //   object Object
           $("#demo").empty();
           $("table tbody").empty();
           $(  data.emp ).each( function (i, elem){
              $("#demo").append(`<li>\${ elem.empno }</li>`);
              /*
               <tr>
                    <td><input type="checkbox" name="ckbEmp" data-empno="${ dto.empno }"></td>
                    <td>${ dto.empno }</td>
                    <td>${ dto.ename }</td>
                    <td>${ dto.job }</td>
                    <td>${ dto.hiredate }</td>
                    <td>${ dto.mgr }</td>
                    <td>${ dto.sal }</td>
                    <td>${ dto.comm }</td>
                    <td>${ dto.deptno }</td>
                 </tr>      
              */
              
              /*  // 첫 번째 
                 $("<tr></tr>")
                    //.append("<input type='checkbox' name='ckbEmp' data-empno='`${ elem.empno}`'>")
                    .append( $("<td></td>").html("<input type='checkbox' name='ckbEmp' data-empno='" + elem.empno + "'>") )
                    .append( $("<td></td>").text(elem.empno) )
                    .append( $("<td></td>").text(elem.ename) )
                    .append( $("<td></td>").text(elem.job) )
                    .append( $("<td></td>").text(elem.hiredate) )
                    .append( $("<td></td>").text(elem.mgr) )
                    .append( $("<td></td>").text(elem.sal) )
                    .append( $("<td></td>").text(elem.comm) )
                    .appendTo("table tbody");
                 */
                 /*             // 두 번째.                                                                    
                 let tr = "<tr>                                                                    "
                          +"     <td><input type='checkbox' name='ckbEmp' data-empno='"+elem.empnp+"'></td>"              
                        +"     <td>"+elem.empno+"</td>                                                     "
                        +"     <td>"+elem.ename+"</td>                                                   "
                        +"     <td>"+elem.job+"</td>                                                    "
                        +"     <td>"+elem.hiredate+"</td>                                               "
                        +"     <td>"+elem.mgr+"</td>                                                     "
                        +"     <td>"+elem.sal+"</td>                                                   "
                        +"     <td>"+elem.comm+"</td>                                                      "
                        +"     <td>"+elem.deptno+"</td>                                                       "
                        +" </tr>"
                 $( tr )
                    .appendTo("table tbody");
                 */
                 
                 // jsp 페이지에서 EL 과  Template literals 의 $ 차이
                 //                       \$ 사용
                let tr = `<tr>                                                                     
                                <td><input type='checkbox' name='ckbEmp' data-empno='\${elem.empnp}'></td>               
                              <td>\${elem.empno}</td>                                                     
                              <td>\${elem.ename}</td>                                                    
                              <td>\${elem.job}</td>                                                     
                              <td>\${elem.hiredate}</td>                                               
                              <td>\${elem.mgr}</td>                                                   
                              <td>\${elem.sal}</td>                                                  
                              <td>\${elem.comm}</td>                                                    
                              <td>\${elem.deptno}</td>                                                      
                          </tr>`
              $( tr )
                 .appendTo("table tbody");
          
              
           } );
           
           
        }, 
        error:function (){
           alert('에러발생~~~');
        }
     });
  });
</script>

</body>
</html>