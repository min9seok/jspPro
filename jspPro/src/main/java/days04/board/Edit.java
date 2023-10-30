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

//@WebServlet("/cstvsboard/edit.htm")
public class Edit extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Edit() {
        super();
    }
    // edit.htm?seq=? 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(" Edit doGet Start");
		int pseq = Integer.parseInt(request.getParameter("seq"));
		Connection conn = DBConn.getConnection();
		BoardDAOImpl dao = new BoardDAOImpl(conn);
		BoardDTO dto = null;
		try {
			dto = dao.view(pseq);
		} catch (Exception e) {
			System.out.println("> Edit.doGet dao.update Exception");
			e.printStackTrace();
		}
		
		DBConn.close();
		
		request.setAttribute("dto", dto);
		// 2. 포워딩
		String path = "/days04/board/edit.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);		
	}
	// write.jsp 작성완료 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(" Edit doPost Start");		
		request.setCharacterEncoding("UTF-8");
		int pseq = Integer.parseInt(request.getParameter("seq"));		
		String pwd = request.getParameter("pwd");
		String email = request.getParameter("email");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		int tag = Integer.parseInt(request.getParameter("tag"));
		
		BoardDTO dto = new BoardDTO(pseq, null, pwd, email, title, null, 0, tag, content);
		
		Connection conn = DBConn.getConnection();
		BoardDAOImpl dao = new BoardDAOImpl(conn);
		
		int rowCount = 0;
		try {
			rowCount = dao.update(dto);
		} catch (Exception e) {
			System.out.println("> Edit.doPost dao.update Exception");
			e.printStackTrace();
		}
		
		DBConn.close();
		
		// 리다이렉트
		String location = "/jspPro/cstvsboard/view.htm?seq="+pseq;		
		location += rowCount==1?"&edit=success":"&edit=fail";
		response.sendRedirect(location);
	}

}
