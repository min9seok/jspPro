package days06.mvc.command;

import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.ConnectionProvider;
import com.util.DBConn;

import days06.mvc.domain.BoardDTO;
import days06.mvc.persistence.BoardDAOImpl;



public class DeleteHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
	
		String method = request.getMethod(); // GET POST
		if (method.equals("GET")) {
			System.out.println("DeleteHandler doGet start");
			return "/days06/board/delete.jsp";
		} else {  //POST
			System.out.println(" Delete doPost Start");		
			request.setCharacterEncoding("UTF-8");
			int pseq = Integer.parseInt(request.getParameter("seq"));		
			String pwd = request.getParameter("pwd");
			
			Connection conn = ConnectionProvider.getConnection();
			BoardDAOImpl dao = new BoardDAOImpl(conn);
			
			int rowCount = 0;
			String originalpwd;
			try {
				originalpwd = dao.getOriginalPwd(pseq);
				if(originalpwd.equals(pwd)) {
				  rowCount = dao.delete(pseq);
				  String location = "/jspPro/board/list.do?delete=success";	
				}else {
//				  request.setAttribute("error", "비밀번호가 틀립니다.");
//				  doGet(request, response);
					String location = "/jspPro/board/view.do?seq="+pseq+"&delete=fail";						
					response.sendRedirect(location);
				}
			} catch (Exception e) {
				System.out.println("> Delete.doPost dao.delete Exception");
				e.printStackTrace();
			}finally {
				conn.close();	
			}        						
			// 리다이렉트
			String location = "/jspPro/board/list.do?delete=success";				
			response.sendRedirect(location);
			
		}
		
		return null;
	}

}
