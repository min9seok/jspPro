package days03;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedHashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.DBConn;

import domain.DeptEmpVO;
import domain.SalgradeVO;

@WebServlet("/days03/salgradeEmp.htm")
public class SalGradeEmp extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public SalGradeEmp() {
        super();

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("> SalGradeEmp.doGet() Start");
		String sql = "SELECT grade, losal, hisal ,count(*) cnt "
				+ "FROM salgrade s join emp e on sal between losal and hisal "
				+ "group by grade,losal,hisal "
				+ "order by grade";
		String empsql ="SELECT d.deptno, dname, empno, ename, sal "
				+ "From dept d right join emp e on d.deptno = e.deptno "
				+ "            JOIN salgrade s on sal between losal and hisal "
				+ "WHERE grade = ? "
				+ "order by d.deptno ";
		Connection conn = null;
		ResultSet rs = null, emprs = null;
		PreparedStatement pstmt = null, emppstmt = null;
		LinkedHashMap<SalgradeVO, ArrayList<DeptEmpVO>> map = new LinkedHashMap();			
		SalgradeVO vo = null;
		ArrayList<DeptEmpVO> emplist = null;			
		DeptEmpVO empvo = null;
		conn = DBConn.getConnection();
		int deptno;
		String dname;
		int empno;
		String ename;
		double sal;
		int grade;
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {				
				do {			
					grade = rs.getInt(1);
					vo = new SalgradeVO(grade, rs.getInt(2), rs.getInt(3), rs.getInt(4));

					emppstmt = conn.prepareStatement(empsql);
					emppstmt.setInt(1, grade);
					emprs = emppstmt.executeQuery();
					if(emprs.next()) {
						emplist = new ArrayList();
						do {
							deptno = emprs.getInt(1);
							dname  = emprs.getString(2);
							empno  = emprs.getInt(3);
							ename  = emprs.getString(4);
							sal    = emprs.getDouble(5);							 
							empvo = new DeptEmpVO(deptno, dname, empno, ename, sal);
							emplist.add(empvo);
						} while (emprs.next());
					}
					map.put(vo, emplist);
					emprs.close();
					emppstmt.close();
				} while (rs.next());			
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				rs.close();			
				pstmt.close();				
				DBConn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		//LinkedHashMap<SalgradeVO, ArrayList<DeptEmpVO>> map
		request.setAttribute("map", map);
		//포워딩
		String path = "/days03/ex04_salgradeemp.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);
		System.out.println("> SalGradeEmp.doGet() End");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
