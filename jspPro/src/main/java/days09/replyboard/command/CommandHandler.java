package days09.replyboard.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface CommandHandler {

	// 응답 페이지 경로 
	String process(HttpServletRequest request, HttpServletResponse response) throws Exception;
		
}
