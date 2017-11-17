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

/**
 * Servlet implementation class UploadShow to provide 
 * upload TV shows function
 */
@WebServlet("/UploadShow")
public class UploadShow extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		//get tomcat's path
		String path = request.getSession().getServletContext().getRealPath("");
				
		//Retrieve all fields contents that are submitted by user
		Map<String, String> items = UploadForm.parseRequest(request, path, "episodeForm");
		
		String insert = "INSERT INTO episode (epname,slabel,elength,epthumb,showfile,snumber) " +
				"VALUES('"+ items.get("epname") +"','"+items.get("slabel")+"','"+items.get("elength")+"','"+items.get("epthumb")
				+"','"+items.get("showfile")+"',"+items.get("showLists").substring(0, items.get("showLists").indexOf("_"))+")";

       //execute insert option to episode table
       Dbutil util = new Dbutil();
       util.update(insert);
       util.releaseConnection();

       response.sendRedirect("tv_show.jsp");
	}

}
