package member.command;

import java.sql.Connection;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.util.ConnectionProvider;
import com.util.DBConn;

import member.domain.BoardDTO;
import member.domain.MemberDTO;
import member.persistence.MemberDAOImpl;



public class LogonHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession(true);
		String method = request.getMethod(); // GET POST
		if (method.equals("GET")) {
			System.out.println("LogonHandler doGet start");
		
			return "/member/logon.jsp";
			
		} else {  //POST

			System.out.println("LogonHandler doPost start");
			request.setCharacterEncoding("utf-8");
			int rowCount = 0;
			String name = request.getParameter("name");
			String id = request.getParameter("id");
			String pwd = request.getParameter("pwd");
			String email = request.getParameter("email");			
			MemberDTO vo = new MemberDTO(name, id, pwd, email);			
			Connection conn = ConnectionProvider.getConnection();
			MemberDAOImpl dao = new MemberDAOImpl(conn);
				try {
					vo = dao.logon(id, pwd);					
					rowCount = dao.logonchk(id, pwd);
					System.out.println(rowCount);
				} catch (Exception e) {					
					System.out.println("> LogonHandler.process() Join Execption 발생");
					e.printStackTrace();
				}
			conn.close();
			session.setAttribute("vo", vo);	
			session.setAttribute("id", id);

			String location = "/jspPro/member/logon.do";
			location += rowCount == 1 ? "?status=success" : "?status=failed";
			response.sendRedirect(location);		
		}
		return null;
		
	}

}

