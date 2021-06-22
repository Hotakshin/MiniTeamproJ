package co.mini.soyg.study.web;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonObject;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/imageUpload")
public class FileUpload extends HttpServlet {
	private final static long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setCharacterEncoding("UTF-8");
		String path = null;
		ServletContext sc = this.getServletContext();
		path = sc.getRealPath("resources/classImage");

		MultipartRequest multi = new MultipartRequest( //
				req, //
				path, //
				8 * 1024 * 1024, //
				"UTF-8", //
				new DefaultFileRenamePolicy());

		Enumeration en = multi.getFileNames();
		String fileN = null;
		while (en.hasMoreElements()) {
			String name = (String) en.nextElement();
			String fileName = multi.getFilesystemName(name);
			fileN = fileName;
		}
		JsonObject json = new JsonObject();
		json.addProperty("fileName", fileN);
		json.addProperty("uploaded", 1);
		json.addProperty("url", req.getContextPath() + "/resources/classImage/" + fileN);
		
		resp.getWriter().print(json);
	}
}
