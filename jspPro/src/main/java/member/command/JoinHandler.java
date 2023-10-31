package member.command;

import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.ConnectionProvider;
import com.util.DBConn;

import member.domain.BoardDTO;
import member.domain.MemberDTO;
import member.persistence.BoardDAOImpl;



public class JoinHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
	
		String method = request.getMethod(); // GET POST
		if (method.equals("GET")) {
			System.out.println("JoinHandler doGet start");
			return "/member/join.jsp";			
		} else {  //POST
			System.out.println("JoinHandler doPost start");
			request.setCharacterEncoding("utf-8");
			
			String name = request.getParameter("name");
			String id = request.getParameter("id");
			String pwd = request.getParameter("pwd");
			String email = request.getParameter("email");
			
			MemberDTO dto = new MemberDTO(name, id, pwd, email);
			
			Connection conn = ConnectionProvider.getConnection();
			BoardDAOImpl dao = new BoardDAOImpl(conn);
			
			int rowCount=0;
				try {
					rowCount=dao.join(dto);
				} catch (Exception e) {					
					System.out.println("> JoinHandler.process() Join Execption 발생");
					e.printStackTrace();					
				}
			conn.close();
			// 포워딩x, 리다이렉트 클라이언트에서 다시 요청하는것 contextPath 줘야함
				String location = "/jspPro/member/join.do";
				location += rowCount == 1 ? "?write=success" : "?write=failed";
				response.sendRedirect(location);			
		}
		
		return null;
	}

}
