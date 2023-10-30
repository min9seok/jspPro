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

//@WebServlet("/cstvsboard/write.htm")
public class Write extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Write() {
        super();
    }
    // list.jsp 글쓰기 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(" Write doGet Start");
		
		// 2. 포워딩
		String path = "/days04/board/write.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);		
	}
	// write.jsp 작성완료 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(" Write doPost Start");		
		request.setCharacterEncoding("UTF-8");
		
		String writer = request.getParameter("writer");
		String pwd = request.getParameter("pwd");
		String email = request.getParameter("email");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		int tag = Integer.parseInt(request.getParameter("tag"));
		
		BoardDTO dto = new BoardDTO(0, writer, pwd, email, title, null, 0, tag, content);
		
		Connection conn = DBConn.getConnection();
		BoardDAOImpl dao = new BoardDAOImpl(conn);
		
		int rowCount = 0;
		try {
			rowCount = dao.insert(dto);
		} catch (Exception e) {
			System.out.println("> Write.doPost dao.insert Exception");
			e.printStackTrace();
		}
		
		DBConn.close();
		
		// 리다이렉트
		String location = "/jspPro/cstvsboard/list.htm";
		location += rowCount==1?"?write=success":"?write=fail";
		response.sendRedirect(location);
	}

}
