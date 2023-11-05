package days08;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.oreilly.servlet.multipart.FileRenamePolicy;
import com.util.ConnectionProvider;
import com.util.JdbcUtil;

@WebServlet("*.ss")
public class FileTestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public FileTestServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI(); 
		Connection conn = null;
		String saveDirectory = null;
		try {
			conn = ConnectionProvider.getConnection();
			FileTestDAO dao = FileTestDAO.getInstance();		
			saveDirectory = request.getRealPath("/days08/upload");
			System.out.println(saveDirectory);
			if ( uri.indexOf("list.ss") != -1) {   // 자료실 목록 
				ArrayList<FileTestDTO> list = dao.selectFileList(conn);
				request.setAttribute("list", list);				
				String path = "/days08/ex11_list.jsp";
				RequestDispatcher dispatcher = request.getRequestDispatcher(path);
				dispatcher.forward(request, response);
			} else if ( uri.indexOf("write.ss") != -1) {  // 자료실 쓰기 + 폼
				String path = "/days08/ex11_write.jsp";
				RequestDispatcher dispatcher = request.getRequestDispatcher(path);
				dispatcher.forward(request, response);
			} else if ( uri.indexOf("write_ok.ss") != -1) { // 자료실 쓰기 + 저장				
				 File f = new File(saveDirectory);
				 if(!f.exists()){
					 f.mkdirs();
				 }  
				 int maxSize = 5*1024*1024;
				 String encType = "UTF-8";
				 FileRenamePolicy policy = new DefaultFileRenamePolicy();
				 MultipartRequest mr = new MultipartRequest(request,saveDirectory,maxSize,encType,policy);
				 FileTestDTO dto = new FileTestDTO();
				 String subject = mr.getParameter("subject");
				 dto.setSubject(subject);
				
				 File attachFile = mr.getFile("attachFile");
				 if(attachFile != null) {
					 String fname = attachFile.getName();
					 long fsize = attachFile.length();
					 String realfname = mr.getOriginalFileName("attachFile");
					 String sysfname = mr.getFilesystemName("attachFile");
					 dto.setFilelength(fsize);
					 dto.setOriginalfilename(realfname);
					 dto.setFilesystemname(sysfname);
				 }
				 int rowCount = dao.insert(conn, dto);
				 response.sendRedirect("list.ss");				
			} else if ( uri.indexOf("delete.ss") != -1) {  // 삭제
				int num = Integer.parseInt(request.getParameter("num"));
				String filesystemname = request.getParameter("filesystemname");
				
				int rowCount = dao.delete(conn, num);
				String pathname = String.format("%s\\%s",saveDirectory,filesystemname);
				File delFile = new File(pathname);
				if (delFile.exists()) {
					delFile.delete();
				}
				response.sendRedirect("/jspPro/days08/list.ss");
			} else if ( uri.indexOf("update.ss") != -1) {  // 수정 + 폼
				int num = Integer.parseInt(request.getParameter("num"));
				FileTestDTO dto = dao.selectOne(conn, num);
				request.setAttribute("dto", dto);
				String path = "/days08/ex11_update.jsp";
				RequestDispatcher dispatcher = request.getRequestDispatcher(path);
				dispatcher.forward(request, response);
			} else if ( uri.indexOf("update_ok.ss") != -1) { // 수정 + 저장
				
			} // if
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
