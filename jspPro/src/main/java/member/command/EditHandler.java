package member.command;

import java.sql.Connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.ConnectionProvider;
import com.util.DBConn;

import member.domain.BoardDTO;
import member.persistence.BoardDAOImpl;



public class EditHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
	
		String method = request.getMethod(); // GET POST
		if (method.equals("GET")) {
			System.out.println(" EditHandler doGet Start");
			int pseq = Integer.parseInt(request.getParameter("seq"));
			Connection conn = ConnectionProvider.getConnection();
			BoardDAOImpl dao = new BoardDAOImpl(conn);
			BoardDTO dto = null;
			try {
				dto = dao.view(pseq);
			} catch (Exception e) {
				System.out.println("> EditHandler.doGet dao.update Exception");
				e.printStackTrace();
			}
			
			conn.close();
			
			request.setAttribute("dto", dto);
			
			return "/days06/board/edit.jsp";
		} else {  //POST
			System.out.println(" EditHandler doPost Start");		
			request.setCharacterEncoding("UTF-8");
			int pseq = Integer.parseInt(request.getParameter("seq"));		
			String pwd = request.getParameter("pwd");
			String email = request.getParameter("email");
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			int tag = Integer.parseInt(request.getParameter("tag"));
			
			BoardDTO dto = new BoardDTO(pseq, null, pwd, email, title, null, 0, tag, content);
			
			Connection conn = ConnectionProvider.getConnection();
			BoardDAOImpl dao = new BoardDAOImpl(conn);
			
			int rowCount = 0;
			try {
				rowCount = dao.update(dto);
			} catch (Exception e) {
				System.out.println("> EditHandler.doPost dao.update Exception");
				e.printStackTrace();
			}
			
			conn.close();
			
			// 리다이렉트
			String location = "/jspPro/board/view.do?seq="+pseq;		
			location += rowCount==1?"&edit=success":"&edit=fail";
			response.sendRedirect(location);
			
		}
		
		return null;
	}

}
