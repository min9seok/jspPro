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
import days04.board.domain.PageDTO;
import days04.board.persistence.BoardDAOImpl;

@WebServlet("/cstvsboard/list.htm")
public class List extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public List() {
        super();
    }
    //localhost/jspPro/cstvsboard/list.htm
    // ?currentpage=3
    // &searchCondition=1&searchWord=홍길동
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(" List do Get Start");
		int currentPage = 1; // 현재 페이지 번호
		int numberPerPage = 10; // 한 페이지에 출력할 게시글 수
		int numberOfPageBlock = 10; 
		int totalRecords = 0;
		int totalPages = 0;
		int searchCondition=1; 
		String searchWord=null;		
		try {
			currentPage = Integer.parseInt(request.getParameter("currentpage"));	
		} catch (Exception e) {	}
		
		ArrayList<BoardDTO> list = null;
		
		Connection conn = DBConn.getConnection();
		BoardDAOImpl dao = new BoardDAOImpl(conn);
		PageDTO dto = null;
		try {
			list = dao.select(currentPage, numberPerPage);
			totalRecords = dao.gettotalRecords();
			totalPages =  dao.gettotalPages(numberPerPage);
			dto = new PageDTO(currentPage, numberPerPage, numberOfPageBlock, totalPages);
		} catch (Exception e) {
			System.out.println("> List.doGet dao.select Exception");
			e.printStackTrace();
		}
		// 검색 기능 구현
		searchWord = request.getParameter("searchWord");
		if(searchWord == null)  searchWord="";
		try {						
			searchCondition = Integer.parseInt(request.getParameter("searchCondition"));
			if(searchWord.equals("")) {	
				list = dao.select(currentPage, numberPerPage);
		    	totalRecords = dao.gettotalRecords();
				totalPages =  dao.gettotalPages(numberPerPage);
		    }else {		    	
				list = dao.search(currentPage, numberPerPage, searchCondition, searchWord);
				totalPages =  dao.gettotalPages(numberPerPage, searchCondition, searchWord);
		    }
			dto = new PageDTO(currentPage, numberPerPage, numberOfPageBlock, totalPages);
		} catch (Exception e) {
			System.out.println("> List.doGet dao.search Exception");
			e.printStackTrace();
		}
		DBConn.close();
		
		// 1. 포워딩 전에 데이터 저장
		request.setAttribute("list", list);
		request.setAttribute("dto", dto);
		// 2. 포워딩
		String path = "/days04/board/list.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
