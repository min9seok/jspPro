package member.command;

import java.sql.Connection;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.ConnectionProvider;
import com.util.DBConn;

import member.domain.BoardDTO;
import member.domain.PageDTO;
import member.persistence.BoardDAOImpl;


public class ViewHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(">ViewHandler.process ?");
		int pseq = Integer.parseInt(request.getParameter("seq"));

		Connection conn = ConnectionProvider.getConnection();
		BoardDAOImpl dao = new BoardDAOImpl(conn);
		BoardDTO dto = null;
		try {
			dao.increaseReaded(pseq);
			dto = dao.view(pseq);
		} catch (Exception e) {
			System.out.println("> ViewHandler.doGet dao.view Exception");
			e.printStackTrace();
		}
		
		conn.close();
		
		// 1. 포워딩 전에 데이터 저장
		request.setAttribute("dto", dto);	

		return "/member/view.jsp";
		
		
	}

}
