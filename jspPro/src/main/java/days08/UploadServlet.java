package days08;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Collection;
import java.util.Iterator;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;



//@WebServlet("/UploadServlet")
public class UploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public UploadServlet() {
        super();

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		Collection<Part> parts = request.getParts();
		
		PrintWriter out = response.getWriter();
		out.print("<html>");
		out.print("<body>");
		String contentType = request.getContentType();
		if(contentType != null && contentType.toLowerCase().startsWith("multipart/")) {
			printPartInfo(request,out);
		}else {
			out.print("enctype 오류");
		}
		out.print("</body>");
		out.print("</html>");
		
	}

	private void printPartInfo(HttpServletRequest request, PrintWriter out) throws IOException, ServletException {
		Collection<Part> parts = request.getParts();
		for (Part part : parts) {
			out.print("<br> name : "+ part.getName());
			String contentType = part.getContentType();
			out.print("<br> contentType : "+ contentType);		
			if(part.getHeader("Content-Disposition").contains("filename=")) {
				out.print("<br> size : " + part.getSize());
				String fname = part.getSubmittedFileName();
				out.print("<br> fname : "+ fname);
				if(part.getSize() > 0 ) {
					part.write("c:\\temp\\" + fname);
					part.delete();
				}
			}else {
				String pval =  request.getParameter(part.getName());
				out.println("<br> pval :" + pval);
			}
		}
		out.print("<hr>");
	}

}
