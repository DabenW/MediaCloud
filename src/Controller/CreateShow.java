package Controller;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import Form.UploadForm;
import dbutil.Dbutil;

/**
 * Servlet implementation class CreateShow to provide
 * add TV show information
 */
@WebServlet("/CreateShow")
public class CreateShow extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		       //get tomcat's path
				String path = request.getSession().getServletContext().getRealPath("");
				
				//Retrieve all fields contents that are submitted by user
				Map<String, String> items = UploadForm.parseRequest(request, path, "createShowForm");
				
				String insert = "INSERT INTO tvshow (sname,genre,orig,prod,sdesc,sthumb) VALUES('"+ items.get("sname") +"','"+items.get("genre")+"','"+items.get("orig")+"','"+items.get("prod")
				+"','"+items.get("sdesc")+"','"+items.get("sthumb")+"')";
				
				//execute insert option to show table
				Dbutil util = new Dbutil();
				util.update(insert);
			    util.releaseConnection();
				
			    response.sendRedirect("allFiles.jsp");
	}
}
