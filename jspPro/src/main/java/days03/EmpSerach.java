package days03;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.DBConn;

import domain.DeptVO;
import domain.EmpVO;

@WebServlet("/days03/empsearch.htm")
public class EmpSerach extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public EmpSerach() {
        super();      
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		Connection conn = DBConn.getConnection();
		PreparedStatement pstmt = null;	
		String sql = "SELECT deptno, dname, loc FROM DEPT";
		ResultSet rs = null;
		int deptno = 0;
		String dname = "";
		String loc = "";
		DeptVO vo;
		ArrayList<DeptVO> dlist = null;
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dlist = new ArrayList();				
				do {
					deptno = rs.getInt("deptno");
					 dname = rs.getString("dname");
					 loc = rs.getString("loc");
					 vo = new DeptVO(deptno, dname, loc);
					 dlist.add(vo);
				}while (rs.next()); 											
			}		
		} catch (SQLException e) {			
			e.printStackTrace();
		}finally {
			try {
				pstmt.close();
				rs.close();
//				DBConn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}			
		}
//		System.out.println(" dend ");
		
		sql = "SELECT DISTINCT job FROM EMP ORDER BY 1";
		String job = "";		
		ArrayList jlist = null;
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				jlist = new ArrayList();				
				do {					
					 job = rs.getString("job");										
					 jlist.add(job);
				}while (rs.next()); 											
			}		
		} catch (SQLException e) {			
			e.printStackTrace();
		}finally {
			try {
				pstmt.close();
				rs.close();
//				DBConn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}			
		}
//		System.out.println(" jend ");
		String pdeptno = null;
		String pjob = null;
		try {
			String[] pdeptnos =  request.getParameterValues("deptno");
			if (pdeptnos != null) {
				pdeptno = String.join(", ",pdeptnos);
			}
			String[] pjobs =  request.getParameterValues("job");
			if (pjobs != null) {
				pjob = String.format("'%s'",String.join(", ",pjobs));						
			}	
		} catch (Exception e) {
			System.out.println("> EmpSearch.java doGet() 3.사원정보 조회");
			e.printStackTrace();
		}		
			sql = "SELECT empno,ename,job,mgr,to_char(hiredate,'yyyy-MM-dd') hiredate,sal,comm,deptno "
					   + "FROM EMP ";
			if(pdeptno != null ) {
				sql += String.format(" WHERE deptno IN (%s)",pdeptno);
			}
			if(pjob != null ) {				
				sql += pdeptno != null?" AND ": " WHERE ";				
				sql += String.format(" job IN (%s)",pjob);
			}
			sql += " ORDER BY deptno";
			ArrayList<EmpVO> elist = null;
			 int empno;
			 String ename;
			 int mgr;
			 String hiredate;
			 double sal;
			 double comm;
			 EmpVO evo = null;		
			
			try {
				pstmt = conn.prepareStatement(sql);				
				rs = pstmt.executeQuery();
				if(rs.next()) {
					elist = new ArrayList();
					do {
						empno = rs.getInt("empno");
						ename = rs.getString("ename");
						job = rs.getString("job");
						mgr = rs.getInt("mgr");
						hiredate = rs.getString("hiredate");
						sal = rs.getDouble("sal");
						comm = rs.getDouble("comm");
						deptno = rs.getInt("deptno");
						
						evo = new EmpVO(empno, ename, job, mgr, hiredate, sal, comm, deptno);
						elist.add(evo);
					}while(rs.next());
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				try {
					pstmt.close();
					rs.close();
					DBConn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}				
			}			
//			System.out.println(" eend ");			
		request.setAttribute("dlist", dlist);
		request.setAttribute("jlist", jlist);
		request.setAttribute("elist", elist);
		//포워딩
		String path = "/days03/ex01_empsearch_jstl.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
