package days04.board;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.DBConn;

import days04.board.domain.BoardDTO;
import days04.board.persistence.BoardDAOImpl;

@WebServlet("/cstvsboard/delete.htm")
public class Delete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Delete() {
        super();
    }
    // edit.htm?seq=? 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(" Delete doGet Start");

		// 2. 포워딩
		String path = "/days04/board/delete.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);		
	}
	// write.jsp 작성완료 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(" Delete doPost Start");		
		request.setCharacterEncoding("UTF-8");
		int pseq = Integer.parseInt(request.getParameter("seq"));		
		String pwd = request.getParameter("pwd");
		
		Connection conn = DBConn.getConnection();
		BoardDAOImpl dao = new BoardDAOImpl(conn);
		
		int rowCount = 0;
		String originalpwd;
		try {
			originalpwd = dao.getOriginalPwd(pseq);
			if(originalpwd.equals(pwd)) {
			  rowCount = dao.delete(pseq);
			  String location = "/jspPro/cstvsboard/list.htm?delete=success";	
			}else {
//			  request.setAttribute("error", "비밀번호가 틀립니다.");
//			  doGet(request, response);
				String location = "/jspPro/cstvsboard/view.htm?seq="+pseq+"&delete=fail";						
				response.sendRedirect(location);
			  return;
			}
		} catch (Exception e) {
			System.out.println("> Delete.doPost dao.delete Exception");
			e.printStackTrace();
		}finally {
			DBConn.close();	
		}        
		
		
		// 리다이렉트
		String location = "/jspPro/cstvsboard/list.htm?delete=success";				
		response.sendRedirect(location);
	}

}
