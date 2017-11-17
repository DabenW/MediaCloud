package Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dbutil.Dbutil;

/**
 * Servlet implementation class EditEpisode to provide
 * edit episodes' information
 */
@WebServlet("/EditEpisode")
public class EditEpisode extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = request.getParameter("path");
		String epname = request.getParameter("epname");
		String slabel = request.getParameter("slabel");
		String elength = request.getParameter("elength");
		
        String update = "UPDATE episode SET slabel='"+slabel+"', elength='"+elength+"' WHERE epname='"+epname+"'";
	    
		//execute update option to episode table
		Dbutil util = new Dbutil();
		util.update(update);
	    util.releaseConnection();
	    
	    //return json data
	  	response.setContentType("text/json" + ";charset=UTF-8");
	    response.setHeader("Pragma", "No-cache");
	    response.setHeader("Cache-Control", "no-cache");
	    response.setDateHeader("Expires", 0);
	    PrintWriter writer = response.getWriter();
	    writer.write("{\"epname\":\""+epname+"\","+"\"slabel\":\""+slabel+"\","+"\"elength\":\""+elength+"\"}");
	    writer.flush();
	}
}
