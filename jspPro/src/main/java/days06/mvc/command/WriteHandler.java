package days06.mvc.command;

import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.ConnectionProvider;
import com.util.DBConn;

import days06.mvc.domain.BoardDTO;
import days06.mvc.persistence.BoardDAOImpl;



public class WriteHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
	
		String method = request.getMethod(); // GET POST
		if (method.equals("GET")) {
			System.out.println("WriteHandler doGet start");

			return "/days06/board/write.jsp";
			
		} else {  //POST

			System.out.println("WriteHandler doPost start");
			request.setCharacterEncoding("utf-8");
			
			String writer = request.getParameter("writer");
			String pwd = request.getParameter("pwd");
			String email = request.getParameter("email");
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			int tag = Integer.parseInt( request.getParameter("tag"));
			
			BoardDTO dto = new BoardDTO(0, writer, pwd, email, title, null, 0, tag, content);
			
			Connection conn = ConnectionProvider.getConnection();
			BoardDAOImpl dao = new BoardDAOImpl(conn);
			
			int rowcount=0;
				try {
					rowcount=dao.insert(dto);
				} catch (Exception e) {
					
					System.out.println("> WriteHandler.process() insert Execption 발생");
					e.printStackTrace();
				}
			conn.close();
			
			//redirect
			String location = "/jspPro/board/list.do";
			//글쓰기 성공 -> list.htm
			location += rowcount ==1 ? "?write=success" : "?write=fail";
			response.sendRedirect(location);
			
		}
		
		return null;
	}

}
