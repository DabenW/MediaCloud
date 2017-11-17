package Controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dbutil.Dbutil;
import Form.UploadForm;

@WebServlet("/CreateAlbum")
public class CreateAlbum extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//get tomcat's path
		String path = request.getSession().getServletContext().getRealPath("");
		
		//Retrieve all fields contents that are submitted by user
		Map<String, String> items = UploadForm.parseRequest(request, path, "createAlbumForm");
		
		String insert = "INSERT INTO album (aname,genre,singer,adesc,athumb) VALUES('"+ items.get("aname") +"','"+items.get("mgenre")+"','"+items.get("singer")
							+"','"+items.get("adesc")+"','"+items.get("athumb")+"')";
		
		//execute insert option to album table
		Dbutil util = new Dbutil();
		util.update(insert);
	    util.releaseConnection();
	    
	    response.sendRedirect("allFiles.jsp");
	}

}