package member.command;

import java.sql.Connection;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.ConnectionProvider;

import member.domain.BoardDTO;
import member.domain.PageDTO;
import member.persistence.BoardDAOImpl;



public class ListHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(">ListHandler.process ?");
		
		int currentPage = 1; // 현재 페이지번호
		int numberPerPage = 10; // 한 페이지에 출력할 게시글 수
		int numberOfPageBlock = 10; // 페이지 블럭수
		int totalRecords =0;  // 총레코드
		int totalPages =0; //  총 페이지

		// 검색 기능 구현
		int searchCondition = 1;
		try {
			searchCondition =Integer.parseInt( request.getParameter("searchCondition") );	
		} catch (Exception e) {

		}
		String searchWord = request.getParameter("searchWord");
		// null ,  " "
		// list.htm   null
		// list.htm?searchWord     ""
		if (searchWord == null) searchWord = "";

		try {
			currentPage =Integer.parseInt( request.getParameter("currentpage") );
		} catch (Exception e) {	}

		ArrayList<BoardDTO> list = null;

		Connection conn = ConnectionProvider.getConnection();
		BoardDAOImpl dao = new BoardDAOImpl(conn);
		PageDTO dto = null;

		try {
			if (searchWord.equals("")) {
				list = dao.select(currentPage, numberPerPage);
				totalRecords = dao.gettotalRecords();
				totalPages=dao.gettotalPages(numberPerPage);
			} else {  //검색 조건 포함
				list = dao.search(currentPage, numberPerPage, searchCondition, searchWord);
				totalPages=dao.gettotalPages(numberPerPage, searchCondition, searchWord);
			}//if
			dto= new PageDTO(currentPage, numberPerPage, numberOfPageBlock, totalPages);

		} catch (Exception e) {

			System.out.println("> ListHandler.process() select Execption 발생");
			e.printStackTrace();
		}
		
		conn.close();
		
		System.out.println("ListHandler doGet start");

		//1.  포워딩 전 데이터 저장
		request.setAttribute("list", list);
		request.setAttribute("dto", dto);

		return "/member/list.jsp";
		
		
	}

}
