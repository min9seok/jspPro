package days06;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import days05.MemberInfo;

//@WebServlet("/days06/session.htm")
public class SessionTest extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public SessionTest() {
        super();  
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 서블릿에서 세션을 사용 하는 방법 
		// 1) 세션이 존재하면 세션 객체를 반환
		//            존재하지 않으면 새로운 세션 객체를 생성하여 반환
		HttpSession s1 =  request.getSession();
		// == HttpSession s2 =  request.getSession(true);
		
		// 2) 세션이 존재하면 세션 객체를 반환
		//            존재하지 않으면 null 반환
		HttpSession s3 =  request.getSession(false);
//		if (s3 == null) {
//			
//		}
		
		// 인증 회원 정보
		MemberInfo m = new MemberInfo();
		m.setId("admin");
		m.setPasswd("1234");
		m.setName("nana");
		m.setEmail("admin@com");
		m.setRegisterDate(new Date());
		
		s1.setAttribute("auth", m);
		MemberInfo m2 = (MemberInfo) s1.getAttribute("auth");
		// m2.getId();
	}



	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		

	}

}
