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
 * Servlet implementation class EditTrack to provide
 * edit tracks' information
 */
@WebServlet("/EditTrack")
public class EditTrack extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = request.getParameter("path");
		String ttitle = request.getParameter("ttitle");
		String tnumber = request.getParameter("tnumber");
		String tduration = request.getParameter("tduration");
			
		String update = "UPDATE track SET tnumber='"+tnumber+"', tduration='"+tduration+"' WHERE ttitle='"+ttitle+"'";
		
		//execute update option to track table
		Dbutil util = new Dbutil();
		util.update(update);
	    util.releaseConnection();
	    
	    //return json data
	    response.setContentType("text/json" + ";charset=UTF-8");
	    PrintWriter pw = response.getWriter();
	    pw.write("{\"ttitle\":\""+ttitle+"\","+"\"tnumber\":\""+tnumber+"\","+"\"tduration\":\""+tduration+"\"}");
	    pw.close();
	}

}
