package days04.board;

import java.io.IOException;
import java.sql.Connection;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.DBConn;

import days04.board.domain.BoardDTO;
import days04.board.persistence.BoardDAOImpl;

@WebServlet("/cstvsboard/view.htm")
public class View extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public View() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(" View doGet Start");
		int pseq = Integer.parseInt(request.getParameter("seq"));

		Connection conn = DBConn.getConnection();
		BoardDAOImpl dao = new BoardDAOImpl(conn);
		BoardDTO dto = null;
		try {
			dao.increaseReaded(pseq);
			dto = dao.view(pseq);
		} catch (Exception e) {
			System.out.println("> View.doGet dao.view Exception");
			e.printStackTrace();
		}
		
		DBConn.close();
		
		// 1. 포워딩 전에 데이터 저장
		request.setAttribute("dto", dto);
		// 2. 포워딩
		String path = "/days04/board/view.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
