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
 * Servlet implementation class EditShow to provide
 * edit TV shows' information
 */
@WebServlet("/EditShow")
public class EditShow extends HttpServlet {

	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = request.getParameter("path");
		String sname = request.getParameter("sname");
		String genre = request.getParameter("genre");
		String orig = request.getParameter("orig");
		String prod = request.getParameter("prod");
		String sdesc = request.getParameter("sdesc");
		
		String update = "UPDATE tvshow SET genre='"+genre+"',orig='"+orig+"', prod='"+prod+"', sdesc='"+sdesc+"' WHERE id="+path;
		
		//execute update option to tvshow table
		Dbutil util = new Dbutil();
		util.update(update);
		util.releaseConnection();
		
		//return json data
		response.setContentType("text/json" + ";charset=UTF-8");
		response.setHeader("Pragma", "No-cache");
		response.setHeader("Cache-Control", "no-cache");
		response.setDateHeader("Expires", 0);
		PrintWriter writer = response.getWriter();
		writer.write("{\"sname\":\""+sname+"\","+"\"genre\":\""+genre+"\","+"\"orig\":\""+orig+"\","+"\"prod\":\""+prod+"\","+"\"sdesc\":\""+sdesc+"\"}");
		writer.flush();
	}
}
