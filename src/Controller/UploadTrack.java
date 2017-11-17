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
 * Servlet implementation class UploadTrack to provide
 * upload tracks function
 */
@WebServlet("/UploadTrack")
public class UploadTrack extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//get tomcat's path
		String path = request.getSession().getServletContext().getRealPath("");
		
		//Retrieve all fields contents that are submitted by user
		Map<String, String> items = UploadForm.parseRequest(request, path, "musicForm");
		
		String insert = "INSERT INTO track (ttitle,tnumber,tduration,tthumb,musicfile,anumber) " +
				"VALUES('"+ items.get("ttitle") +"','"+items.get("tnumber")+"','"+items.get("tduration")+"','"+items.get("tthumb")+"','"+items.get("musicfile")
				+"',"+items.get("albumLists").substring(0, items.get("albumLists").indexOf("_"))+")";

        //execute insert option to track table
        Dbutil util = new Dbutil();
        util.update(insert);
        util.releaseConnection();

        response.sendRedirect("Music.jsp");
	}
}
