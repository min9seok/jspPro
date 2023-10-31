package member.command;

import java.sql.Connection;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.ConnectionProvider;
import com.util.DBConn;

import member.domain.BoardDTO;
import member.domain.MemberDTO;
import member.persistence.MemberDAOImpl;



public class LogonHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
	
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
			ArrayList<MemberDTO> list = null;
			MemberDTO dto = new MemberDTO(name, id, pwd, email);			
			Connection conn = ConnectionProvider.getConnection();
			MemberDAOImpl dao = new MemberDAOImpl(conn);
				try {
					list = dao.logon(dto);					
		
					rowCount = dao.logonchk(id, pwd);
					System.out.println(rowCount);
				} catch (Exception e) {					
					System.out.println("> LogonHandler.process() Join Execption 발생");
					e.printStackTrace();
				}
			conn.close();
			request.getSession().setAttribute("id", id);
			request.getSession().setAttribute("pwd", pwd);
			request.getSession().setAttribute("name", name);
			request.getSession().setAttribute("email", email);
			
			String location = "/jspPro/member/logon.do";
			location += rowCount == 1 ? "?status=success" : "?status=failed";
			response.sendRedirect(location);		
		}
		return null;
		
	}

}

